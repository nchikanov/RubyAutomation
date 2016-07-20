require 'selenium/webdriver'

module SimpleSauce
  class << self
    attr_writer :desired_capabilities

    def sauce_server
      'ondemand.saucelabs.com'
    end

    def sauce_port
      80
    end

    def endpoint
     "http://#{ENV['SAUCE_USERNAME']}:#{ENV['SAUCE_ACCESS_KEY']}@#{sauce_server}:#{sauce_port}/wd/hub"
    end

    def environment_capabilities
      browser = ENV['SAUCE_BROWSER']
      version = ENV['SAUCE_VERSION']
      platform = ENV['SAUCE_PLATFORM']
      name = ENV['NAME']

      if browser && version && platform
        return {
          :browserName => browser,
          :version => version,
          :platform => platform,
          :name => name
        }
      end
      return nil
    end

    def default_capabilities
      {
        :browserName => 'Chrome',
        :version => '45',
        :platform => 'Windows 7'
      }
    end

    def desired_caps
      environment_capabilities || @desired_capabilities || default_capabilities
    end

    def webdriver_config
      {
        :browser => :remote,
        :url => endpoint,
        :desired_capabilities => desired_caps
      }
    end
  end
end