require 'dalli'

module Dalli
  module Ext
    module Spymemcached

      # Impliments the same hashing algorithm to chose a server as
      # spymemcached Java library.
      class Ring < Dalli::Ring
        MAX = 2 ** 31 - 1 # 32 bit signed int max
        MIN = -2 ** 31 # 32 bit signed int min

        def hash_for(key)
          hashed_key = key.each_byte.inject(0) do |hash, byte|
            hash = 31 * hash + byte
            hash = MAX - (MIN - hash) + 1 while hash < MIN
            hash = MIN - (MAX - hash) - 1 while hash > MAX
            hash
          end

          hashed_key & "ffffffff".hex
        end

        def server_for_key(key)
          server = @servers[hash_for(key) % @servers.length] if @servers.any?
          Dalli.logger.debug { "Dalli::Ext::Spymemcached#server_for_key:
            key: #{key.to_s},
            hash: #{hash_for(key)},
            server: #{server.try(:name)}" }

          unless server && server.alive?
            raise Dalli::NetworkError, "No servers available"
          end

          server
        end

      end
    end
  end

  # Replace default implementation.
  remove_const :Ring
  Ring = Ext::Spymemcached::Ring

end
