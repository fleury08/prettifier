/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

namespace App.Configs {

    /**
     * The {@code Constants} class is responsible for defining all 
     * the constants used in the application.
     *
     * @since 1.0.0
     */
    public class Constants {
    
        public abstract const string ID = "com.github.fleury08.prettifier";
        public abstract const string VERSION = "1.0.0";
        public abstract const string PROGRAME_NAME = "Prettifier";
        public abstract const string APP_YEARS = "2018";
        public abstract const string APP_ICON = "com.github.fleury08.prettifier";
        public abstract const string ABOUT_COMMENTS = "Prettify your JSON/XML outputs";
        public abstract const string TRANSLATOR_CREDITS = "Translators";
        public abstract const string MAIN_URL = "{{ website-url }}";
        public abstract const string BUG_URL = "https://github.com/fleury08/prettifier/issues";
        public abstract const string HELP_URL = "https://github.com/fleury08/prettifier/wiki";
        public abstract const string TRANSLATE_URL = "https://github.com/fleury08/prettifier";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE = "Website";
        public abstract const string TEXT_FOR_ABOUT_DIALOG_WEBSITE_URL = "{{ website-url }}";
        public abstract const string URL_CSS = "/com/github/fleury08/prettifier/css/style.css";
        public abstract const string [] ABOUT_AUTHORS = { "Jaroslav Staněk <jaroslav-stanek@email.cz>" };
        public abstract const Gtk.License ABOUT_LICENSE_TYPE = Gtk.License.MIT_X11;
        public abstract const string CONFIG_PATH = "~/";
        public abstract const string CONFIG_FILE = ".prettifier.conf";

    }
}
