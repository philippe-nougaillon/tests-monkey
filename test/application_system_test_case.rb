require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  
  driven_by :selenium, using: :headless_chrome, screen_size: [1024, 768]
  
  # in order to be able to connect to external website
  Capybara.run_server = false

end
