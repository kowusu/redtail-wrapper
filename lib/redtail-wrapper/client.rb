module RedtailWrapper
  class Client
    attr_accessor :ruby_redtail, :redtail_user
    def initialize(env)
      self.ruby_redtail = RubyRedtail.configure do |config|
        config.api_key = env[:api_key] #'697DC717-656C-4179-972F-4FF004E88C08'
        config.secret_key = env[:secret_key] #'2A96B61B18664492B0E16E2480573392'
        config.api_uri = env[:api_uri] #'http://dev.api2.redtailtechnology.com/crm/v1/rest'
      end
    end
    
    def authenticate(username, password)
      self.redtail_user = RubyRedtail::User.new('Basic',username, password)
      if @redtail_user
        return true
      end
      return false
    end
    
    def get_user_key
      #@redtail_user.user_key 
    end
    
    def settings
      @redtail_user.settings
    end
    
    def contacts
      @redtail_user.contacts
    end
    
  end
end
