require 'Quotie'

describe Quotie::Quote do

  it "Returns a string" do
    Quotie::Quote.get_quote.class.should == String
  end


end