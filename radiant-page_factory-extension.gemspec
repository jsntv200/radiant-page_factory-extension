# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "radiant-page_factory-extension"

Gem::Specification.new do |s|
  s.name        = "radiant-page_factory-extension"
  s.version     = RadiantPageFactoryExtension::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = RadiantPageFactoryExtension::AUTHORS
  s.email       = RadiantPageFactoryExtension::EMAIL
  s.homepage    = RadiantPageFactoryExtension::URL
  s.summary     = RadiantPageFactoryExtension::SUMMARY
  s.description = RadiantPageFactoryExtension::DESCRIPTION

  ignores = if File.exist?('.gitignore')
    File.read('.gitignore').split("\n").inject([]) {|a,p| a + Dir[p] }
  else
    []
  end

  s.files         = Dir['**/*'] - ignores
  s.test_files    = Dir['test/**/*','spec/**/*','features/**/*'] - ignores
  s.require_paths = ["lib"]
end
