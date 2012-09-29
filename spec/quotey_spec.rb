require 'Quotey'

describe Quotey::Quoter do


  describe "default behavior" do
    let(:quoter) { Quotey::Quoter.new }
    it "raises NoDataFile exception if a non-existent file is given" do
      file = ('a'..'z').to_a.shuffle[0,10].join("") << ".txt"
      expect {
        Quotey::Quoter.new(file)
      }.to raise_error Quotey::NoDataFile
    end

    it "reads the default file" do
      default_path = local_file = File.join(File.dirname(__FILE__), '..', 'lib', 'quotey', 'misc_quotes.txt')
      size = File.open(default_path,"r").readlines.count
      quoter.size.should == size
    end
  end

  context "when custom file is given" do
    before(:all) do
      @local_path = File.join(File.dirname(__FILE__), 'misc_quotes.txt')
      @quoter = Quotey::Quoter.new @local_path
    end

    it "reads all the quotes from a custom file" do
      size = File.open(@local_path,"r").readlines.count
      @quoter.size.should == size
    end

    describe "#get_quote" do
      it "returns a quote" do
        @quoter.get_quote.should_not be_nil
      end
    end
  end


end