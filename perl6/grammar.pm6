unit module grammar;
# no precompilation;
# use Grammar::ErrorReporting;

grammar Lang is export  {
    rule TOP {
      | <statement>* %% <.eol>
    }

    token ws {
      <!ww> \h*
    }

    token eol {
       [ [ <[\/\/;]> \N* ]? \n ]+
   }

    rule statement {
      | <variable-declaration>
      | <expression>
      | 'class' <word> '{' <.eol> <class-statements>* % <.eol> <.eol> '}'
    }

    rule class-statements {
      | 'prop' <word> 'be' <type>
      | <variable-declaration>
    }

    rule fn-call {
      <fn-name> '(' <calling-arguments>* ')'
    }

    rule variable-declaration {
      | 'let' <word> ['be' | ':'] <type> '=' <declaration>
      | 'let' <word> ['be the' | ':'] <type> <declaration>
    }

    rule declaration {
      | <type>
      | <product-type>
      | <fn-declaration>
      | <module-declaration>
      | <value-or-identifier> <operator> <value-or-identifier>
      | <value-or-identifier>
      | <expression>
    }

    rule product-type {
      | 'where' '{' <.eol> <fn-args> <.eol> '}'
      | '{' <.eol> <fn-args> <.eol> '}'
    }

    rule module-declaration {
      | '{' <.eol> <module-body> <.eol>  '}'
    }

    rule fn-declaration {
      | ['of' | ':'] <type> '(' <fn-args>* ')' '=>' <fn-body-formats>
    }

    rule fn-body-formats {
      | '{' <.eol> <fn-body> <.eol> '}'
      | <expression>
    }

    rule module-body {
      <expression>* % <.eol>
    }

    rule fn-body {
      <expression>* % <.eol>
    }

    rule expression {
      | <variable-declaration>
      | <value-or-identifier> <operator> <value-or-identifier>
      | <value-or-identifier> <comparator> <value-or-identifier>
      | <pattern-match>
      | <fn-call>
      | <conditional>
    }

    rule conditional {
      | 'if' <expression> 'then' <.eol> <expression> <.eol> 'else' <.eol> <expression> <.eol> 'end'
      | 'if' <expression> 'then' <.eol> <expression> <.eol> 'end'
    }

    rule pattern-match {
      'match' <word> 'with' <.eol> <pattern-match-clauses> <.eol> 'end'
    }

    rule pattern-clause {
      | <word> 'when' <expression>
      | <word>
    }

    rule pattern-match-clauses {
      <pattern-match-clause-brace>* % <.eol>
    }

    rule pattern-match-clause-brace {
      <pattern-clause> '=>' <pattern-match-clause-brace-value>
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
      | <word> ['is' | ':'] <type> '=' <value-or-identifier>
      | <word> ['is' | ':'] <type>
    }

    rule type {
      | Int <comparator> <number>
      | Int '~'
      | Int
      | Fn
      | String
      | Universe
      | Module
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
