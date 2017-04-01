# encoding: UTF-8
require 'uri'
require 'net/http'

module EaseHTTP
  class Connection
    def initialize(endpoint)
      @endpoint = endpoint
      uri = URI(endpoint)

      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = uri.scheme == 'https'
    end

    # path - path to request
    # options
    #   :headers
    #   :query
    def get(path, options={}, &block)
      uri = URI.join(@endpoint, path)
      headers = options.delete(:headers)
      query = options.delete(:query)

      if query
        uri.query = URI.encode_www_form(query)
      end

      @http.request_get uri.request_uri, headers, &block
    end

    # path - path to request
    # options
    #   :headers
    #   :data
    def post(path, options={}, &block)
      headers = options.delete :headers
      data = options.delete :data

      @http.request_post path, data, headers, &block
    end
  end
end
