# encoding: UTF-8
require 'uri'
require 'net/http'
require 'ease_http/utils'

module EaseHTTP
  class Connection
    def initialize(endpoint, options={})
      @endpoint = endpoint
      uri = URI(endpoint)
      timeout = options.delete(:timeout) || 0.2

      @http = Net::HTTP.new(uri.host, uri.port)
      @http.use_ssl = uri.scheme == 'https'
      @http.read_timeout = timeout
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

      request = Net::HTTP::Get.new uri.request_uri, headers
      @http.request request, &block
    end

    # path - path to request
    # options
    #   :headers
    #   :data
    def post(path, options={}, &block)
      headers = options.delete :headers
      data = options.delete :data
      content_type = (headers && headers['Content-Type']) || content_type(data)

      request = Net::HTTP::Post.new path, headers

      # convert hash data to array data
      data = data.inject([]) do |memo, (key, value)|
        if value.is_a?(File)
          memo << [key.to_s, value, { content_type: Utils.mime_type(value.path) }]
        else
          memo << [key.to_s, value]
        end
      end

      request.set_form data, content_type

      @http.request request, &block
    end

    private
      def content_type(data)
        data.any? { |key, value| value.is_a?(File) } ?
          'multipart/form-data' :
          'application/x-www-form-urlencoded'
      end
  end
end
