//top level declaration
program = ws value:value ws { return value; }

value
  = false
  / string
  / phrase
  / null
  / true
  / number

// ----- declarations -----

phrase = phrase:"let" space bind_name:word space "be the" space type_bind:word space "having" space arg_list_bind:arg_list {
	return "Now " + bind_name + " is " + type_bind + " with " + arg_list_bind
}

arg_list = values:(word separator)+ {
    const head = (v) => v[0]
    return values.map(head);
}
separator =
		"," space
    / space "and" space

// ----- helpers -----

space = " "

word = exp:letter+ {
	return [ exp.join('') ][0];
}

letter = [a-zA-Z0-9]

ws "whitespace" = [ \t\n\r]*

false = "false" { return false; }
null  = "null"  { return null;  }
true  = "true"  { return true;  }


// ----- Numbers -----

number "number"
  = minus? int frac? exp? { return parseFloat(text()); }

decimal_point
  = "."

digit1_9
  = [1-9]

e
  = [eE]

exp
  = e (minus / plus)? DIGIT+

frac
  = decimal_point DIGIT+

int
  = zero / (digit1_9 DIGIT*)

minus
  = "-"

plus
  = "+"

zero
  = "0"

// ----- Strings -----

string "string"
  = quotation_mark chars:char* quotation_mark { return chars.join(""); }

char
  = unescaped
  / escape
    sequence:(
        '"'
      / "\\"
      / "/"
      / "b" { return "\b"; }
      / "f" { return "\f"; }
      / "n" { return "\n"; }
      / "r" { return "\r"; }
      / "t" { return "\t"; }
      / "u" digits:$(HEXDIG HEXDIG HEXDIG HEXDIG) {
          return String.fromCharCode(parseInt(digits, 16));
        }
    )
    { return sequence; }

escape
  = "\\"

quotation_mark
  = '"'

unescaped
  = [^\0-\x1F\x22\x5C]

// ----- Core ABNF Rules -----

// See RFC 4234, Appendix B (http://tools.ietf.org/html/rfc4234).
DIGIT  = [0-9]
HEXDIG = [0-9a-f]i
