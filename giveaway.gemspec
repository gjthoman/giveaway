# -*- encoding: utf-8 -*-
require File.expand_path('../lib/giveaway/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Greg Thoman"]
  gem.email         = ["greg.thoman@daveramsey.com"]
  gem.description   = %q{giveaway gem}
  gem.summary       = %q{giveaway gem}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "giveaway"
  gem.require_paths = ["lib"]
  gem.version       = Giveaway::VERSION


  gem.add_dependency "simple_form"
  gem.add_dependency "sla"
  gem.add_dependency "lead"
  gem.add_dependency "jquery-rails"
  gem.add_dependency "jquery-validation-rails"

end

