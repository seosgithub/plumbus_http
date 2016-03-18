require 'securerandom'
require 'goliath'

module PlumbusHttp
  class Server < Goliath::API
    def start
      Thread.new do
        begin
          runner = Goliath::Runner.new([], nil)
          runner.api = self
          runner.app = Goliath::Rack::Builder.build(Server, runner.api)
          runner.port = $port
          $port += 1
          runner.run
        rescue Exception => e
          $stderr.puts e
        end
      end
    end

    def initialize plumbus
      @plumbus = plumbus

      @sessions = {}
    end

    def send sid, payload
      @sessions[sid].stream_send(payload.to_s)
      @sessions[sid].stream_close
    end

    def response env
      path = env["PATH_INFO"]
      action = path.gsub("/", "_")
      action = action.to_sym
      sid = SecureRandom.hex
      headers = { 'Content-Type' => 'text/html' }

      @sessions[sid] = env
      EM.next_tick do
        @plumbus.emit_message sid, action, env["QUERY_STRING"]
      end

      streaming_response(404, headers)
    end
  end
end
