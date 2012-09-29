module Quotey

  class NoDataFile < StandardError; end

  class Quoter
    attr_reader :data, :size

    def initialize(quotes_source = nil, options = {})
      @source_file = quotes_source.nil? ? File.join(File.dirname(__FILE__), 'misc_quotes.txt') : quotes_source
      if File.exist? @source_file
        @data = File.open(@source_file,"r").readlines.map{ |line| line.chomp }
        @size = @data.size
      else
        raise NoDataFile, "Cannot find quotes data file - #{quotes_source}"
      end
    end

    def get_quote
      @data[rand(@size)]
    end
  end

end