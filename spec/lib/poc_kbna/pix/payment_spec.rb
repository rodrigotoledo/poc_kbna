# frozen_string_literal: true

RSpec.describe PocKbna::Pix::Payment do
  it 'success to create a pix' do
    pix_payment = PocKbna::Pix::Payment.new(150.50)
    stub_request(:post, "https://api-sandbox.kobana.com.br/v2/charge/pix").
      with(
        body: "{\"amount\":#{pix_payment.amount},\"pix_account_id\":123,\"expire_at\":\"#{pix_payment.expire_at}\"}",
        headers: {
      'Accept'=>'application/json',
      'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
      'Authorization'=>'Bearer 123321',
      'Content-Type'=>'application/json',
      'Host'=>'api-sandbox.kobana.com.br',
      'User-Agent'=>'test@test.com'
        }).
      to_return(status: 200, body: "{\"id\": 42,\"txid\": null,\"status\": \"opened\"}", headers: {})

    expect(pix_payment.charge).not_to be false
  end
end
