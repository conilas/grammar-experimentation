unit module grammar;
# no precompilation;
# use Grammar::Tracer;

grammar Lang is export  {
    rule TOP {
      | <statement>* %% <.eol>
    }

    rule statement {
      | <variable-declaration>
      | <expression>
    }

    rule fn-call {
      <fn-name> <lparen> <calling-arguments>* <rparen>
    }

    rule variable-declaration {
      | <let> <word> [<be> | <colon>] <type> <equal> <declaration>
      | <let> <word> [<be> <the> | <colon>] <type> <declaration>
      | <let> <word> <be> <declaration>
      | <let> <word> <equal> <declaration>
    }

    rule declaration {
      | <expression>
      | <type>
      | <product-type>
      | <product-type-instantiation>
      | <fn-declaration>
      | <module-declaration>
      | <value-or-identifier> <operator> <value-or-identifier>
      | <value-or-identifier>
    }

    rule product-type-instantiation {
      | <whose> <product-type-values>
      | <with> <product-type-direct-values>
    }

    rule product-type-direct-values {
      <word>+ % <separator>
    }

    rule product-type-values {
      <product-arg-values>+ % <separator>
    }

    token separator {
      | <comma>
      | <and>
    }

    rule product-arg-values {
      | <word> [<is> | <colon>] <value-or-identifier>
    }

    rule product-type {
      | <where> <lbrace> <.eol> <fn-args> <.eol> <rbrace>
      | <lbrace> <.eol> <fn-args> <.eol> <rbrace>
    }

    rule module-declaration {
      | <lbrace> <.eol> <module-body> <.eol>  <rbrace>
    }

    rule fn-declaration {
      | [<of> | <colon>] <type> <lparen> <fn-args>* <rparen> <arrow> <fn-body-formats>
    }

    rule fn-body-formats {
      | <lbrace> <.eol> <fn-body> <.eol> <rbrace>
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
      | <product-member-access>
      | <pattern-match>
      | <fn-call>
      | <conditional>
    }

    rule product-member-access {
      | <word> <dot> <word>
    }

    rule conditional {
      | <iff> <expression> <lbrace> <.eol> <expression> <.eol> <rbrace> <else> <lbrace> <.eol> <expression> <.eol> <rbrace>
      | <iff> <expression> <lbrace> <.eol> <expression> <.eol> <rbrace>
    }

    rule pattern-match {
      <match> <word> <with> <.eol> <pattern-match-clauses> <.eol> <end>
    }

    rule pattern-clause {
      | <word> <when> <expression>
      | <word>
    }

    rule pattern-match-clauses {
      <pattern-match-clause-brace>* % <.eol>
    }

    rule pattern-match-clause-brace {
      <pattern-clause> <arrow> <pattern-match-clause-brace-value>
    }

    rule pattern-match-clause-brace-value {
      | <expression>
      | <word>
    }

    rule fn-args {
      <fn-arg-decl>+ % <colon>
    }

    rule calling-arguments {
      | <value-or-identifier>+ % <colon>
      | <expression>
    }

    rule fn-arg-decl {
      | <word> [<is> | <colon>] <type> <equal> <value-or-identifier>
      | <word> [<is> | <colon>] <type>
    }

    rule type {
      | <int-type> <comparator> <number>
      | <int-type>
      | <fn-type>
      | <string-type>
      | <universe-type>
      | <module-type>
      | <sum-type-wrap>
      | \w+
    }

    rule sum-type-wrap {
      <lparen> <sum-types> <rparen>
    }

    rule sum-types {
      <type>+ % <pipe>
    }

    rule value-or-identifier {
      | <product-member-access>
      | <number>
      | <word>
      | <quoted-string>
    }

    rule quoted-string {
      | <quote-char> <word> <quote-char>
      | <quote-char> <word> <quote-char>
    }

    rule fn-name {
      <word>
    }

    rule comparator {
      | <greater>
      | <smaller>
    }

    rule operator {
      | <division>
      | <minus>
      | <plus>
    }

    ###########################################################################
    #
    # TOKENS OF THE LANGUAGE - Despite it is not necessary to separate all
    # tokens on the perl grammar, it helps organizing code & will help building
    # parsers with actual lexers
    #
    ###########################################################################

    token ws {
      <!ww> \h*
    }

    token eol {
       [ [ <[\/\/;]> \N* ]? \n ]+
    }

    token word {
      \w+
    }

    token number {
      \d+
    }

    token match {
      'match'
    }

    token end {
      'end'
    }

    token when {
      'when'
    }

    token dot {
      '.'
    }

    token where {
      'where'
    }

    token iff {
      'if'
    }

    token else {
      'else'
    }

    token arrow {
      '=>'
    }

    token of {
      'of'
    }

    token and {
      'and'
    }

    token whose {
      'whose'
    }

    token with {
      'with'
    }

    token comma {
      ','
    }

    token equal {
      '='
    }

    token colon {
      ':'
    }

    token the {
      'the'
    }

    token be {
      'be'
    }

    token let {
      'let'
    }

    token is {
      'is'
    }

    token fn-type {
      'Fn'
    }

    token string-type {
      'String'
    }

    token universe-type {
      'Universe'
    }

    token module-type {
      'Module'
    }

    token int-type {
      'Int'
    }

    token lparen {
      '('
    }

    token rparen {
      ')'
    }

    token lbrace {
      '{'
    }

    token rbrace {
      '}'
    }

    token pipe {
      '|'
    }

    token quote-char {
      | "'"
      | '"'
    }

    token division {
      '/'
    }

    token minus {
      '-'
    }

    token plus {
      '+'
    }

    token greater {
      '>'
    }

    token smaller {
      '<'
    }
}
