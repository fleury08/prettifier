/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
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
        //public KeyFile                    config_file;


        /**
         * Constructs a new {@code AppController} object.
         */
        public AppController (Gtk.Application application) {
            this.application = application;
            this.window = new Window (this.application);
            this.app_view = new AppView ();
            this.headerbar = new HeaderBar (this);

            this.window.add (this.app_view);
            this.window.set_default_size (800, 640);
            this.window.set_size_request (800, 640);
            this.window.set_titlebar (this.headerbar);
            this.application.add_window (window);


           /* this.config_file = new KeyFile();
            print(App.Configs.Constants.CONFIG_PATH+App.Configs.Constants.CONFIG_FILE);
            var file = File.new_for_path(App.Configs.Constants.CONFIG_PATH+App.Configs.Constants.CONFIG_FILE);
            try {
                if(!file.query_exists()) file.create(FileCreateFlags.PRIVATE);
                this.config_file.load_from_file(App.Configs.Constants.CONFIG_PATH+App.Configs.Constants.CONFIG_FILE,KeyFileFlags.NONE);
            } catch (Error e) {
                print ("Error: %s\n", e.message);
            }*/
            
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
