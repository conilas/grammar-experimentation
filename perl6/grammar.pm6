unit module grammar;

grammar Lang is export  {
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

class LangActions is export {
    # method variable-declaration ($/) {
    #   # say '[' ~ $<variable-name> ~ '] Type: [' ~ $<type> ~ '] Is: [' ~ $<declaration> ~ ']';
    # }
}
