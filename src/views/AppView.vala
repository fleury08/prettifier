/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;
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
        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView () {
            var settings = App.Configs.Settings.get_instance ();

            //INPUT TEXT
            this.input_text = new Gtk.SourceView ();
            this.input_text.set_wrap_mode (Gtk.WrapMode.WORD);
            this.input_text.buffer.text = settings.input_text ?? _("UNFORMATTED INPUT JSON/XML");
            this.input_text.monospace = true;

            Gtk.ScrolledWindow input_scrolled = new Gtk.ScrolledWindow (null, null);
            input_scrolled.add(input_text);

            //OUTPUT TEXT
            this.output_text = new Gtk.SourceView ();
            this.output_text.set_wrap_mode (Gtk.WrapMode.WORD);
            this.output_text.buffer.text = settings.output_text ?? _("Beautifully formatted JSON or XML");
            this.output_text.editable = false;
            this.output_text.monospace = true;            

            Gtk.ScrolledWindow output_scrolled = new Gtk.ScrolledWindow (null, null);
            output_scrolled.add(output_text);

            //
            this.spacing = 10;
            this.pack_start (input_scrolled, true, true, 0);
            this.pack_start (output_scrolled, true, true, 0);
            this.add(input_scrolled);
            this.add(output_scrolled);
        }
    }
}
