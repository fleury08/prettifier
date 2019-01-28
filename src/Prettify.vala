using App;
using App.Configs;

namespace App{
    public class Prettify : GLib.Object{
        
        public TypeOfFile type_of_file { get; set;}

        public Prettify(){
        }           
    
        public string prettify(string text){
            switch (this.type_of_file) {
            case TypeOfFile.JSON:
                return this.prettify_json(text);
            case TypeOfFile.XML:
                return this.prettify_xml(text);
            default:
                return "BAD FORMAT";
            }
        }

        public string prettify_json(string text){
            Json.Node json;
            try {
                json = Json.from_string(text);
            } catch (Error e) {
                print ("Unable to parse the string:"+e.message+"\n");
                return "";
            }
            return Json.to_string(json,true);
        }

        public string prettify_xml(string text){
            var doc = Xml.Parser.parse_doc(text);
            string pretty_xml;
            int length;
            doc->dump_memory_format(out pretty_xml,out length, true);
            return pretty_xml;
        }

        public bool select_switch_state(TypeOfFile type){
            return type==TypeOfFile.XML;
        }

    }
}
