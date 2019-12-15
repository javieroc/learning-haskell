-- if...then...else

mySignum x =
  if x < 0
    then -1
    else if x > 0
      then 1
      else 0


-- using guards
mySignumGuards x
  | x < 0     = -1
  | x > 0     = 1
  | otherwise = 0


ptsGuards :: Int -> Int
ptsGuards x
  | x == 1 = 10
  | x == 2 = 6
  | x == 3 = 4
  | x == 4 = 3
  | x == 5 = 2
  | x == 6 = 1
  | otherwise = 0

-- Using patterns
pts :: Int -> Int
pts 1 = 10
pts 2 = 6
pts 3 = 4
pts 4 = 3
pts 5 = 2
pts 6 = 1
pts _ = 0

-- let / in
root a b c =
  ((-b + sqrt(b * b - 4 * a * c)) / (2 * a),
  (-b - sqrt(b * b - 4 * a * c)) / (2 * a))

root2 a b c =
  let sdisc = sqrt(b * b - 4 * a * c)
      twice_a = 2 * a
  in ((-b + sdisc) / twice_a, (-b - sdisc) / twice_a)
