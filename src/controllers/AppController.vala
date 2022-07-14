/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@pm.me>
*/

using App.Widgets;
using App.Views;

namespace App.Controllers {

    /**
     * The {@code AppController} class.
     *
     * @since 1.0.0
     */
    public class AppController {

        public Gtk.Application            application;
        public AppView                    app_view;
        public Gtk.HeaderBar              headerbar;
        public Gtk.ApplicationWindow      window { get; private set; default = null; }


        /**
         * Constructs a new {@code AppController} object.
         */
        public AppController (Gtk.Application application) {
            this.application = application;
            this.window = new Window (this.application);
            this.app_view = new AppView (this);
            this.headerbar = new HeaderBar ();


            this.window.add (this.app_view);
            this.window.set_default_size (800, 640);
            this.window.set_size_request (800, 640);
            this.window.set_titlebar (this.headerbar);
            this.application.add_window (window);
        }

        public void activate () {
            window.show_all ();
            app_view.activate ();
        }

        public void quit () {
            window.destroy ();
        }


    }
}
