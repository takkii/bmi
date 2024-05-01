# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'tanraku'

# Encoding Setting.
def encoding_style
  Encoding.default_internal = 'UTF-8'
  Encoding.default_external = 'UTF-8'
end

module BMI
  module_function

  def calc(kg, m)
    kg.to_f / (m.to_f ** 2)
  end
end

include BMI

begin
    encoding_style
    fomula = calc(kg = ARGV[0], m = ARGV[1]).round(1)

    if (fomula < 18.5)
        puts '低体重' + " : #{fomula}"
    elsif (fomula < 24.9)
        puts '普通体重'+ " : #{fomula}"
    elsif (fomula < 29.9)
        puts '肥満(1度)'+ " : #{fomula}"
    elsif (fomula < 34.9)
        puts '肥満(2度)'+ " : #{fomula}"
    elsif (fomula < 39.9)
        puts '肥満(3度)'+ " : #{fomula}"
    else
        puts '肥満(4度)'+ " : #{fomula}"
    end
rescue Exception => e
    puts e.backtrace.tanraku_exit
ensure
    GC.compact
end

__END__
