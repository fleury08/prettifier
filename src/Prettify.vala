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
                //print ("Unable to parse the string:"+e.message+"\n");
                return e.message;
            }
            string str = generator.to_data (null);
            return str;
        }

        public string prettify_xml(string text, int indent){
            var doc = Xml.Parser.parse_doc(text);
            var error = Xml.get_last_error().message;
            string pretty_xml;
            int length;
            doc->dump_memory_format(out pretty_xml,out length, true);
            if(length == 0) return error;
            return pretty_xml;
        }

        public bool select_switch_state(TypeOfFile type){
            return type==TypeOfFile.XML;
        }

    }
}
