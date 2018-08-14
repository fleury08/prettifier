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
        public Gtk.Button prettify_button { get; private set;}
        private App.Views.AppView app_view {get;set;}

        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see App.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar (App.Views.AppView app_view) {
            this.app_view = app_view;

            this.prettify_button = new Gtk.Button();
            this.prettify_button.set_image (new Gtk.Image .from_icon_name ("media-playback-start", Gtk.IconSize.LARGE_TOOLBAR));
            this.prettify_button.tooltip_text = _("Prettify");
            this.prettify_button.clicked.connect (() => {
                this.prettify(TypeOfFile.JSON,this.app_view.input_text.buffer.text);
            });

            this.menu_button = new Gtk.MenuButton ();
            this.menu_button.set_image (new Gtk.Image .from_icon_name ("open-menu-symbolic", Gtk.IconSize.LARGE_TOOLBAR));
            this.menu_button.tooltip_text = _("Settings");
            this.menu_button.clicked.connect (() => {
                this.menu_clicked ();
            });

            this.set_title ("Prettifier");
            this.show_close_button = true;
            this.pack_start (prettify_button);
            this.pack_end (menu_button);
        }

        private TypeOfFile findOutTypeOfFile(string text){
            
        }

        private string prettify(TypeOfFile filetype, string text){
            print(text);
            switch (filetype) {
            case TypeOfFile.JSON:
                return "JSON";
            case TypeOfFile.XML:
                return "XML";
            default:
                return "NONE";
            }
        }
    }
}
