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
      'let' <variable-name> ':' <type> '=' <declaration>
    }

    rule declaration {
      | '() => return ' <val>
      | <val>
    }

    rule type {
      | Int <comparator> <number>
      | Int
      | Fn
      | String
    }

    token variable-name {
      \w+
    }

    token val {
      \w+
    }

    token number {
      \d+
    }

    token comparator {
      | '>'
      | '<'
    }

}

class LangActions {
    method variable-declaration ($/) {
      say '[' ~ $<variable-name> ~ '] Type: [' ~ $<type> ~ '] Is: [' ~ $<declaration> ~ ']';
    }
}


Lang.parse($test, actions => LangActions.new)
