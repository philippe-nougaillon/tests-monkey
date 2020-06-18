require "application_system_test_case"

class AutomatTest < ApplicationSystemTestCase

    script_id = ENV['script_id']

    test 'assertions from database' do
        ActiveRecord::Base.establish_connection('development'.to_sym)
        results = ActiveRecord::Base.connection.execute("select body from scripts where id=#{ script_id } limit 1")
        assertions = results[0]['body']

        eval(assertions)

        take_screenshot
    end    

end
