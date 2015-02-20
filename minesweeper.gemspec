# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'minesweeper/version'

Gem::Specification.new do |spec|
  spec.name          = "minesweeper"
  spec.version       = Minesweeper::VERSION
  spec.authors       = ["Sebastien Varlet"]
  spec.email         = ["sebastien.varlet@plumbee.co.uk"]
  spec.summary       = %q{Core model of the minesweeper game.}
  spec.description   = %q{This gem defines the core classes of a minesweeper game such as Minefield, Cell, and Mine.}
  spec.homepage      = "https://github.com/svarlet/minesweeper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
