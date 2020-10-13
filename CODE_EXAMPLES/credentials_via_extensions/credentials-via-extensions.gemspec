Gem::Specification.new do |s|
  s.name        = 'credentials-via-extensions'
  s.version     = '1.0.2'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ['Maciej Mensfeld']
  s.email       = 'maciej@mensfeld.pl'
  s.homepage    = "http://github.com/mensfeld/taking-over-a-gem"
  s.summary     = "Experimental gem to check extensions API vulnerability. Made for RubyKaigi"
  s.description = "Please don't install this gem unless you want your home ls to be sent to me!"
  s.extensions << './extconf.rb'
end
