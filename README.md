# {LANG_NAME}

This project contains a parser for the language I'm working on. Still don't have a name. The idea of the project is to use dependent/refined types, current features of modern languages (pattern matching, expression-oriented, ADTs - union, products and such, ...) and add a close-to-human syntax.

The syntax documentation is in ```syntax.md``` file. This file will document the project structure, the goals and inspirations for this project.

# Project structure

```TBD``` :-)

# Code demonstration

For some code samples, please refer to the ```examples``` folder.

# Goals and non-goals

## What we cover (syntactically speaking)

* Product types; (Inspired by records in F# or structs in Rust)
* Sum types; (Inspired by Crystal and Pony)
* Refined types; (Liquid haskell inspired, but not that advanced)
  * Refined ints added with comparators;
  * Refined strings added based on https://github.com/Microsoft/BosqueLanguage/blob/master/docs/language/overview.md#1.1.2-Typed-Strings
* Modules; (Still defining. Maybe mesa-like?)
* Higher-order types; (Inspired by The Little Typer and its PieLang)
* Higher-order function; (The syntax of function declaration is heavily inspired by JS)
* Default parameters; (Python style)
* Pattern match with guards; (OCaml style)

## What we must cover

* Dependent types; (how?) (Idris style);
* Tuples; (Me.. every decent language style I guess?);
* Parametric polymorphism; (aka generics) (This one is hard! ML Style? Swift Style? C++ style with Concepts?);
* Named parameters; (maybe this one is easy) (Python style!);
* A decent syntax-highlight for Vim, emacs or wichever is easier;
* Some way, shape of form of concurrency (CSP, Actors, Futures?); (Go/Pony/Elixir/JS style);
* Pipe operators; (Shell/Elixir style);
* List/Set comprehensions; (SETL/Python/ABC Style);
* Anonymous TAGGED union types;  (Crystal)
* Some sort of local type inference for refined types (https://arxiv.org/pdf/1807.02132.pdf and http://goto.ucsd.edu/~rjhala/liquid/liquid_types.pdf);

## What we may cover

* Monadic syntax; (maybe just the optional monad to avoid being two pedant - and I would not be able to implement those lol)
* State control; (for the product types maybe?)
* Objects; (prototype? classes? this one annoys me - hard to tackle)
* Meta programming; (Hygienic macros; α-conversion)
* Multi-method and late binding;

## What we do not expect to cover

* Algebraic effects (because I'm not that smart)
* CPS (because I'm not that smart)
* Variable mutability (because it is not necessary)

## Implementations

* Finish Perl6 parser implementation according to what we must cover;
* Do the parsing stuff in Lua using LPEG and in Ocaml (ocamllex and ocamlyacc);
* ?
* Cry in the bath because you'll probably fail
* Think of next steps

# Inspirations

* BCPL (the ```be``` idea intrigues me);
* OCaml (```let``` for any type of declaration makes everything easier);
* Rust/Ocaml again (Immutability!);
* Ponylang/Crystal (syntax simplicity, sum types and modern!);
* The little typer (book) and Idris (dependent/refined types);
* Parsing Expression Grammars - PEGS (parsing);
