# TODO: Name this file something else.
# TODO: Put these classes in seperate files eventually.
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

  class DashboardPage < BrowserContainer
    # TODO: Resolve these another way, using english is brittle.
    TEXT_TEAM_LINK = 'Teams'
    TEXT_NEW_JOB_LINK = '+ New Job'

    def team_page
      click_link(TEXT_TEAM_LINK)
      # TODO: Make some of these objects singletons
      TeamPage.new(@browser)
    end

    def new_job
      click_link(TEXT_NEW_JOB_LINK)
      JobPage.new(@browser)
    end

    class JobPage < BrowserContainer
      ID_NAME = 'job_request_request_name'
      ID_CATEGORY = 'job_request_category'

      def job_name(name)
        set_text(ID_NAME, name)
        self
      end

      # TODO: Think about localization and select boxes.
      def category(category)
        @browser.select_list(id: ID_CATEGORY).select(category)
        self
      end
    end

    private

    def click_link(text)
      link = @browser.link(text: text)
      link.click
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
