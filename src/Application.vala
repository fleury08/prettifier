/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;
using App.Controllers;

namespace App {
    public class Application : Gtk.Application {
        public static GLib.Settings settings = new GLib.Settings (Constants.ID);

        public AppController controller;

        /**
         * Constructs a new {@code Application} object.
         */
        public Application () {
            Object (
                application_id: Constants.ID,
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        /**
         * Handle attempts to start up the application
         * @return {@code void}
         */
        public override void activate () {
            
            //Dark theme support
            var granite_settings = Granite.Settings.get_default ();
            var gtk_settings = Gtk.Settings.get_default ();

            gtk_settings.gtk_application_prefer_dark_theme = granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK;

            granite_settings.notify["prefers-color-scheme"].connect (() => {
                gtk_settings.gtk_application_prefer_dark_theme = granite_settings.prefers_color_scheme == Granite.Settings.ColorScheme.DARK;
            });

            if (controller == null) {
                controller = new AppController (this);
            }

            controller.activate ();
        }
    }
}
