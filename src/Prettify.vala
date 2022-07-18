using App;
using App.Configs;

namespace App{
    public class Prettify : GLib.Object{
        
        public Json.Node json;

        public Prettify(){
        }           
    
        public string prettify(string text, int indent){
            switch (this.get_type_of_file()) {
            case TypeOfFile.JSON:
                return this.prettify_json(text, indent);
            case TypeOfFile.XML:
                return this.prettify_xml(text, indent);
            default:
                return "BAD FORMAT";
            }
        }

        public string prettify_json(string text, int indent){
            Json.Generator generator = new Json.Generator ();
            this.json = null;
            try {
                this.json = Json.from_string(text);
                generator.set_root (this.json);
                generator.set_pretty (true);
                generator.set_indent (indent);
            } catch (Error e) {
                return e.message;
            }
            string str = generator.to_data (null);
            return str;
        }

        public string prettify_xml(string text, int indent){
            if(text.length == 0) return "";
            var doc = Xml.Parser.parse_doc(text);
            string pretty_xml;
            int length;
            doc->dump_memory_format(out pretty_xml,out length, true);
            if(length == 0) return Xml.get_last_error().message;
            return pretty_xml;
        }
        
        public void prettify_action(Gtk.SourceView input, Gtk.SourceView output, int indent){
            output.buffer.text = this.prettify(input.buffer.text, indent);
            Application.settings.set_string ("input-text", input.buffer.text);
            Application.settings.set_string ("output-text", output.buffer.text);
        }

        public TypeOfFile get_type_of_file(){
            return (TypeOfFile)Application.settings.get_enum("selected-format");
        }

        public void set_type_of_file(TypeOfFile tof){
            Application.settings.set_enum("selected-format", tof);
        }

    }
}
