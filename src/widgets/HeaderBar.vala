/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@pm.me>
*/


namespace App.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Gtk.HeaderBar {


        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see App.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            this.set_title (_("Prettifier"));
            this.show_close_button = true;
        }
    }
}
