# -*- encoding: utf-8 -*-
# stub: lerolero_generator 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "lerolero_generator".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jackson Pires".freeze]
  s.date = "2014-04-12"
  s.description = "Gerador de Lero-Lero.".freeze
  s.email = ["jackson.pires@gmail.com".freeze]
  s.homepage = "https://github.com/jacksonpires/lerolero_generator".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.3".freeze
  s.summary = "O gerador de Lero-Lero pode gerar at\u00E9 10 mil combina\u00E7\u00F5es diferentes de frases de embroma\u00E7\u00E3o.".freeze

  s.installed_by_version = "2.7.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_development_dependency(%q<rake>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 2.14.1"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
      s.add_dependency(%q<rake>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 2.14.1"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.3"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 2.14.1"])
  end
end
