/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;
using App.Controllers;

namespace App {
    public class Application : Gtk.Application {

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

        construct {
            var quit_action = new SimpleAction ("quit", null);
            quit_action.activate.connect (() => {
                controller.quit ();
            });

            add_action (quit_action);
            set_accels_for_action ("app.quit", { "<Control>q" });
        }

        /**
         * Handle attempts to start up the application
         * @return {@code void}
         */
        public override void activate () {
            if (controller == null) {
                controller = new AppController (this);
            }
            
            controller.activate ();
        }
    }
}
