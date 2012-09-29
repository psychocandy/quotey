module Quotie

  class NoDataFile < StandardError; end

  class Quoter
    attr_reader :data

    def initialize(quotes_source = "misc_quotes.txt", options = {})
      if File.exist? quotes_source
        @data = File.read()
      else
        raise NoDataFile, "Cannot find quotes data file - #{quotes_source}"
      end
    end

    def get_quote

    end
  end

end