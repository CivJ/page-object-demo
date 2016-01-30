require_relative './browser_container'

module Site
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
end
