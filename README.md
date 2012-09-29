# Quotey

A gem for generating random quotes

## Installation

    $ gem install quotey

## Usage

### Basic usage

	my_quote_object = Quotey::Quoter.new
	my_quote_object.get_quote
	=> "\"In the depths of winter I finally learned there was in me an invincible summer.\" - Albert Camus"

### Custom behavior 

Quotey can receive an options hash:

* :file
* :no_repeat

#### Using Different file

	my_quote_object = Quotey::Quoter.new(file: "/path/to/my/text/file.txt")

Lines are delimited per \n.

#### No repeating

Want to make sure you get a fresh quote everytime? Worry not!

	my_quote_object = Quotey::Quoter.new(no_repeat: true)
	
Note that once Quotey finishes the list it re-reads the file that was given during the instantiation.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
