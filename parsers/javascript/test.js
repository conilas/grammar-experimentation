const peg = require("./grammar.js");
const fs  = require("fs")

fs.readFile("../../examples/declarations/declarations.js", (err, parseableBuffer) => {
  const parseableExpression = parseableBuffer.toString()

  console.log(peg.parse(parseableExpression))
})
