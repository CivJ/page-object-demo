# TODO: Name this file something else.
# TODO: Put these classes in seperate files eventually.
require_relative './browser_container'
require_relative './dashboard_page'

module Site
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
      DashboardPage.new(@browser)
    end
  end

  class TeamPage < BrowserContainer
    # TODO: Resolve these another way, using english is brittle.
    TEXT_ADD_TEAM_LINK = '+ New Team'

    def open_team_modal
      link = @browser.link(text: TEXT_ADD_TEAM_LINK)
      link.click
      # TODO: Make some of these objects singletons
      TeamModal.new(@browser)
    end
  end

  class TeamModal < BrowserContainer
    ID_TEAM_NAME = 'team_name'
    ID_TEAM_CREATE = 'create_team_modal'
    def new_team(name)
      set_text(ID_TEAM_NAME, name)
      @browser.button(id: ID_TEAM_CREATE).click
    end
  end

  class Wonolo < BrowserContainer
    # TODO: Multiple browsers. Browser options could be read from a config file at runtime.
    def initialize
      @browser = Watir::Browser.new
    end

    def login_page
      @login_page = LoginPage.new(@browser)
    end
  end
end
