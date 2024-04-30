# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Encoding Setting.
def encoding_style
  Encoding.default_internal = 'UTF-8'
  Encoding.default_external = 'UTF-8'
end

module BMI
  module_function

  def calc(kg, m)
    encoding_style

    kg = ARGV[0]
    m = ARGV[1]
    kg.to_f / (m.to_f ** 2)
  end
end

include BMI

begin
    if (calc(ARGV[0], ARGV[1])).round(1) < 18.5
        puts '低体重' + " : #{calc(ARGV[0], ARGV[1]).round(1)}"
    elsif (calc(ARGV[0], ARGV[1])).round(1) < 24.9
        puts '普通体重'+ " : #{calc(ARGV[0], ARGV[1]).round(1)}"
    elsif (calc(ARGV[0], ARGV[1])).round(1) < 29.9
        puts '肥満(1度)'+ " : #{calc(ARGV[0], ARGV[1]).round(1)}"
    elsif (calc(ARGV[0], ARGV[1])).round(1) < 34.9
        puts '肥満(2度)'+ " : #{calc(ARGV[0], ARGV[1]).round(1)}"
    elsif (calc(ARGV[0], ARGV[1])).round(1) < 39.9
        puts '肥満(3度)'+ " : #{calc(ARGV[0], ARGV[1]).round(1)}"
    else
        puts '肥満(4度)'+ " : #{calc(ARGV[0], ARGV[1]).round(1)}"
    end
rescue Exception => e
    puts e.backtrace.tanraku_exit
ensure
    GC.compact
end

__END__
