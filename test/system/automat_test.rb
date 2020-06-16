require "application_system_test_case"

class AutomatTest < ApplicationSystemTestCase

    test 'assertions from database' do
        ActiveRecord::Base.establish_connection('development'.to_sym)
        results = ActiveRecord::Base.connection.execute('select body from scripts limit 1')
        assertions = results[0]['body']

        eval(assertions)
    end    

end
