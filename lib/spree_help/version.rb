module SpreeFaq

  # Returns the version of the currently loaded SpreeFaq as a <tt>Gem::Version</tt>
  def self.version
    Gem::Version.new VERSION::STRING
  end

  module VERSION
    MAJOR = 2
    MINOR = 3
    TINY  = 0
    PRE   = 'beta'

    STRING = [MAJOR, MINOR, TINY, PRE].compact.join('.')
  end
end