require "middleman-core"
require "middleman-inline_svg/inline_svg"
require "middleman-inline_svg/middleman-inline_svg"

::Middleman::Extensions.register(:inline_svg, MiddlemanInlineSVG)
