class Configuration
  attr_accessor :env, :token, :user_agent, :pix_account_id

  def initialize
    @env            = ENV.fetch('POC_KBNA_ENV', 'sandbox')
    @token          = ENV.fetch('POC_KBNA_TOKEN', nil)
    @user_agent     = ENV.fetch('POC_KBNA_USER_AGENT', nil)
    @pix_account_id = ENV.fetch('POC_KBNA_PIX_ACCOUNT_ID', nil)
  end

  def valid?
    raise 'Missing environment configuration' if @token.nil? || @user_agent.nil? || @pix_account_id.nil?

    true
  end
end