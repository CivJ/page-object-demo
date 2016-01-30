require 'watir-webdriver'

module Site
  class BrowserContainer
    attr_reader :browser
    def initialize(browser)
      @browser = browser
    end

    def set_text(id, text)
      @browser.text_field(id: id).when_present.set(text)
    end
  end
end
