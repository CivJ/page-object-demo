require_relative '../spec_helper'
require_relative '../../lib/site/jobs'

describe 'test.wonolo.com team creation' do

  # TODO: Think about cleaning up after tests. Writing another test to do deletion is out of scope for this demo.
  it 'creates a team' do
    wonolo = Site::Wonolo.new
    login_page = wonolo.login_page.open
    dashboard_page = login_page.login_as
    team_modal = dashboard_page.team_page.open_team_modal
    name = "auto_test_team#{Time.now.to_i}"
    team_modal.new_team(name)
    expect(wonolo.browser.text.include?(name)).to be true
  end
end
