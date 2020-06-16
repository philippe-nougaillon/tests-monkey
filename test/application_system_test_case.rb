require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]
  
  # in order to be able to connect to external website
  Capybara.run_server = false

end
