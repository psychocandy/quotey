module Quotey

  class NoDataFile < StandardError; end

  class Quoter
    attr_reader :data, :size, :no_repeat

    def initialize(quotes_source = nil, options = {})
      @source_file = quotes_source.nil? || quotes_source == :default_file ? File.join(File.dirname(__FILE__), 'misc_quotes.txt') : quotes_source
      if File.exist? @source_file
        @data = File.open(@source_file,"r").readlines.map{ |line| line.chomp }
        @size = @data.size
        set_options(options)
      else
        raise NoDataFile, "Cannot find quotes data file - #{quotes_source}"
      end
    end

    def get_quote
      if @no_repeat
        index = rand(@size)
        @size -= 1
        @data.delete_at index
      else
        @data[rand(@size)]
      end
    end
    
  private
    def set_options(options)
      @no_repeat = options[:no_repeat] ? true : false
    end

  end

end