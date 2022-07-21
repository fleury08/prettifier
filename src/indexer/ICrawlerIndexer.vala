namespace App.Indexer{
    interface ICrawlerIndexer {
        public abstract string[] crawl_string_and_index(string source);
        public abstract string[] index_lines (string[] lines);
        public abstract bool is_start_tag(string line);
        public abstract bool is_end_tag(string line);
        public abstract string[] parse_line(string line) throws Error;
    }
}