
namespace App.Parser{ 
    public class JSONPathParser : Object {
        public JSONPathParser(Json.Node node) {
            Json.Reader reader = new Json.Reader(node);
            foreach (string member in reader.list_members ()) {
                stdout.printf (member);   
            }
        }
    }
}
