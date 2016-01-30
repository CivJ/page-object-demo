require_relative '../spec_helper'
require_relative '../../lib/site/jobs'

describe 'test.wonolo.com job creation' do
  it 'creates a simple job' do
    wonolo = Site::Wonolo.new
    login_page = wonolo.login_page.open
    dashboard_page = login_page.login_as
    job_page = dashboard_page.new_job
    job_page
      .job_name("auto_test_job#{Time.now.to_i}")
      .category('Delivery')
      .description('Delivering software by writing automated tests.')
      .workers_needed('2')
      .select_badges([Site::JobPage::DELIVERY_BADGE, Site::JobPage::DELIVERY_BADGE_GOLD])
      .address('100 foo street')
      .city('San Francisco')
      .zip('94115')
  end
end
