require "application_system_test_case"

class AutomatTest < ApplicationSystemTestCase

    script_id = ENV['script_id']
    headless_mode  = ENV['headless_mode']

    if headless_mode == '1'
        driven_by :selenium, using: :headless_chrome, screen_size: [1024, 768]
    else    
        driven_by :selenium, using: :chrome, screen_size: [1024, 768]
    end 

    test 'assertions from database' do
        ActiveRecord::Base.establish_connection('development'.to_sym)
        results = ActiveRecord::Base.connection.execute("select body from scripts where id=#{ script_id } limit 1")
        assertions = results[0]['body']

        eval(assertions)

        take_screenshot
    end    

end
