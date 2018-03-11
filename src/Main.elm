import Slides exposing (..)

main = Slides.app
    slidesDefaultOptions
    [ md
        """
        # A markdown slide
        _stuff follows..._
        """
    , mdFragments
        [ "Another slide with three fragments"
        , "This appears later"
        , "And this even later"
        ]
    ]
