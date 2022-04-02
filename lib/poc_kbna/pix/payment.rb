require 'uri'
require 'net/http'
require 'openssl'
require 'active_support'
require 'active_support/core_ext'
module PocKbna
  module Pix
    class Payment
      attr_accessor :pix_url, :amount, :expire_at, :read_body

      def initialize(amount = nil)
        PocKbna.configuration.valid?

        @amount     = amount
        @expire_at  = Time.now+1.days
      end

      def charge
        url = URI(pix_url)

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true

        request = Net::HTTP::Post.new(url)
        request["Accept"] = 'application/json'
        request["User-Agent"] = PocKbna.configuration.user_agent
        request["Content-Type"] = 'application/json'
        request["Authorization"] = "Bearer #{PocKbna.configuration.token}"
        request.body = "{\"amount\":#{@amount},\"pix_account_id\":#{PocKbna.configuration.pix_account_id},\"expire_at\":\"#{@expire_at}\"}"

        response = http.request(request)
        @read_body = JSON.parse(response.read_body)
        if success?
          @read_body
        else
          errors = @read_body["errors"]
          raise errors.map{|t| t["title"]}.to_sentence
        end
      end

      private
        def success?
          @read_body && @read_body["errors"].nil?
        end

        def error?
          @read_body && !@read_body["errors"].nil?
        end

        def pix_url
          "#{PocKbna.endpoint}/charge/pix"
        end
    end
  end
end