/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

using App.Configs;

namespace App.Widgets {

    /**
     * The {@code HeaderBar} class is responsible for displaying top bar. Similar to a horizontal box.
     *
     * @see Gtk.HeaderBar
     * @since 1.0.0
     */
    public class HeaderBar : Gtk.HeaderBar {

        
        public Gtk.Button prettify_button { get; private set;}
        public Gtk.Switch format_switch { get; private set;}
        public Gtk.Button copy_to_clipboard {get; private set;}
        public Gtk.Button reset_button {get; private set;}
        public Gtk.CheckButton auto_prettify {get; private set;}
        private TypeOfFile type_of_file { get; private set;}
        private App.Controllers.AppController app {get; private set;}
        private App.Configs.Settings settings {get; private set;}

        /**
         * Constructs a new {@code HeaderBar} object.
         *
         * @see App.Configs.Properties
         * @see icon_settings
         */
        public HeaderBar (App.Controllers.AppController app) {
            //Initialization of properties of "this"
            init_headerbar(app);
            
            //Prettify Button setup
            this.prettify_button.set_image (new Gtk.Image .from_icon_name ("media-playback-start", Gtk.IconSize.LARGE_TOOLBAR));
            this.prettify_button.tooltip_text = _("Prettify input text");
            this.prettify_button.clicked.connect (() => {
                prettify_action();
            });

            //Copy to clipboard button setup
            this.copy_to_clipboard.set_image (new Gtk.Image .from_icon_name ("edit-copy", Gtk.IconSize.LARGE_TOOLBAR));
            this.copy_to_clipboard.tooltip_text = _("Copy output to clipboard");
            this.copy_to_clipboard.clicked.connect (()=>{
                var clipboard = Gtk.Clipboard.get_default(app.window.get_display());
                clipboard.set_text(this.app.app_view.output_text.buffer.text,-1);
            });


            //Format switch setup
            this.format_switch.valign = Gtk.Align.CENTER;
            if(select_switch_state(this.settings.selected_format)){
                this.format_switch.activate();
                this.format_switch.active=true;
            }
            this.format_switch.notify["active"].connect (() => {
                if (format_switch.active) {
                    this.type_of_file = TypeOfFile.XML;
                } else {
                    this.type_of_file = TypeOfFile.JSON;
                }
                this.settings.selected_format=this.type_of_file;
                print("\nFormat is saved as:"+settings.selected_format.to_string());
                print("\nFormat is set to :"+type_of_file.to_string());
            });
            
            //Auto prettify button setup
            this.auto_prettify.active = this.settings.auto_prettify;
            this.auto_prettify.notify["active"].connect(()=>{
                this.settings.auto_prettify = this.auto_prettify.active;
                if(auto_prettify.active) prettify_action();
            });


            //Reset button setup
            this.reset_button.set_image (new Gtk.Image .from_icon_name ("edit-clear", Gtk.IconSize.LARGE_TOOLBAR));
            this.reset_button.tooltip_text = _("Clears out input and output window");
            this.reset_button.clicked.connect (()=>{
                this.app.app_view.output_text.buffer.text = "";
                this.app.app_view.input_text.buffer.text = "";
            });

            //Hook to autoprettify if input text is changed
            this.app.app_view.input_text.buffer.changed.connect(()=>{
                if(auto_prettify.active) prettify_action();
            });

            //Assembly headerbar 
            assembly_headbar();
        }

        private void init_headerbar(App.Controllers.AppController app){
            this.app = app;
            this.settings = App.Configs.Settings.get_instance ();
            this.prettify_button = new Gtk.Button();
            this.copy_to_clipboard = new Gtk.Button();
            this.format_switch = new Gtk.Switch();
            this.auto_prettify = new Gtk.CheckButton.with_label(_("Auto Prettify"));
            this.reset_button = new Gtk.Button();
        }

        private void assembly_headbar(){
            this.set_title (_("Prettifier"));
            this.show_close_button = true;
            this.pack_end (new Gtk.Label("XML"));
            this.pack_end (format_switch);
            this.pack_end (new Gtk.Label("JSON"));
            this.pack_start (prettify_button);
            this.pack_start (copy_to_clipboard);
            this.pack_start (reset_button);
            this.pack_start (auto_prettify);
        }

        private void prettify_action(){
            string prettified_text = this.prettify(this.app.app_view.input_text.buffer.text);
            this.app.app_view.output_text.buffer.text = prettified_text;

            this.settings.input_text = this.app.app_view.input_text.buffer.text;
            this.settings.output_text = this.app.app_view.output_text.buffer.text;
        }

        

    }
}
