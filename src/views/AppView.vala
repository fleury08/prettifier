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

        public Gtk.TextView input_text {get;set;}
        public Gtk.TextView output_text {get;set;}
        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView () {


            //INPUT TEXT
            this.input_text = new Gtk.TextView ();
            this.input_text.set_wrap_mode (Gtk.WrapMode.WORD);
            this.input_text.buffer.text = "UNFORMATTED INPUT JSON/XML";

            Gtk.ScrolledWindow input_scrolled = new Gtk.ScrolledWindow (null, null);
            input_scrolled.add(input_text);

            //OUTPUT TEXT

            this.output_text = new Gtk.TextView ();
            this.output_text.set_wrap_mode (Gtk.WrapMode.WORD);
            this.output_text.buffer.text = "Beautifully formatted JSON or XML";
            this.output_text.editable = false;

            Gtk.ScrolledWindow output_scrolled = new Gtk.ScrolledWindow (null, null);
            output_scrolled.add(output_text);

            //
            this.pack_start (input_scrolled, true, true, 0);
            this.pack_start (output_scrolled, true, true, 0);
            this.add(input_scrolled);
            this.add(output_scrolled);
        }
    }
}
