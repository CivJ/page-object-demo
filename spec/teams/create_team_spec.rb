require_relative '../../lib/site/jobs'

describe 'test.wonolo.com team creation' do
  it 'should create a team' do
    site = Site::Jobs.new
    site.login
    full_team_name = site.create_team('auto_test_team')
    expect(site.browser.text.include?(full_team_name)).to be true
  end
end
