require 'Quotey'

describe Quotey::Quoter do

  before(:all) do
    @local_path = File.join(File.dirname(__FILE__), 'misc_quotes.txt')
  end

  describe "basic behavior" do
    let(:quoter) { Quotey::Quoter.new }
    it "raises NoDataFile exception if a non-existent file is given" do
      random_filename = ('a'..'z').to_a.shuffle[0,10].join("") << ".txt"
      expect {
        Quotey::Quoter.new(file: random_filename)
      }.to raise_error Quotey::NoDataFile
    end

    it "reads the default file" do
      default_path = File.join(File.dirname(__FILE__), '..', 'lib', 'quotey', 'misc_quotes.txt')
      size = File.open(default_path,"r").readlines.count
      quoter.size.should == size
    end

    it "does not set no_repeat to true" do
      quoter.no_repeat.should_not be_true
    end
  end

  context "when no_repeat is given" do

    let(:quoter) { Quotey::Quoter.new(file: @local_path, no_repeat: true) }

    it "sets no_repeat to true" do
      quoter.no_repeat.should be_true
    end

    it "deletes the given quote from the list" do
      deleted_quote = quoter.get_quote
      quoter.data.include?(deleted_quote).should be_false
    end

    it "lowers the size by 1" do
      expect{ quoter.get_quote }.to change{ quoter.size }.by(-1)
    end

    it "#get_quote returns a quote" do
      quoter.get_quote.should_not be_nil
      quoter.get_quote.class.should == String
    end

    it "starts again when it reaches zero" do
      loop do
        puts quoter.get_quote
        break if quoter.size == 0
      end
      quoter.get_quote
      quoter.size.should > 0
    end
  end

  context "when custom file is given" do
    before(:all) do
      @quoter = Quotey::Quoter.new file: @local_path
    end

    it "reads all the quotes from a custom file" do
      size = File.open(@local_path,"r").readlines.count
      @quoter.size.should == size
    end

    it "#get_quote returns a quote" do
      @quoter.get_quote.should_not be_nil
      @quoter.get_quote.class.should == String
    end
  end


end