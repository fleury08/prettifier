/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;

namespace App.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        public signal void menu_clicked ();
        public Gtk.MenuButton menu_button { get; private set; }

        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see App.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar () {
            

            menu_button = new Gtk.MenuButton ();
            menu_button.set_image (new Gtk.Image .from_icon_name ("open-menu-symbolic", Gtk.IconSize.LARGE_TOOLBAR));
            menu_button.tooltip_text = _("Settings");
            menu_button.clicked.connect (() => {
                menu_clicked ();
            });

            this.set_title ("Prettifier");
            this.show_close_button = true;
            this.pack_end (menu_button);
        }
    }
}
