/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

public class Main {
    private static bool testing = false;
    private static bool version = false;

    private const OptionEntry[] options = {
        { "version", 0, 0, OptionArg.NONE, ref version, "Display Version Number", null },
        { "run-tests", 0, 0, OptionArg.NONE, ref testing, "Run testing", null},
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
        var options_context = new OptionContext (App.Configs.Constants.PROGRAME_NAME +" "+ _("Options"));
        options_context.set_help_enabled (true);
        options_context.add_main_entries (options, null);

        try {
            options_context.parse (ref args);
        }
        catch (Error error) {}
        
        if (version) {
            stdout.printf (App.Configs.Constants.PROGRAME_NAME +" "+ App.Configs.Constants.VERSION + "\r\n");
            return 0;
        }

        if (testing) {
            Gtk.init (ref args);
            var testing = new App.Tests.Testing (args);
            Idle.add (() => {
                testing.run ();
                Gtk.main_quit ();

                return false;
            });
            
            Gtk.main ();
        }
        else {
            var app = new App.Application ();
            app.run (args);
        }

        return 0;
    }
}
