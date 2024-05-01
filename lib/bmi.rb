# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

module BMI
  module_function

  def encoding_style
    Encoding.default_internal = Encoding::UTF_8
    Encoding.default_external = Encoding::UTF_8
  end

  def calc(kg, m)
    kg.to_f / (m.to_f ** 2)
  end
end

include BMI

__END__
