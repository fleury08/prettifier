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
        public Gtk.SpinButton indent_num {get; private set;}
        public Gtk.CheckButton auto_prettify {get; private set;}
        private App.Controllers.AppController app {get; private set;}
        private App.Prettify prettify {get; private set;}

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
            this.format_switch.notify["active"].connect (() => {
                if (format_switch.active) {
                    prettify.type_of_file = TypeOfFile.XML;
                } else {
                    prettify.type_of_file = TypeOfFile.JSON;
                }
                Application.settings.set_enum ("selected-format", prettify.type_of_file);
                print("\nFormat is saved as:"+((App.Configs.TypeOfFile)Application.settings.get_enum ("selected-format")).to_string());
                print("\nFormat is set to :"+prettify.type_of_file.to_string());
            });

            if(this.prettify.select_switch_state((App.Configs.TypeOfFile)Application.settings.get_enum ("selected-format"))){
                this.format_switch.activate();
                this.format_switch.active=true;
            }
            
            //Auto prettify button setup
            this.auto_prettify.active = Application.settings.get_boolean ("auto-prettify");
            this.auto_prettify.notify["active"].connect(()=>{
                Application.settings.set_boolean ("auto-prettify", this.auto_prettify.active);
                if(auto_prettify.active) prettify_action();
            });

            //indentation value
            
            this.indent_num.notify["active"].connect(()=>{
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
            this.prettify_button = new Gtk.Button();
            this.copy_to_clipboard = new Gtk.Button();
            this.indent_num = new Gtk.SpinButton.with_range(0, 10.0, 1.0);
            this.format_switch = new Gtk.Switch();
            this.auto_prettify = new Gtk.CheckButton.with_label(_("Auto Prettify"));
            this.reset_button = new Gtk.Button();
            this.prettify = new Prettify();
        }

        private void assembly_headbar(){
            this.set_title (_("Prettifier"));
            this.show_close_button = true;
            this.pack_end (new Gtk.Label("XML"));
            this.pack_end (format_switch);
            this.pack_end (new Gtk.Label("JSON"));
            this.pack_end (indent_num);
            this.pack_start (prettify_button);
            this.pack_start (copy_to_clipboard);
            this.pack_start (reset_button);
            this.pack_start (auto_prettify);
        }

        private void prettify_action(){
            string prettified_text = this.prettify.prettify(this.app.app_view.input_text.buffer.text, this.indent_num.get_value_as_int());
            this.app.app_view.output_text.buffer.text = prettified_text;

            Application.settings.set_string ("input-text", this.app.app_view.input_text.buffer.text);
            Application.settings.set_string ("output-text", this.app.app_view.output_text.buffer.text);
        }

    
        

    }
}
