unit module grammar;
# no precompilation;
# use Grammar::Debugger;

grammar Lang is export  {
    rule TOP {
      # | "//" ?'a'?*
      | <statement>* %% <.eol>
    }

    token ws { <!ww> \h* }

    token eol {
       [ [ <[\/\/;]> \N* ]? \n ]+
   }

    rule statement {
      | <variable-declaration>
      | <expression>
    }

    rule fn-call {
      <fn-name> '(' <calling-arguments>* ')'
    }

    rule variable-declaration {
      'let' <word> ':' <type> '=' <declaration>
    }

    rule declaration {
      | <fn-declaration>
      | <value-or-identifier> <operator> <value-or-identifier>
      | <value-or-identifier>
      | <expression>
      | <type>
    }

    rule fn-declaration {
      | '(' <fn-args>* ')' '=>' <fn-body-formats>
    }

    rule fn-body-formats {
      | '{' <.eol> <fn-body> <.eol> '}'
      | <expression>
    }

    rule fn-body {
      <expression>* % <.eol>
    }

    rule expression {
      | <variable-declaration>
      | <value-or-identifier> <operator> <value-or-identifier>
      | <pattern-match>
      | <fn-call>
    }

    rule pattern-match {
      'match' <word> '{' <pattern-match-clauses>* '}'
    }

    rule pattern-match-clauses {
      <pattern-match-clause-brace>+ %% ';'
    }

    rule pattern-match-clause-brace {
      <word> '=>' <pattern-match-clause-brace-value>
    }

    rule pattern-match-clause-brace-value {
      | <expression>
      | <word>
    }

    rule fn-args {
      <arguments>+ % ','
    }

    rule calling-arguments {
      | <value-or-identifier>+ % ','
      | <expression>
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
      | Universe
      | '?'
      | <sum-type-wrap>
      | \w+
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
      | <number>
      | <word>
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
