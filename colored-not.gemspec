# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "colored-not"
  gem.version       = '1.2'
  gem.authors       = ["Junegunn Choi"]
  gem.email         = ["junegunn.c@gmail.com"]
  gem.description   = %q{Toggles methods from colored gem}
  gem.summary       = %q{Toggles methods from colored gem}
  gem.homepage      = "https://github.com/junegunn/colored-not"

  gem.files         = `git ls-files`.split($/).reject { |f| File.extname(f) == '.jpg' }
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_runtime_dependency "colored", '~> 1.2'
  gem.add_development_dependency "minitest"
end
