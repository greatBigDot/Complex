# Complex

  This is a simple representation of complex numbers in Haskell, complete with instance declarations for Num, Fractional, and Floating (and Show & Eq, obviously). Functions with extended domains include:

* (+), (-), (*), (/)
* abs, signum
* exp, log, (**)
* sin, cos, tan, asin, acos, atan, etc.

  Currently, functionality is limited to floating-point complex numbers (i.e., no Guassian integers). The main reason for this is that the absolute value and signum functions are irreducible members of the Num typeclass, but neither of them necessarily return Gaussian integers when their inputs are Gaussian integers (mathematically, at least).