require_relative '../spec_helper'
require_relative '../../lib/site/jobs'

describe 'test.wonolo.com job creation' do
  it 'creates a simple job' do
    wonolo = Site::Wonolo.new
    login_page = wonolo.login_page.open
    dashboard_page = login_page.login_as
    dashboard_page.new_job
  end
end
