# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alc-cmd/version'

Gem::Specification.new do |gem|
  gem.name          = "alc-cmd"
  gem.version       = Alc::Cmd::VERSION
  gem.authors       = ["Kazuhiro Yamada"]
  gem.email         = ["yamadakazu45@gmail.com"]
  gem.description   = %q{Command-line tool to translate English to Japanese }
  gem.summary       = %q{Use SPACE ALC (http://eow.alc.co.jp/) from command line.}
  gem.homepage      = "https://github.com/k-yamada/alc-cmd"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency 'thor'
  gem.add_dependency 'mechanize'
end
