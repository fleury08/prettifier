/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;
using App.Controllers;
using App.Views;

namespace App {

    /**
     * Class responsible for creating the u window and will contain contain other widgets. 
     * allowing the user to manipulate the window (resize it, move it, close it, ...).
     *
     * @see Gtk.ApplicationWindow
     * @since 1.0.0
     */
    public class Window : Gtk.ApplicationWindow {
         
        /**
         * Constructs a new {@code Window} object.
         *
         * @see App.Configs.Constants
         * @see style_provider
         * @see build
         */
        public Window (Gtk.Application app) {
            Object (
                application: app,
                icon_name: Constants.APP_ICON,
                resizable: true
            );

            
            int x = Application.settings.get_int ("window-x");
            int y = Application.settings.get_int ("window-y");

            if (x != -1 && y != -1) {
                move (x, y);
            }

            var css_provider = new Gtk.CssProvider ();
            css_provider.load_from_resource (Constants.URL_CSS);
            
            Gtk.StyleContext.add_provider_for_screen (
                Gdk.Screen.get_default (),
                css_provider,
                Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION
            );

            // Save the window's position on close
            delete_event.connect (() => {
                int root_x, root_y;
                get_position (out root_x, out root_y);

                Application.settings.set_int ("window-x", root_x);
                Application.settings.set_int ("window-y", root_y);
                return false;
            });
        }
    }
}
