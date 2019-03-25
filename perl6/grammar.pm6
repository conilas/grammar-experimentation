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
      | <fn-declaration>
      | <val>
    }

    rule fn-declaration {
      | '(' <fn-args>* ')' '=>' <expression>
    }

    rule expression {
      | <value-or-identifier> <operator> <value-or-identifier>
    }

    rule fn-args {
      <arguments>+ % ','
    }

    rule arguments {
      | <variable-name> ':' <type>
    }

    rule type {
      | Int <comparator> <number>
      | Int
      | Fn
      | String
    }

    token operator {
      | '+'
      | '-'
      | '/'
    }

    token value-or-identifier {
      | <variable-name>
      | <number>
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
