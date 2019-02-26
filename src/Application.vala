/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;
using App.Controllers;

namespace App {

    /**
     * The {@code Application} class is a foundation for all granite-based applications.
     *
     * @see Granite.Application
     * @since 1.0.0
     */
    public class Application : Granite.Application {

        public AppController controller;

        /**
         * Constructs a new {@code Application} object.
         */
        public Application () {
            Object (
                application_id: Constants.ID,
                flags: ApplicationFlags.FLAGS_NONE
            );

            var quit_action = new SimpleAction ("quit", null);
            quit_action.activate.connect (() => {
                controller.quit ();
            });

            add_action (quit_action);
            add_accelerator ("<Control>q", "app.quit", null);

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
