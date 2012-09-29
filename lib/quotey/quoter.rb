module Quotey

  class NoDataFile < StandardError; end

  class Quoter
    attr_reader :data, :size, :no_repeat, :data_file

    def initialize(options = {})
      @data_file = options[:file].nil? ? File.join(File.dirname(__FILE__), 'misc_quotes.txt') : options[:file]
      if File.exist? @data_file
        read_data_file
        set_options(options)
      else
        raise NoDataFile, "Cannot find quotes data file - #{options[:file]}"
      end
    end

    def get_quote
      if @no_repeat
        read_data_file if @size == 0

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

    def read_data_file
      @data = File.open(@data_file,"r").readlines.map{ |line| line.chomp }
      @size = @data.size
    end
  end

end