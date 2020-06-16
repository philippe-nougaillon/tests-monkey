require "application_system_test_case"

class VaultsTest < ApplicationSystemTestCase
  
  url = 'https://login.veevavault.com/auth/login'

  test 'visiting the authentification page' do
    visit url
  
    assert_selector 'span', text: 'Log in'
  end

  test 'should log in' do
    visit url

    fill_in 'j_username', with: 'ValidationTest@vv-consulting.com'
    click_on 'continue'

    fill_in 'j_password', with: 'ValidationBot1'
    click_on 'login'

    sleep(10)

    # take_screenshot

    assert_selector 'h2', text: 'All Tasks'

  end

end
