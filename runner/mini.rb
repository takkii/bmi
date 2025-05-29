# frozen_string_literal: true

require "#{File.dirname(__FILE__)}/../require/mini_run"

# The new instance will be deleted after process ends.
class MiniTestFile
  attr_reader :mini_test, :mini_unit

  def initialize
    encoding_style
    host_os = RbConfig::CONFIG['host_os']
    case host_os
    when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
      begin
        # Mini, true || false
        @mini_test = Mini(true, '/GitLab/bmi/minitest')
      rescue StandardError => e
        puts e.backtrace
      end
    when /darwin|mac os/
      # Don't have Macintosh PC.
    when /linux/
      begin
        # MiniW, true || false
        @mini_test = MiniW(true, '/mnt/c/Users/sudok', '/GitLab/bmi/minitest')
      rescue StandardError => e
        puts e.backtrace
      end
    else
      begin
        raise
      rescue StandardError => e
        puts e.backtrace
        puts 'Env, UNIX and Windows only. Other OS is Exception.'
      end
    end
  end

  def remove
    remove_instance_variable(:@mini_test)
  end
end

# About Exception, begin ~ rescue ~ ensure.
begin
  # SimpleCov.start
  MiniTestFile.new.remove
rescue StandardError => e
  puts e.backtrace.tanraku_exit
ensure
  GC.compact
end

__END__
