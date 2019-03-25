# Grammar

This project folder will try and describe a possible grammar for the language I'm working on. Since I have to work with dependent/refined types (and keep) the rest of it as familiar as possible, I'll try to use a grammar with common types (Int, String, Bool, etc) and they will have a few modifiers.
Those modifiers will have different behavior for each specified type. The following piece documents some of the possibilities.

## Int

The ```INT``` type is refined with GT (>), LT (>), GTE (>=), LEQ (<=) for now. It can also have the '~' modifier.

* GT (>): Will specify that this type is an Int greater than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* LT (<): Will specify that this type is an Int lower than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* GTE (>=): Will specify that this type is an Int greater *or* equal than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* LEQ (<=): Will specify that this type is an Int lower *or* equal than another specified value. The other specified value *must* be an identifier for another number or a number itself.

* DEF (~) aka Definer: Will specify that the compiler *must* try and find a sufficient type for the value. This feature is yet to be though and documented.
