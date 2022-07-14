using App;
using App.Configs;

namespace App{
    public class Prettify : GLib.Object{
        
        public TypeOfFile type_of_file { get; set;}

        public Prettify(){
        }           
    
        public string prettify(string text, int indent){
            switch (this.type_of_file) {
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
            Json.Node json;
            try {
                json = Json.from_string(text);
                generator.set_root (json);
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
            string prettified_text = this.prettify(input.buffer.text, indent);
            output.buffer.text = prettified_text;
            Application.settings.set_string ("input-text", input.buffer.text);
            Application.settings.set_string ("output-text", output.buffer.text);
        }
    }
}
