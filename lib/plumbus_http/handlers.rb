$port = 3000
module PlumbusHttp
  module PlumbusHandlers
    attr_accessor :supported_actions

    def config &block
      dsl = ConfigDSL.new &block
      @supported_actions = [:_test]

      @server = Server.new(self)
      @server.start
    end

    #Forward a message to the block for a sid
    def handle_message sid, action, payload
      $stderr.puts "GOT MESSAGE!!! #{sid.inspect}"
      if action == 'lol'
        @server.send sid, "<h1>Hello world!</h1> #{payload}"
      else
        emit_message sid, 'lol', payload
      end
    end

    #Forward a signal, like disconnection
    def handle_signal name, info
      puts "signal #{name} #{info}"
      @server.send info[:sid], name
    end

    def _spec_expand_and_invalidate_supported_actions name
      @supported_actions << name
      invalidate_supported_actions
    end

    def _spec_emit_message sid, action, payload
      emit_message sid, action, payload
    end

    def _spec_received_messages
      return @_spec_received_messages || []
    end

    def _spec_received_signals
      return @_spec_received_signals || []
    end
  end
end

