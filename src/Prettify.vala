using App;

namespace App{
    public class Prettify : GLib.Object{
        private string prettify(string text){
            var pretty_text;
            switch (this.type_of_file) {
            case TypeOfFile.JSON:
                return prettify_json(text);
            case TypeOfFile.XML:
                return prettify_xml(text);
            default:
                return "BAD FORMAT";
            }
        }

        private string prettify_json(string text){
            Json.Node json;
            try {
                json = Json.from_string(text);
            } catch (Error e) {
                print ("Unable to parse the string:"+e.message+"\n");
                return "";
            }
            return Json.to_string(json,true);
        }

        private string prettify_xml(string text){
            var doc = Xml.Parser.parse_doc(text);
            string pretty_xml;
            int length;
            doc->dump_memory_format(out pretty_xml,out length, true);
            return pretty_xml;
        }

        private bool select_switch_state(TypeOfFile type){
            return type==TypeOfFile.XML;
        }
    }
}
