(* lexer.mll -*- tuareg -*- *)
{
  open Parser
  let get = Lexing.lexeme
  exception Eof
}

(* Helpers *)

  let tab   = '\009'
  let cr    = '\013'
  let lf    = '\010'
  let eol   = cr | lf | cr lf

(* Tokens *)

rule token = parse
  | eol                  { token lexbuf }
  | (' ' | tab)          { token lexbuf }
  | '+'                  { PLUS }
  | '-'                  { MINUS }
  | '*'                  { STAR }
  | '/'                  { SLASH }
  | '('                  { LPAR }
  | ')'                  { RPAR }
  | ';'                  { SEMICOLON }
  | '>'                  { GT }
  | '<'                  { LT }
  | eof            { raise Eof }
  | '.' {DOT}
  | ',' {COMMA}
  | '=' {EQUAL}
  | ':' {COLON}
  | '(' {LPAREN}
  | ')' {RPAREN}
  | '{' {LBRACE}
  | '}' {RBRACE}
  | '|' {PIPE}
  | "'" {QUOTE_CHAR }
  | '/' {DIVISION}
  | '-' {MINUS}
  | '+' {PLUS}
  | "=>" {ARROW}
  | "having" { HAVING }
  | "match" { MATCH }
  | "end" { END }
  | "when" { WHEN }
  | "where" {  WHERE }
  | "if" { IFF }
  | "else" { ELSE }
  | "of" { OF }
  | "and" { AMD }
  | "whose" { WHOSE }
  | "with" { WITH }
  | "the" {  THE }
  | "be" { BE }
  | "let" { LET }
  | "is" { IS }
  | "Fn" { FN_TYPE }
  | "String" { STR_TYPE }
  | "Universe" { UNIVERSE_TYPE }
  | "Module" { MODULE_TYPE }
  | "Int" { INT_TYPE }
