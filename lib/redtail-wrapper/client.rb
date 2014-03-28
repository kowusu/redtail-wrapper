module RedtailWrapper
  class Client
    attr_accessor :ruby_redtail, :redtail_user
    def initialize()
      self.ruby_redtail = RubyRedtail.configure do |config|
        config.api_key = "#{ENV['REDTAIL_API_KEY']}"
        config.secret_key = "#{ENV['REDTAIL_SECRET_KEY']}"
        config.api_uri = "#{ENV['REDTAIL_API_URI']}"
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
