require_relative '../../lib/site/jobs'

describe 'test.wonolo.com team creation' do
  it 'should create a team' do
    site = Site::Jobs.new
    site.login
    site.create_team('auto_test_team')
  end
end
