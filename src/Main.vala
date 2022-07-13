/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@pm.me>
*/

public class Main {
    private static bool version = false;

    private const OptionEntry[] options = {
        { "version", 0, 0, OptionArg.NONE, ref version, "Display Version Number", null },
        { null }
    };

    /**
     * Main method. Responsible for starting the {@code Application} class.
     *
     * @see App.Application
     * @return {@code int}
     * @since 1.0.0
     */
    public static int main (string [] args) {
        var options_context = new OptionContext 
			(App.Configs.Constants.PROGRAME_NAME +" "+ _("Options"));
        options_context.set_help_enabled (true);
        options_context.add_main_entries (options, null);

        try {
            options_context.parse (ref args);
        }
        catch (Error error) {}
        
        if (version) {
            info (App.Configs.Constants.PROGRAME_NAME 
                           +" "
                           + App.Configs.Constants.VERSION + "\r\n");
            return 0;
        }

        var app = new App.Application ();
        app.run (args);

        return 0;
    }
}
