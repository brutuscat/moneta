module Juno
  # Proxy base class
  # @api public
  class Proxy < Base
    attr_reader :adapter

    def initialize(adapter, options = {})
      @adapter = adapter
    end

    # Exists the value with key
    #
    # @param [Object] key
    # @return [Boolean]
    # @param [Hash] options
    # @api public
    def key?(key, options = {})
      @adapter.key?(key, options)
    end

    # Fetch value with key. Return nil if the key doesn't exist
    #
    # @param [Object] key
    # @param [Hash] options
    # @return [Object] value
    # @api public
    def load(key, options = {})
      @adapter.load(key, options)
    end

    # Store value with key
    #
    # @param [Object] key
    # @param [Object] value
    # @param [Hash] options
    # @return value
    # @api public
    def store(key, value, options = {})
      @adapter.store(key, value, options)
    end

    # Delete the key from the store and return the current value
    #
    # @param [Object] key
    # @return [Object] current value
    # @param [Hash] options
    # @api public
    def delete(key, options = {})
      @adapter.delete(key, options)
    end

    # Clear all keys in this store
    #
    # @param [Hash] options
    # @return [void]
    # @api public
    def clear(options = {})
      @adapter.clear(options)
      self
    end

    def close
      @adapter.close
    end
  end
end
