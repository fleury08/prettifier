/*
* Copyright (C) 2018  Jaroslav Staněk <jaroslav-stanek@email.cz>
*/

namespace App.Tests {

    /**
     * The {@code Testing} class is entry point for unit and UI testing for the application
     *
     * @since 1.0.0
     */
    public class Testing {
        public Testing (string[] args) {
            Test.init (ref args);

            // Example test
            Test.add_data_func ("/init", () => {
                Assert.string_compare ("Test", "Test");
                Assert.bool_compare (true, true);
                Assert.true (true);
                Assert.false (false);
                Assert.int_compare (5, 5);
                Assert.float_compare (5.2f, 6.4f, "!=");
                Assert.double_compare (8.8, 8.8, "<=");
            });
        }

        public void run () {
            Test.run ();
        }
    }
}
