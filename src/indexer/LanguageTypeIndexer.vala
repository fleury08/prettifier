
namespace App.Indexer { 
    class LanguageTypeIndexer : Object {
        private string root_sign {get;set;}
        private string separator {get;set;}
        private string line_splitter {get;set;}
        private string source {get;set;}
        public string[] paths {get;set;}
        
        public LanguageTypeIndexer(string root_sign,string separator, string line_splitter="\n") {
            assert_nonnull(root_sign);
            assert_nonnull(separator);
            this.root_sign = root_sign;
            this.separator = separator;
            this.line_splitter = line_splitter;
        }


        public string[] crawl_string_and_index(string source){
            assert_nonnull(source);
            string[] lines = source.split(this.line_splitter);
            foreach (string line in lines){
                stdout.printf (line+"\n");
                stdout.flush();
            }
            return lines;
        }

    }
}
