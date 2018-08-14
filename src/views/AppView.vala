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

            // A ScrolledWindow:
            Gtk.ScrolledWindow input_scrolled = new Gtk.ScrolledWindow (null, null);
            this.pack_start (input_scrolled, true, true, 0);

            this.input_text = new Gtk.TextView ();
            input_text.set_wrap_mode (Gtk.WrapMode.WORD);
            input_text.buffer.text = "Lorem Ipsum";
            input_scrolled.add(input_text);

            // A ScrolledWindow:
            Gtk.ScrolledWindow output_scrolled = new Gtk.ScrolledWindow (null, null);
            this.pack_start (output_scrolled, true, true, 0);

            this.output_text = new Gtk.TextView ();
            output_text.set_wrap_mode (Gtk.WrapMode.WORD);
            output_text.buffer.text = "Lorem Ipsum";
            output_scrolled.add(output_text);


            this.add(input_scrolled);
            this.add(output_scrolled);
        }
    }
}
