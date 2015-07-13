require 'test_helper'

class UsersHelperTest < ActionView::TestCase
  test 'gravatar' do
    user = User.new name: 'Test User', email: 'user@test.com'
    html = gravatar_for user
    assert_match %r{src="https://secure\.gravatar\.com/avatar/([a-f0-9]+)\?s=80"}, html
    assert_match %r{alt="#{user.name}"}, html
  end
end
