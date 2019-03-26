# Grammar

This project folder will try and describe a possible grammar for the language I'm working on. Since I have to work with dependent/refined types (and keep) the rest of it as familiar as possible, I'll try to use a grammar with common types (Int, String, Bool, etc) and they will have a few modifiers.
Those modifiers will have different behavior for each specified type. The following piece documents some of the possibilities about the types.

# Types

## Int

The ```INT``` type is refined with GT (>), LT (>), GTE (>=), LEQ (<=) for now. It can also have the '~' modifier.

* GT (>): Will specify that this type is an Int greater than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* LT (<): Will specify that this type is an Int lower than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* GTE (>=): Will specify that this type is an Int greater *or* equal than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* LEQ (<=): Will specify that this type is an Int lower *or* equal than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* DEF (~) aka Definer: Will specify that the compiler *must* try and find a sufficient type for the value. This feature is yet to be though and documented.

# Declarations

A declaration *must* be in the following form:

```let [NAME] : [UNIVERSE] = [VALUE];```

* NAME: The name of the working variable. The idea of this name is to identify in its scope (be it global or scoped). This name can always be *shadowed* (because every value is immutable in any context).

* UNIVERSE: A universe is either a type or a universe itself. The idea of the Universe comes from the book *The little typer*, in which case we are able to identify that the variable identified by [NAME] is a type expression. The universe will go in a ranged list.

* VALUE: The value that the [NAME] will represent now.

## Function declaration

A function will always be identified in the following form:

```javascript
let safe_divide : Fn = (dividend: Int > 0, divisor: Int) =>
  divisor/dividend
;
```

Let's break it down in the form of a declaration:

* NAME: In this case, the function is identified by ```divide```. This means that the value can be used anywhere in its scope and whenever called will reproduce the declared body.

* UNIVERSE: In this case, it is specified by ```Fn```, which simply means it is a function.

* VALUE: In this case, the value is a lambda with arguments that has some body -- which will be executed whenever the [NAME] is called. The function declaration is a bit special. It will have always a declaration that is formatted in some specific way. The form of a function in #{LANG_NAME} will always go like this:

```([ARGS]) => [BODY];```

  * ARGS: The arguments of a function. The arguments will always have to be specified in the same way as [UNIVERSE]. This means a function can receive *universes*, refined types or common values to work with. 
  * BODY: The body of the function, consisting of other function calls, IO operations and such.
    
