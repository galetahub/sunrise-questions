# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sunrise/questions/version"

Gem::Specification.new do |s|
  s.name = "sunrise-questions"
  s.version = Sunrise::Questions::VERSION.dup
  s.platform = Gem::Platform::RUBY 
  s.summary = "Questions plugin for sunrise-cms"
  s.description = "Questions plugin for sunrise-cms"
  s.authors = ["Igor Galeta"]
  s.email = "galeta.igor@gmail.com"
  s.rubyforge_project = "sunrise-questions"
  s.homepage = "https://github.com/galetahub/sunrise-questions"
  
  s.files = Dir["{app,lib,config}/**/*"] + ["MIT-LICENSE", "Rakefile", "Gemfile", "README.rdoc"]
  s.test_files = Dir["{spec}/**/*"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.require_paths = ["lib"]
  
  s.add_dependency("sunrise-cms", ">= 0.1.5")
end
