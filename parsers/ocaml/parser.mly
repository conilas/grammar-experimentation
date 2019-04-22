%token <int> INT
%token PLUS MINUS TIMES DIV
%token LPAREN RPAREN
%token EOL
%token  STAR 
%token  SLASH 
%token  LPAR 
%token  RPAR 
%token  SEMICOLON 
%token  GT 
%token  LT 
%token DOT 
%token COMMA
%token EQUAL
%token COLON
%token LBRACE
%token RBRACE
%token PIPE
%token QUOTE_CHAR 
%token DIVISION
%token MINUS
%token PLUS
%token ARROW
%token  HAVING 
%token  MATCH 
%token  END 
%token  WHEN 
%token  WHERE 
%token  IFF 
%token  ELSE 
%token  OF 
%token  AMD 
%token  WHOSE 
%token  WITH 
%token  THE 
%token  BE 
%token  LET 
%token  IS 
%token  FN_TYPE 
%token  STR_TYPE 
%token  UNIVERSE_TYPE 
%token  MODULE_TYPE 
%token  INT_TYPE 
%start main     /* the entry point */
        %type <int> main
        %%
        main:
            expr EOL                { $1 }
        ;
        expr:
            INT                     { $1 }
         | WHERE                    { 0 }
        ;


