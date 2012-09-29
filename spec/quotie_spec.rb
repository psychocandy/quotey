require 'Quotie'

describe Quotie::Quoter do

  # it { should respond_to(:get_quote) }
  # it { should respond_to(:data) }

  let(:quoter) { Quotie::Quoter.new }

  it "returns a quote" do
    quoter.get_quote.should_not be_nil
  end

  it "raises NoDataFile exception if a non-existent file is given" do
    file = ('a'..'z').to_a.shuffle[0,10].join("") << ".txt"
    expect {
      Quotie::Quoter.new(file)
    }.to raise_error Quotie::NoDataFile
  end


end