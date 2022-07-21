
namespace App.Indexer { 
    class JsonIndexer : LanguageTypeIndexer{

        Regex r_object_start = /\{[.*\n]/;
        Regex r_array_start = /\[[.*\n]/;
        Regex r_object_end = /\}[,\n]/;
        Regex r_array_end = /\][,\n]/;

        public JsonIndexer() {
            base("$", ".");
        }

        public new string[] index_lines (string[] lines){
            return lines;
        }
        
        public new bool is_start_tag(string line){
            assert_nonnull(line);
            return r_object_start.match(line) || r_array_start.match(line);
        }

        public new bool is_end_tag(string line){
            assert_nonnull(line);
            return r_object_end.match(line) || r_array_end.match(line);
        }

        public new string[] parse_line(string line) throws Error{
            return new string[0];
        }
        
    }
    
}