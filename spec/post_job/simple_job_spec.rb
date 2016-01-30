require_relative '../../lib/site/jobs'

describe 'test.wonolo.com' do
  it 'should login' do
    site = Site::Jobs.new
    site.login
  end
end
