/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@pm.me>
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
            //load action for color scheme
            change_color_scheme((ColorScheme)Application.settings.get_string ("color-scheme"));
            Granite.Settings.get_default ().notify["prefers-color-scheme"].connect (() => {
                //automatic change of theme
                change_color_scheme((ColorScheme)Application.settings.get_string ("color-scheme"));
            });

            if (controller == null) {
                controller = new AppController (this);
            }

            controller.activate ();
        }

        public static void change_color_scheme(ColorScheme color_scheme){
            settings.set_enum ("color-scheme", color_scheme);
            stdout.printf (Application.settings.get_string ("color-scheme"));
            var gtk_settings = Gtk.Settings.get_default ();
            switch (color_scheme) {
            case ColorScheme.DARK:
                gtk_settings.gtk_application_prefer_dark_theme = true;
                break;
            case ColorScheme.LIGHT:
                gtk_settings.gtk_application_prefer_dark_theme = Granite.Settings.ColorScheme.;
                break;
            default:
                gtk_settings.gtk_application_prefer_dark_theme = Granite.Settings.get_default().prefers_color_scheme == Granite.Settings.ColorScheme.DARK;
                break;
            }
        }
    }
}
