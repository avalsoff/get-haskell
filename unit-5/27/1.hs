newtype Box a = Box a deriving Show

instance Functor Box where
  fmap func (Box a) = Box $ func a

morePresents :: Int -> Box a -> Box [a]
morePresents n box = replicate n <$> box
