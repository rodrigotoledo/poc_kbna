# frozen_string_literal: true

RSpec.describe PocKbna::Pix::Payment do
  it 'create a pix' do
    pix_payment = PocKbna::Pix::Payment.new(150.50)
    expect(pix_payment.charge).to be true
  end
end
