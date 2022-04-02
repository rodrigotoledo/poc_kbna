# frozen_string_literal: true

require_relative "poc_kbna/version"

require 'poc_kbna/configuration'
require 'poc_kbna/pix/payment'

module PocKbna
  class Error < StandardError; end

  ENDPOINT = {
    production: 'https://api.kobana.com.br/v2',
    sandbox: 'https://api-sandbox.kobana.com.br/v2'
  }

  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end

    def endpoint
      ENDPOINT[configuration.env.to_sym]
    end

    def production?
      env == 'production'
    end

    def sandbox?
      env == 'sandbox'
    end

    def env
      configuration.env
    end
  end
end
