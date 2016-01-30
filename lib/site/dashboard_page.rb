require_relative './browser_container'
require_relative './job_page'

module Site
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

    private

    def click_link(text)
      link = @browser.link(text: text)
      link.click
    end
  end
end
