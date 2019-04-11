# Syntax

The idea of #{LANG_NAME} syntax is to allow a programmer to talk to the computer in an easy way - not having to remember some cumbersome notation. It is a hard thing to accomplish even because people are already used to some notations they don't even  know how to traduce, such as PHP's ```$``` and OCaml's ```;;```.

# Declarations

So, if we want to make it simple for people to use the language, then the declarations are not supposed to be hard to remember.  

Despite that, we do not want to rule out people that are used to the notation of Algol-family languages. So we do have the normal way to declare it - and the programmers way!

One may complain that having more than one way to declare stuff may bring confusion to the syntax. But the idea here is to bring the language closer to programmers and people that are starting to program - and make them meet halfway!

The first way to declare a value - most people are used to it:

```
let [NAME] : [UNIVERSE] = [VALUE]
```

An equivalent way to do so in a more natural way:

```javascript
let [NAME] be [UNIVERSE] = [VALUE]
```

That second way is a coold deal - everybody would understand it. Actually, [BCPL] (http://rabbit.eng.miami.edu/info/bcpl_reference_manual.pdf), the (grand)father of Pascal and C already brought the ```let <it> be ``` in the first place - we were simply inspired by it!

But what if we could achieve more? What if we could say to the machine that I want to ```let``` the name ```be the``` Integer 1? Directly saying that is allowed, like:

```javascript
let value be the Int 1
```

A few points:

* The language incentives you to use the last way because of its design philosophy - but allows and guarantees the same behavior for any of the three types;
* Declarations are immutable - we do not yet support direct mutability, although direct shadowing is allowed;
* That declaration syntax works for Types, Values, Products, Sums and Functions, although functions have some little more detailing attached;

## Declaring a new type

Another core idea of the language is Refined/Dependent types. The idea that you can have qualifiers for each type - and that you may even define new qualifiers - was one of the motivators for the project.

So, this idea was inspired by the book The little typer, in which the author descibres **PieLang**. In order to achieve some related experience, we brought the Universe value - a domain that other types belong to. This means we can write the following:

```javascript
let Natural be the Universe Int > 0
```

In which we have described the Naturals numbers - any integer value bigger than 0! This is useful in, say, a function that divides two number. A number can't be divided by 0 - so we can add that constraint by changing the expected type from ```Int``` to ```Natural``` -- be calm, an example will be put in the next section!

## Declaring a function

The declaration of a function varies a lot in all languages. In some of them (most commonly on those that claim to be Object Oriented), functions have a special syntax to declare - such as using the name ```function``` or something like that.

Here we treat functions as first class citizens - just as any other modern language should. This means the ```let``` declaration works for functions as well, you just have to specify a function type.

Here is an example that will help to understand the need of refined types and also the functions declaration:

```javascript
let safeDivision be the Fn of Int (dividend is Natural, divisor is Int) => {
    divisor/dividend
}
```
Notice the B family of block scope.

Which can also be one liner:

```javascript
let safeDivision be the Fn of Int (dividend is Natural, divisor is Int) => divisor/dividend;
```

So the function type is associated with a return type (specified after the ```of``` keyword) and a list of arguments. Again, back to the natural language idea - what type is the dividend? Why do we declare it using the colon notation?

In order to make it simple, we specify the values with their types as they should - we say that the dividend parameter ```is``` of type Natural!

## Declaring a product type

This is a tricky one - many people will call it a struct, some will call it a record. The product type idea is the one that better describes a conjunction of more than one named value.

So, if you come from the C/Algol family, you may call it a Struct; if you come from F#, feel free to call it a Record. It's the same idea, except with a more natural way to declare it.

Let's say you want to declare a type that has values. A normal person would say something like:

> There is this value called X where the name y represents an int and the name z represents a String

As of the language's philosophy, we try to bring that kind of declaration closer to reality. That is why, in order to declare a product type, one may say:

```javascript
let Animal be the Product where {
  age is Int, name is String
}
```

And we may then use it just like in any other language!

```javascript
let pet be Animal = {
  age: 10,
  name: 'luna'
}
```

Of course, there is a #{LANG_NAME} way to do it. We *must* feel like we are talking to the computer; like it can understand us directly!

```javascript
let pet be the Animal whose age is 10 and name is 'Nicolas'
```

And that will have the same effect as the first declaration. Neat, huh? :-)


//TODO: Document the 'with' keyword for that case (in order to avoid repetition)

```A animal vs THE animal```
