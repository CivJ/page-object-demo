require 'watir-webdriver'

module Site

  attr_reader :browser

  class BrowserContainer
    def initialize(browser)
      @browser = browser
    end
  end

  class LoginPage < BrowserContainer
    URL = 'test.wonolo.com/jobs'

    ID_USER_EMAIL = 'user_email'
    ID_USER_PASSWORD = 'user_password'
    NAME_LOGIN_BUTTON = 'commit'

    def open
      @browser.goto(URL)
      self
    end

    def login_as(user = 'john.crimmins@gmail.com', password = 'password')
      @browser.text_field(id: ID_USER_EMAIL).set(user)
      @browser.text_field(id: ID_USER_PASSWORD).set(password)
      @browser.button(name: NAME_LOGIN_BUTTON).click
    end
  end

  class Jobs < BrowserContainer
    ID_TEAM_NAME = 'team_name'
    ID_TEAM_CREATE = 'create_team_modal'

    # TODO: Resolve these another way, using english is brittle.
    TEXT_TEAM_LINK = 'Teams'
    TEXT_ADD_TEAM_LINK = '+ New Team'

    # TODO: Multiple browsers. Browser options could be read from a config file at runtime.
    def initialize(browser = :chrome)
      @browser = Watir::Browser.new
    end

    def login_page
      @login_page = Site::LoginPage.new(@browser)
    end

    # TODO: build in a check to make sure we're in the right place before trying to click the link.
    # This could get pretty sophisticated. We could model entire workflows to ensure we could only
    # take actions that make sense given our current location on the site and other factors.
    def create_team(name)
      link = @browser.link(text: TEXT_TEAM_LINK)
      link.click
      link = @browser.link(text: TEXT_ADD_TEAM_LINK)
      link.click

      team_name = name + Time.now.to_i.to_s
      set_text(ID_TEAM_NAME, team_name)
      @browser.button(id: ID_TEAM_CREATE).click
      team_name
    end

    private
    def set_text(id, text)
      @browser.text_field(id: id).when_present.set(text)
    end
  end
end
