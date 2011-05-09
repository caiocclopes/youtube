# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "youtubesocial/version"

Gem::Specification.new do |s|
  s.name        = "youtubesocial"
  s.version     = Youtubesocial::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Teste"]
  s.email       = [" teste@teste.com"]
  s.homepage    = "http://www.youtube.com"
  s.summary     = %q{ youtube gem}
  s.description = %q{ youtube test gem}

  s.add_dependency('mongoid', '2.0.0.rc.6')
  s.add_dependency('bson_ext', '>=1.2')
  
  s.rubyforge_project = "youtubesocial"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
