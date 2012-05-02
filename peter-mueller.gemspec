# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "peter-mueller/version"

Gem::Specification.new do |s|
  s.name = "peter-mueller"
  s.version = PeterMueller::VERSION::STRING
  s.platform = Gem::Platform::RUBY
  s.authors = ["Thomas Volkmar Worm"]
  s.email = ["tvw@s4r.de"]
  s.homepage = "https://github.com/tvw/peter-mueller"
  s.summary = %q{A library for creating real looking but fictitious German address data.}
  s.description = %q{A library for creating fictitious German address data.
                     The addresses look real, though they are of pure random and fictitious origin.}

  s.rubyforge_project = "peter-mueller"
  s.files = Dir["lib/**/*"] + ["Rakefile", "README.rdoc"]
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake', '>= 0.9.2'
  s.add_development_dependency 'rspec', '>= 2.9'
  s.add_development_dependency 'ZenTest', '>= 4.7.0'
end
