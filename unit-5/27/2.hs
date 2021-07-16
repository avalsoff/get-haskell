newtype Box a = Box a deriving Show

instance Functor Box where
  fmap func (Box a) = Box $ func a

myBox :: Box Int
myBox = Box 1

unwrap :: Box a -> a
unwrap (Box val) = val

unwrapped = unwrap <$> (Box <$> myBox)
