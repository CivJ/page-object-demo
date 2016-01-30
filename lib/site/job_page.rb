require_relative './browser_container'

module Site
  class JobPage < BrowserContainer
    ID_NAME = 'job_request_request_name'
    ID_CATEGORY = 'job_request_category'
    ID_TASKS = 'job_request_description_tasks'
    ID_WORKERS_NEEDED = 'job_request_slots'
    ID_JOB_ADDRESS = 'job_request_address'
    ID_JOB_CITY = 'job_request_city'
    ID_JOB_ZIP = 'job_request_zip'

    DELIVERY_BADGE = '2'
    DELIVERY_BADGE_GOLD = '22'

    def job_name(name)
      set_text(ID_NAME, name)
      self
    end

    # TODO: Think about localization and select boxes.
    def category(category)
      @browser.select_list(id: ID_CATEGORY).select(category)
      self
    end

    def description(description)
      set_text(ID_TASKS, description)
      self
    end

    def workers_needed(count)
      set_text(ID_WORKERS_NEEDED, count)
      self
    end

    def address(address)
      set_text(ID_JOB_ADDRESS, address)
      self
    end

    def city(city)
      set_text(ID_JOB_CITY, city)
      self
    end

    def zip(zip)
      set_text(ID_JOB_ZIP, zip)
      self
    end

    def select_badges(badges)
      badges = Array(badges)
      badges.each do |badge|
        @browser.checkbox(value: badge).set
      end
      self
    end
  end
end
