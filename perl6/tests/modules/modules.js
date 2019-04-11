let test be the Module {

//  Let's say I want to have a  new declaration. We have three ways to do so:

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
