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

// Infered version. For product types, it will check in the current module and
//try to infer. If there is no product type that conforms to these values in the
//current module, it will have to have its type annotated
  let InferedExample = {
    x is Int, y is String
  }

  let Animal be the Product where {
    age is Int, name is String
  }

//DAMNNNN
//and also some dope syntax in orer to avoid repetetion
  let getPet be the Fn of Animal (name is String, age is int) => {
    let pet be the Animal whose age is age and name is name

    let pet be the Animal with age, name
  }

// We have some nice pattern match with guards :-)
// You can do this (as you would be able to in Crystal)
  let anon_tagged_union be the Fn of (String | Int) (first is String, second is Int) => {
    match second with
      x when x > 20 => x
      otherwise => first
    end
  }

// This is a more-than-one-line function
  let division be the Fn of Int (dividend is Natural = 10, divisor is Int) => {
    let ble be Natural = 1
    let cle be Natural = 1
  }

// This is a more-than-one-line function
  let division be the Fn of Int (dividend is Natural, divisor is Int) => 1/2;

// This is just some value decl
  let x be Natural = 1
  let x be the Natural 1

// Local Type Inference is a thing here.. Inspired by https://arxiv.org/pdf/1807.02132.pdf
  let x be 1
}
