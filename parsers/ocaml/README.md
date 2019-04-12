# Ocaml Implementation

This part holds the OCaml lexer + parser implementation. Maybe the grammar will have to change - Perl6 grammars make it so freaking easy to parse it makes me sad. 

As stated in the perl6 version, we had a scanerless top-down parser using the PEG-like constructs from perl6.

In the OCaml version, we use ```ocamllex``` to build the lexer and ```menhir``` to build the LR parser. 
