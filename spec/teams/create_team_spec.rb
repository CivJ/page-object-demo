require_relative '../../lib/site/jobs'

describe 'test.wonolo.com team creation' do
  it 'should create a team' do
    wonolo = Site::Wonolo.new
    login_page = wonolo.login_page.open
    dashboard_page = login_page.login_as
    team_modal = dashboard_page.team_page.open_team_modal
    name = "auto_test_team#{Time.now.to_i.to_s}"
    team_modal.create_team(name)
    expect(wonolo.browser.text.include?(name)).to be true
  end
end
