require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test 'account_activation' do
    user = users :paolo
    user.activation_token = User.new_token
    mail = UserMailer.account_activation user
    assert_equal t('user_mailer.account_activation.subject'), mail.subject
    assert_equal [user.email], mail.to
    assert_equal %w[no-reply@example.com], mail.from
    assert_match user.name, mail.body.encoded
    assert_match user.activation_token, mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end

  test 'password_reset' do
    user = users :paolo
    user.reset_token = User.new_token
    mail = UserMailer.password_reset user
    assert_equal t('user_mailer.password_reset.subject'), mail.subject
    assert_equal [user.email], mail.to
    assert_equal %w[no-reply@example.com], mail.from
    assert_match user.reset_token, mail.body.encoded
    assert_match CGI::escape(user.email), mail.body.encoded
  end
end
