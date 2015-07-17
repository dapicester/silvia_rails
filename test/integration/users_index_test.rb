require 'test_helper'

class UsersIndexTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users :paolo
    @non_admin = users :silvia
  end

  test 'index as admin including pagination and delete link' do
    log_in_as @admin
    get users_path
    assert_template 'users/index'
    assert_select 'div.pagination'
    first_page = User.paginate page: 1
    first_page.each do |user|
      assert_select 'a[href=?]', user_path(user), text: user.name
      unless user == @admin
        assert_select 'a[href=?]', user_path(user), text: t('users.index.delete')
      end
    end
    assert_difference 'User.count', -1 do
      delete user_path @non_admin
    end
  end

  test 'index as non-admin' do
    log_in_as @non_admin
    get users_path
    assert_select 'a', text: t('users.index.delete'), count: 0
  end
end
