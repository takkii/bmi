# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "version"

Gem::Specification.new do |s|
  s.name = "bmi"
  s.version = BMI_CLI::VERSION
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["takkii"]
  s.email = "karuma.reason@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
  ]
  s.executables = %w(bmi bmi-license)
  s.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|mini_test)/}) }
  s.homepage = "https://github.com/takkii/bmi"
  s.licenses = ["MIT"]
  s.metadata = { "github_repo" => "ssh://github.com/takkii/bmi" }
  s.metadata["yard.run"] = "yri"
  s.require_paths = ["lib"]
  s.required_ruby_version = ['>= 3.0']
  s.rubygems_version = ['>= 3.5']
  s.summary = "This is a BMI measuring device."
  s.description = "Measure your BMI."

  # Needing to rubygems
  # s.add_runtime_dependency('gem_name', '~> 0.1')

  if s.respond_to? :specification_version
    s.specification_version = 4
  end
end
