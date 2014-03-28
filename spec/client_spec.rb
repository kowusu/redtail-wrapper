require 'spec_helper'

describe RedtailWrapper::Client do
  context "login" do
    let(:client) { RedtailWrapper::Client.new }
    it "should login with correct credentials" do
      authenticate = client.authenticate "#{ENV['REDTAIL_TEST_USERNAME']}", "#{ENV['REDTAIL_TEST_PASSWORD']}"
      expect(authenticate).to be_true
    end
  end
  context "#contacts" do
    let(:client) { RedtailWrapper::Client.new }
    it "should get investor contacts" do
      client.authenticate "#{ENV['REDTAIL_TEST_USERNAME']}", "#{ENV['REDTAIL_TEST_PASSWORD']}"
      contacts = client.contacts.search_by_name('Investor')
      expect(contacts).not_to be_nil
    end
  end
  
end
