module BananaStand
  module Models
    class Base
      attr_accessor :client
      def initialize(data, client = nil)
        @data = data || {}

        @client = client if client.present?
      end

      def method_missing(method)
        if @data[method.to_s].present?
          @data[method.to_s]
        else
          super
        end
      end

      def respond_to?(method, include_private = false)
        @data[method.to_s].present? || super(method, include_private)
      end

      def delete!
        client.delete_resource("#{self.class.resource_path}/#{self.id}.json")
      end

      private

      def self.resource_path
        raise NotImplementedError, "resource_path must be implemented by derived models"
      end
    end
  end
end
