module Complex.Complex where

data Complex a = Complex a a deriving Eq 

real :: (Real a) => Complex a -> a
real (Complex rl _) = rl

imag :: (Real a) => Complex a -> a
imag (Complex _ im) = im

i :: (Real a) => Complex a
i = Complex 0 1

fromReal :: (Real a) => a -> Complex a
fromReal x = Complex x 0

--Since the inverses of sine and cosine are multivalued, I have to break it up into these tedious case-by-case patterns to make the angle always be in [0, 2*pi)
arg :: (Real a, Floating a) => Complex a -> a
arg (Complex 0 0) = undefined                  --There's no way to define the angle of the origin non-arbitrarily; it's like 0/0. The closest one could do is define it to be 0, but I think this is best.
arg z@(Complex x y)
  | y >= 0 =   acos $ x/r           --[0        , (1/2) tau]
  | y <  0 = -(acos $ x/r)          --[(1/2) tau, (3/4) tau)
  where r = dist z    

--Converts a complex number to polar form; (x, y) ==> x + yi = r * e^(iθ) ==> <θ, r>
toPolar :: (Real a, Floating a) => Complex a -> (a,a)
toPolar z = (arg z, dist z)

dist :: (Real a, Floating a) => Complex a -> a
dist = real . abs    --abs z should always be a real number mathematically; this just changes types to match.

instance (Real a, Show a) => Show (Complex a) where
  show z = (show . real $ z) ++ " + " ++ (show . imag $ z) ++ "i"

instance (Real a, Floating a, Eq a) => Fractional (Complex a) where
  fromRational x = Complex (fromRational x) 0
  recip (Complex x y) = Complex (x/q) (-y/q)
    where q = x^2 + y^2

instance (Real a, Floating a) => Num (Complex a) where
  fromInteger = fromReal . fromInteger
  (Complex r1 i1) + (Complex r2 i2) = Complex (r1 + r2) (i1 + i2)
  (Complex r1 i1) * (Complex r2 i2) = Complex (r1*r2 - i1*i2) (r1*i2 + i1*r2)
  negate (Complex r1 i1) = Complex (-r1) (-i1)
  abs (Complex x y) = fromReal $ sqrt (x^2 + y^2)
  signum (Complex 0 0) = Complex 0 0
  signum z = z / (abs z)

instance (Real a, Floating a) => Floating (Complex a) where
  pi = fromReal pi
  exp (Complex x y) = (fromReal $ exp x)*((fromReal $ cos y) + i*(fromReal $ sin y))    --Euler's formula
  log z = (fromReal $ log r) + i*(fromReal θ)
    where r = dist z
          θ = arg z
  cos z = (exp (i*z) + exp (-i*z)) / 2
  sin z = (exp (i*z) - exp (-i*z)) / (2*i)
  acos z = (-i) * log (z + sqrt (z^2 - 1))
  asin z = (-i) * log (i*z + sqrt (1 - z^2))
  atan z = (i/2) * (log (1 - i*z) - log (1 + i*z))
  cosh z = (exp z + exp (-z)) / 2
  sinh z = (exp z - exp (-z)) / 2
  acosh z = log (z + sqrt (z^2 - 1))
  asinh z = log (z + sqrt (z^2 + 1))
  atanh z = (1/2)*(log (1+z) - log (1-z))
