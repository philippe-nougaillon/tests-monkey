require "application_system_test_case"

class AmazonsTest < ApplicationSystemTestCase
 
  # $ rails test test/system/amazons_test.rb

  test 'Livre Indisponible ?' do
    # Tester si le livre 'Programmation mobile iOS 8 avec Swift' est indisponible 

    url = 'https://www.amazon.fr/Programmation-mobile-iOS-avec-Swift/dp/2212139926'

    visit url
  
    assert_selector 'span', text: 'Actuellement indisponible'
  end

  test 'Chromebook HP indisponible ?' do

    url = 'https://www.amazon.fr/gp/product/B087XP46LX'

    visit url

    assert_selector 'span', text: 'Temporairement en rupture de stock.'

  end

end
