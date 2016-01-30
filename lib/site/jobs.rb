require 'watir-webdriver'

module Site
  class Jobs
    URL = 'test.wonolo.com/jobs'
    ID_USER_EMAIL = 'user_email'
    ID_USER_PASSWORD = 'user_password'
    NAME_LOGIN_BUTTON = 'commit'

    # TODO: Browser options should be read from a config file at runtime.
    def initialize(user_name = 'john.crimmins@gmail.com', password = 'password', browser = :chrome)
      @user_name = user_name
      @password = password
      @browser = Watir::Browser.new
    end

    def login
      @browser.goto(URL)
      @browser.text_field(id: ID_USER_EMAIL).set(@user_name)
      @browser.text_field(id: ID_USER_PASSWORD).set(@password)
      @browser.button(name: NAME_LOGIN_BUTTON).click
    end
  end
end
