ocamllex lexer.mll | echo      # generates lexer.ml
echo "lexer ok"
ocamlyacc parser.mly | echo    # generates parser.ml and parser.mli
echo "parser ok"
ocamlc -c parser.mli | echo
echo "parser generated"
ocamlc -c lexer.ml  | echo
echo "lexer compiled"
ocamlc -c parser.ml | echo
echo "parser compiler"
ocamlc -c calc.ml | echo
echo "app compiler"
ocamlc -o calc lexer.cmo parser.cmo calc.cmo | echo
