my $fh = open "file_test.boll", :r;
my $test = $fh.slurp;
$fh.close;

grammar Lang {
    rule TOP {
      <statement>* %% ";"
    }

    rule statement {
      <variable-declaration>
    }

    rule variable-declaration {
      'let' <variable-name> ':' <type> '=' <val>
    }


    token variable-name{
      \w+
    }

    token val {
      \w+
    }

    token type {
      \w+
    }
}


say Lang.parse($test)
