# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-notify/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-notify"
  spec.version       = RailsAssetsNotify::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "A shim for desktop Notifications API. Employing a varying techniques to draw a user back to a tab"
  spec.summary       = "A shim for desktop Notifications API. Employing a varying techniques to draw a user back to a tab"
  spec.homepage      = "http://adodson.com/notification.js"
  spec.license       = "MIT"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
