# frozen_string_literal: true

require "poc_kbna"
require "dotenv"
require 'webmock'
include WebMock::API

WebMock.enable!
Dotenv.load(".env.test")

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def set_configuration
  PocKbna.configure do |config|
    config.env            = ENV['POC_KBNA_ENV']
    config.token          = ENV['POC_KBNA_TOKEN']
    config.user_agent     = ENV['POC_KBNA_USER_AGENT']
    config.pix_account_id = ENV['POC_KBNA_PIX_ACCOUNT_ID']
  end
end