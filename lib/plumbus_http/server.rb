require 'securerandom'
require 'rack'

module PlumbusHttp
  class Server
    def initialize plumbus
      @plumbus = plumbus

      @sessions = {}
    end

    def start
      Thread.new do
        begin
          Rack::Handler::WEBrick.run app
        rescue Exception => e
          $stderr.puts "Server exception #{e}"
        end
      end
    end

    def app
      Proc.new do |env|
        path = env["PATH_INFO"]
        action = path.gsub("/", "_")
        action = action.to_sym
        sid = SecureRandom.hex
        @plumbus.emit_message sid, action, {}

        ['200', {'Content-Type' => 'text/html'}, ['A barebones rack app.']]
      end
    end
  end
end
