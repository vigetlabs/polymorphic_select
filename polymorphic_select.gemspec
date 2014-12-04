$:.push File.expand_path("../lib", __FILE__)

require "polymorphic_select/version"

Gem::Specification.new do |s|
  s.name        = "polymorphic_select"
  s.version     = PolymorphicSelect::VERSION
  s.authors     = ["Chris Jones"]
  s.email       = ["chris.jones@viget.com"]
  s.homepage    = "http://www.github.com/vigetlabs/polymorphic_select"
  s.summary     = "Adds a formtastic input for choosing a resource for a polymorphic association."
  s.description = "Adds a formtastic input for choosing a resource for a polymorphic association."
  s.license     = "MIT"

  s.files = `git ls-files`.split($/)
end
