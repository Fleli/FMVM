#  Intermediate Representation (IR)

A few general rules
- All functions are declared globally. Their names must be unique (for overloading, the compiler needs to generate specialized functions for each case).
- The IR does not support generics. If generics are supported by the programming language, the compiler has to find a way to erase these before lowering to FMVM IR.
- All variable names are unique, even those that are local to a function cannot interfere with local variables of other functions.

All functions take exactly one parameter and returns exactly one value. The parameter may be of any type. Functions (in higher-level languages) that require multiple parameters need to pass a tuple of the parameter types, effectively making the function construct support multiple characters. The single parameter passed to a function is available through the `param` keyword.
