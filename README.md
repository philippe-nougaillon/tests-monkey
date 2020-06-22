# README

## Simuler l'activité d'un utilisateur sur un site web

Ce projet est une interface avec le système de test de Ruby on Rails et Capybara.

En utilisant un langage simple à base de verbes tels que 'visit', 'click', 'fill_in', 'sleep', vous allez pouvoir écrire un script qui contient une suite d'actions à effectuer sur le site à tester. 

L'application va exécuter ce script pas à pas en simulant les actions d'un utilisateur lambda ou authentifié. Ces actions sont visibles à l'écran comme si elles étaient faites par vous-même.

Si les actions fonctionnent et si les évaluations (assertions) sont positives, le test passe.

Une copie d'écran est faite systématiquement en fin de script.

Plusieurs scripts peuvent être lancés en une fois, en mode visible ou invisible (headless mode).

## Exemple de script

### Tester si un article est en rupture de stock sur Amazon

```
url = 'https://www.amazon.fr/gp/product/B087XP46LX'
visit url
assert_selector 'span', text: 'Temporairement en rupture de stock.'
```

### Tester si un utilisateur peut se connecter et s'il trouve le bon contexte à son arrivée

```
url = 'https://login.veevavault.com/'

visit url
assert_selector 'span', text: 'Log in'

fill_in 'j_username', with: 'ValidationTest@vv-consulting.com'
click_on 'continue'

fill_in 'j_password', with: 'Password'
click_on 'login'

sleep(10)

assert_selector 'h2', text: 'All Tasks'
```

Les instructions utilisées ci-dessus ne sont qu'un échantillon des possibilités offertes. Elles sont beaucoup plus nombreuses et issues du système de test éprouvé de Ruby on Rails. 

Pour en savoir plus, consultez la documentation : https://guides.rubyonrails.org/testing.html

# Installation

Ce projet tourne sous Ruby 2.7/Ruby on Rails 6. Pour les installer, veuillez consulter cette page : https://guides.rubyonrails.org/getting_started.html

Le navigateur Chrome est utilisé pour exécuter les tests, il est donc aussi requis.

Une fois Ruby/Rails/Sqlite installés votre machine il suffit de cloner ce repo github puis de lancer les commandes suivantes :

```
~$ cd tests_monkey
~/tests_monkey/$ bundle install
~/tests_monkey/$ rails db:reset
~/tests_monkey/$ rails s
```

Lancez maintenant votre navigateur et visitez l'adresse suivante : http://localhost:3000
Et voilà :)

# Screenshot
![screenshot](https://github.com/philippe-nougaillon/Tests_monkey/blob/master/public/Capture2020-06-22_11-17-48.png)