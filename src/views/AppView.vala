/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;
using App.Widgets;

namespace App.Views {

    /**
     * The {@code AppView} class.
     *
     * @since 1.0.0
     */
    public class AppView : Gtk.Box {

        /**
         * Constructs a new {@code AppView} object.
         */
        public AppView () {
            var welcome_view = new Granite.Widgets.Welcome (_("Welcome"), _("Open up your editor to get started!"));
            welcome_view.append ("text-x-vala", _("Visit Valadoc"), _("The canonical source for Vala API references."));
            welcome_view.append ("distributor-logo", _("Visit elementary.io"), _("Read up on developing for elementary"));
            welcome_view.activated.connect ((index) => {
                switch (index) {
                    case 0:
                        try {
                            AppInfo.launch_default_for_uri ("https://valadoc.org/", null);
                        } catch (Error e) {
                            warning (e.message);
                        }
    
                        break;
                    case 1:
                        try {
                            AppInfo.launch_default_for_uri ("https://developer.elementary.io", null);
                        } catch (Error e) {
                            warning (e.message);
                        }
    
                        break;
                }
            });

            this.add (welcome_view);
        }
    }
}
