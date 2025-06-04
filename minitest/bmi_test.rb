# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "#{File.dirname(__FILE__)}/../require/dependent"

# Mini_test file load.
class VersionTest < Minitest::Test

  def encoding_style_utf8
    encoding_style
  end

  def bmi_calc(kg, m)
    kg.to_f / (m.to_f ** 2)
  end

  def test_encoding_style
    @v1 = encoding_style
    @v2 = encoding_style_utf8

    assert_equal(@v1, @v2)
  end

  def test_bmi
    @v1 = calc(70, 1.75)
    @v2 = bmi_calc(70, 1.75)

    assert_equal(@v1, @v2)
  end
end
