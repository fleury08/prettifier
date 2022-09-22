/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@pm.me>
*/
using Gtk;
using App.Configs;
using App.Indexer;
using App.Widgets;

namespace App.Views {

    /**
     * The {@code AppView} class.
     *
     * @since 1.0.0
     */
    public class AppView : Gtk.Box {

        public Gtk.SourceView input_text {get;set;}
        public Gtk.SourceView output_text {get;set;}
        public App.Prettify prettify {get;set;}
        public App.Widgets.ControlPanel control_panel {get;set;}

        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView (App.Controllers.AppController app) {
            this.set_orientation (Gtk.Orientation.VERTICAL);
            var inputs_panes = new Gtk.Paned(Gtk.Orientation.HORIZONTAL);
            this.control_panel = new ControlPanel (app);
            this.prettify = new Prettify ();

            //INPUT TEXT
            this.input_text = new Gtk.SourceView ();
            this.input_text.set_wrap_mode (Gtk.WrapMode.WORD);
            this.input_text.set_show_line_numbers (true);
            this.input_text.get_buffer().set_text(Application.settings.get_string ("input-text") ?? _("UNFORMATTED INPUT JSON/XML"));
            this.input_text.set_monospace(true);
            this.input_text.get_buffer().changed.connect(()=>{
                if(Application.settings.get_boolean("auto-prettify")) this.run_prettify();
            });

            Gtk.ScrolledWindow input_scrolled = new Gtk.ScrolledWindow (null, null);
            input_scrolled.add(input_text);

            //OUTPUT TEXT
            this.output_text = new Gtk.SourceView ();
            this.output_text.set_wrap_mode (Gtk.WrapMode.WORD);
            this.output_text.set_show_line_numbers (true);
            this.output_text.get_buffer().set_text(Application.settings.get_string ("output-text") ?? _("Beautifully formatted JSON or XML"));
            this.output_text.set_editable(false);
            this.output_text.set_monospace(true);
            this.output_text.get_buffer().changed.connect(()=>{
               JsonIndexer ji = new JsonIndexer();
               ji.crawl_string_and_index(this.output_text.get_buffer().text);
            });
            this.output_text.move_cursor.connect_after(()=>{
                TextMark mark = this.output_text.get_buffer().get_insert();
                TextIter iter;
                this.output_text.get_buffer().get_iter_at_mark(out iter, mark);
                stdout.printf ("row: %d \n", iter.get_line()+1);
                stdout.flush();
            });

            Gtk.ScrolledWindow output_scrolled = new Gtk.ScrolledWindow (null, null);
            output_scrolled.add(output_text);
            inputs_panes.add1(input_scrolled);
            inputs_panes.add2(output_scrolled);
            inputs_panes.set_position(Application.settings.get_int("separator-position"));
            inputs_panes.size_allocate.connect(()=>{
                Application.settings.set_int ("separator-position", inputs_panes.get_position());
            });
            

            this.pack_start (control_panel,false);
            this.pack_start (inputs_panes);
            this.add (control_panel);
            this.add (inputs_panes);
            
        }

        public void run_prettify(){
            this.prettify.prettify_action(this.input_text, this.output_text, Application.settings.get_int ("indent-num"));
        }
    }

}
