{-
Este es mi primer comentario en haskell X)
-}
r = 5.0 -- Radio
area2 = pi * r ^ 2 -- Area

-- Function to calculate area of a circle of radio r
area r = pi * r ^ 2

-- Other functions
double x = 2 * x
quadruple x = double (double x)
square x = x * x
half x = x / 2

substract12 x = half x - 12

volume h w l = h * w * l

-- Use of where keyword
heron a b c = sqrt (s * (s - a) * (s - b) * (s - c))
    where
    s = (a + b + c) / 2