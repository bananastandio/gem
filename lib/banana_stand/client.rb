require 'httparty'

module BananaStand
  class Client
    include ::HTTParty
    attr_accessor :api_url

    def initialize(public_key, secret_key = nil)
      @public_key = public_key
      @secret_key = secret_key
      @api_url = 'https://app.bananastand.io/api/v1/'
    end

    def events(page = 1)
      # TODO: Move this into Models::Base
      self.class.get("#{api_url}#{Models::Event.resource_path}.json?page=#{page}", headers: headers).map do |event_data|
        ::BananaStand::Models::Event.new(event_data, self)
      end
    end

    def delete_resource(path)
      self.class.delete("#{api_url}#{path}", headers: headers)
    end

    def find_event(id)
      Models::Event.new(self.class.get("#{api_url}#{Models::Event.resource_path}/#{id}.json", headers: headers), self)
    end

    def product_page_html(product_id, visitor_id = nil)
      request_url = "#{api_url}stores/#{@public_key}/content/product_page.html"
      request_url = request_url + "?product_id=#{product_id}"
      request_url = request_url + "&visitor_id=#{visitor_id}" if visitor_id.present?
      self.class.get(request_url, headers: headers.merge('Content-Type' => 'text/html'))
    end

    def push_view_event(product_id, visitor_id, customer_id = nill)
      push_event('view', product_id, visitor_id, customer_id)
    end

    def push_add_to_cart_event(product_id, visitor_id, customer_id = nill)
      push_event('add_to_cart', product_id, visitor_id, customer_id)
    end

    def push_order_event(product_id, visitor_id, customer_id = nill)
      push_event('order', product_id, visitor_id, customer_id)
    end

    def push_event(event_code, product_id, visitor_id, customer_id = nil)
      customer_id ||= 0 # 0 means unknown customer ID
      request_url = "#{api_url}stores/#{@public_key}/push_event/#{event_code}/"
      request_url = request_url + "p/#{product_id}/c/#{customer_id}.png"
      request_url = request_url + "?visitor_id=#{visitor_id}" if visitor_id.present?
      self.class.get(request_url, headers: headers)
    end

    private

    def headers
      {
        'X-Api-Client' => 'Banana Stand Ruby Gem',
        'X-Secret-Key' => @secret_key,
        'X-Public-Key' => @public_key,
        'Content-Type' => 'application/json'
      }
    end
  end
end
