cons8 :: (Num a) => [a] -> [a]
cons8 l = 8:l

cons8end :: (Num a) => [a] -> [a]
cons8end l = l ++ [8]

consThing :: [a] -> a -> [a]
consThing list thing = thing:list