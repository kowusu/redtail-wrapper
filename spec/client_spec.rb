require 'spec_helper'

describe RedtailWrapper::Client do
  context "login" do
    let(:client) { RedtailWrapper::Client.new }
    it "should authenticate with correct credentials" do
      authenticate = client.authenticate "#{ENV['REDTAIL_TEST_USERNAME']}", "#{ENV['REDTAIL_TEST_PASSWORD']}"
      expect(authenticate).to be_true
    end
    let(:bad_client) { RedtailWrapper::Client.new }
    it "should not authenticate with correct credentials" do
      authenticate = bad_client.authenticate "wrong", "info"
      expect(authenticate).to be_false
    end
  end
  context "#contacts" do
    let(:client) { RedtailWrapper::Client.new }
    it "should get investor contacts" do
      client.authenticate "#{ENV['REDTAIL_TEST_USERNAME']}", "#{ENV['REDTAIL_TEST_PASSWORD']}"
      contacts = client.get_contacts_for('Investor')
      expect(contacts).not_to be_nil
    end
    it "should not get investor contacts" do
      client.authenticate "#{ENV['REDTAIL_TEST_USERNAME']}", "#{ENV['REDTAIL_TEST_PASSWORD']}"
      contacts = client.get_contacts_for(nil)
      expect(contacts).to be_nil
    end
  end
  
end
