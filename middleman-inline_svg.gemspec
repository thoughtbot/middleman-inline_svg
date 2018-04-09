# -*- encoding: utf-8 -*-

$:.push File.expand_path("lib", __dir__)

Gem::Specification.new do |s|
  s.name        = "middleman-inline_svg"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daniel Barber"]
  s.email       = ["github@danbarber.me"]
  s.homepage    = "http://example.com"
  s.summary     = "Inline your SVG's"
  s.description = "Inline your SVG's and style them with CSS."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ["lib"]

  # The version of middleman-core your extension depends on
  s.add_runtime_dependency("middleman-core", [">= 3.4.1"])

  # Additional dependencies
  s.add_runtime_dependency("nokogiri", [">= 1.8"])
end
