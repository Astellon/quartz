module Quartz
  # type to pa format
  # ```
  # format(Int32) # => 2
  # ```
  macro format(type)
    LibPortAudio::Pa{{type}}
  end

  def self.init
    Suppressor.suppress Process::ORIGINAL_STDERR, LibPortAudio.init
    at_exit { LibPortAudio.terminate }
  end

  def self.pa_version(io = STDOUT)
    io.puts String.new(LibPortAudio.get_version_text)
  end
end