# encoding: UTF-8
require 'shellwords'

module EaseHTTP
  class Utils
    def self.mime_type(path)
      `file -b --mime-type #{path.shellescape}`.chomp
    end
  end
end
