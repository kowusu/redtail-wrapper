require 'spec_helper'

describe RedtailWrapper::Client do
  context "login" do
    let(:client) { RedtailWrapper::Client.new :api_key => '',
                                        :secret_key => '',
                                        :api_uri => ''}
    it "should login with correct credentials" do
      authenticate = client.authenticate '', ''
      expect(authenticate).to == true
    end
  end
  context "#contacts" do
    let(:client) { RedtailWrapper::Client.new :api_key => '',
                                        :secret_key => '',
                                        :api_uri => ''}
    it "should get investor contacts" do
      client.authenticate '', ''
      contacts = client.contacts.search_by_name('Investor')
      expect(contacts).to_not be_nil
    end
  end
  
end
