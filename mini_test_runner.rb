# frozen_string_literal: true

# --------------------------------------
require 'minitest'
require 'minitest/autorun'
require 'minitest/unit'
require 'minitest/runner'
require 'bmi'
# --------------------------------------

# The new instance will be deleted after process ends.
class MiniTestFile
  attr_reader :mini_test

  encoding_style

  def initialize
    encoding_style
    @mini_test = Mini(true, '/GitHub/bmi/minitest')
  end

  def remove
    remove_instance_variable(:@mini_test)
  end
end

# About Exception, begin ~ rescue ~ ensure.
begin
  MiniTestFile.new.remove
rescue StandardError => e
  # use zinbeijett project head branch.
  puts e.backtrace.tanraku_exit
ensure
  GC.compact
end

__END__
