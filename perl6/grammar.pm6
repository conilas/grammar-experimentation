unit module grammar;

grammar Lang is export  {
    rule TOP {
      <statement>* %% ";"
    }

    rule statement {
      | <variable-declaration>
      | <fn-call>
    }

    rule fn-call {
      <fn-name> '(' <word>* ')'
    }

    rule variable-declaration {
      'let' <word> ':' <type> '=' <declaration>
    }

    rule declaration {
      | <fn-declaration>
      | <value-or-identifier> <operator> <value-or-identifier>
      | <word>
    }

    rule fn-declaration {
      | '(' <fn-args>* ')' '=>' <expression>
    }

    rule expression {
      | <value-or-identifier> <operator> <value-or-identifier>
      | <statement>* %% ";"
    }

    rule fn-args {
      <arguments>+ % ','
    }

    rule arguments {
      | <word> ':' <type>
    }

    rule type {
      | Int <comparator> <number>
      | Int '~'
      | Int
      | Fn
      | String
      | '?'
      | <sum-type-wrap>
    }

    rule sum-type-wrap {
      '(' <sum-types> ')'
    }

    rule sum-types {
      <type>+ % '|'
    }

    token operator {
      | '+'
      | '-'
      | '/'
    }

    token value-or-identifier {
      | <word>
      | <number>
    }

    token fn-name {
      <word>
    }

    token word {
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
