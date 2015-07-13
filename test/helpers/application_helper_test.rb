require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'full title helper' do
    assert_equal full_title, t('application.title')
    assert_equal full_title('title'), "title | #{t('application.title')}"
  end
end
