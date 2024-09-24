# -*- encoding: utf-8 -*-
# stub: colorama 0.1.2 ruby lib

Gem::Specification.new do |s|
  s.name = "colorama".freeze
  s.version = "0.1.2".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "allowed_push_host" => "https://rubygems.org", "changelog_uri" => "https://github.com/gustavodiel/colorama/blob/master/CHANGELOG.md", "homepage_uri" => "https://github.com/gustavodiel/colorama", "source_code_uri" => "https://github.com/gustavodiel/colorama" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Gustavo Diel".freeze]
  s.bindir = "exe".freeze
  s.date = "2021-04-01"
  s.email = ["gustavodiel@hotmail.com".freeze]
  s.homepage = "https://github.com/gustavodiel/colorama".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.4.0".freeze)
  s.rubygems_version = "3.0.3".freeze
  s.summary = "A Gem that extracts some useful colors from an image".freeze

  s.installed_by_version = "3.5.16".freeze if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<rmagick>.freeze, ["~> 4.2.0".freeze])
  s.add_development_dependency(%q<rmagick>.freeze, ["~> 4.2.0".freeze])
end
