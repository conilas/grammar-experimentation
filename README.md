# Grammar

This project folder will try and describe a possible grammar for the language I'm working on. Since I have to work with dependent/refined types (and keep) the rest of it as familiar as possible, I'll try to use a grammar with common types (Int, String, Bool, etc) and they will have a few modifiers.
Those modifiers will have different behavior for each specified type. The following piece documents some of the possibilities about the types.

# Code demonstration

This is some code in #{LANG_NAME}. Cool, huh?

```javascript
let test be the Module {

//  Let's say I want to have a  new declaration. We have three ways to do so:

//  1. Allow the type Natural to be the Universe of value Int > 0
  let Natural be the Universe Int > 0
//  2. Allow int to be a Universe and attribute a direct value
  let Natural be Universe = Int > 0
//  3. Programmers
  let Natural : Universe = Int > 0

//We have sum types :-)
  let sum_string_natural be Universe = (String | Natural)

//We have product types ...
  let product_type be Product = {
    x is Int, y is String
  }

//... and the natural way to declare 'em!
  let second_example be the Product where {
    x is Int, y is String
  }

// This is a more-than-one-line function
  let division be the Fn of Int (dividend is Natural = 10, divisor is Int) => {
    let ble be Natural = 1
    let cle be Natural = 1
  }

// This is a more-than-one-line function
  let division be the Fn of Int (dividend is Natural, divisor is Int) => 1/2;

// We have some nice pattern match with guards :-)
// You can do this (as you would be able to in Crystal)
  let anon_tagged_union be the Fn of (String | Int) (first is String, second is Int) => {
    match second with
      x when x > 20 => x
      otherwise => first
    end
  }

// This is just some value decl
  let x be Natural = 1
  let x be the Natural 1
}
```

# Types

## Int

The ```INT``` type is refined with GT (>), LT (>), GTE (>=), LEQ (<=) for now. It can also have the '~' modifier.

* __GT__ (>): Will specify that this type is an Int greater than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* __LT__ (<): Will specify that this type is an Int lower than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* __GTE__ (>=): Will specify that this type is an Int greater *or* equal than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* __LEQ__ (<=): Will specify that this type is an Int lower *or* equal than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* __DEF__ (~) aka Definer: Will specify that the compiler *must* try and find a sufficient type for the value.

# Declarations

A declaration *must* be in the following form:

```
let [NAME] : [UNIVERSE] = [VALUE];
```

* __NAME__: The name of the working variable. The idea of this name is to identify in its scope (be it global or scoped). This name can always be *shadowed* (because every value is immutable in any context).

* __UNIVERSE__: A universe is either a type or a universe itself. The idea of the Universe comes from the book *The little typer*, in which case we are able to identify that the variable identified by [NAME] is a type expression. The universe will go in a ranged list.

* __VALUE__: The value that the [NAME] will represent now.

## Function declaration

A function will always be identified in the following form:

```javascript
let safe_divide : Fn = (dividend: Int > 0, divisor: Int) =>
  divisor/dividend
;
```

Let's break it down in the form of a declaration:

* __NAME__: In this case, the function is identified by ```divide```. This means that the value can be used anywhere in its scope and whenever called will reproduce the declared body.

* __UNIVERSE__: In this case, it is specified by ```Fn```, which simply means it is a function.

* __VALUE__: In this case, the value is a lambda with arguments that has some body -- which will be executed whenever the [NAME] is called. The function declaration is a bit special. It will have always a declaration that is formatted in some specific way. The form of a function in #{LANG_NAME} will always go like this: ```([ARGS]) => [BODY];```. Let's break it down again:
  * __ARGS__: The arguments of a function. The arguments will always have to be specified in the same way as [UNIVERSE]. This means a function can receive *universes*, refined types or common values to work with.
  * __BODY__: The body of the function, consisting of other function calls, IO operations and such.

# Goals and non-goals

## What we cover (syntactically speaking)

* Product types; (Inspired by records in F# or structs in Rust)
* Sum types; (Inspired by Crystal and Pony)
* Refined types; (Liquid haskell inspired, but not that advanced)
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
