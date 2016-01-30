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
    CSS_CALENDAR_BUTTON = 'span.input-group-addon > i.glyphicon-calendar'

    CLASS_CALENDAR_DONE_LINK = 'done-datetime-picker-button'

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

    # TODO: This does not work. Follow up with someone.
    # rubocop:disable Style/HashSyntax
    # rubocop:disable Lint/UnusedMethodArgument
    def start_time(time)
      # TODO: *** Follow up with the front-end engineer about why I have to fire this event manually.
      # Simply calling '.click' as one would expect brings up the calendar, but all the elements are 'hidden'
      # and unusable for the remainder of the test.
      @browser.elements(css: CSS_CALENDAR_BUTTON)[1].fire_event('onclick')
      # Sometimes this element is visible, sometimes it is not. This can depend on things like
      # size of browser window. The calendar might render off the screen.
      # But even if I gaurantee the calendar is on the screen it will not always work.
      @browser.element(css: 'td[data-day="01/30/2016"]').click
      @browser.element(css: 'td[data-day="01/30/2016"]').fire_event('onclick')
      # sleep 5
      @browser.element(css: 'a.done-datetime-picker-button').click
      @browser.element(css: 'a.done-datetime-picker-button').fire_event('onclick')
      self
    end
  end
end
