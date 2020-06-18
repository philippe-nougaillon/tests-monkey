# README

## Cette application permet de simuler l'activité d'un utilisateur sur un site web.

En utilisant un langage de script simple à base de verbes tels que 'visit', 'click', 'fill_in', 'take_snapshot', vous allez pouvoir décrire une suite d'actions qui seront jouées et rejouées à volonté.

Ex: Pour tester si un article est toujours en rupture de stock sur amazon

```
url = 'https://www.amazon.fr/gp/product/B087XP46LX'
visit url
assert_selector 'span', text: 'Temporairement en rupture de stock.'
```

Ex: Pour tester si un utilisateur peut se connecter et trouve le bon contexte à son arrivée

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

Les instructions des scripts d'exemples ci-dessus sont issues du système de test de Ruby on Rails. Pour en savoir plus, veuillez consulter la documentation : https://guides.rubyonrails.org/testing.html

# Installation
Cette application nécessite Ruby 2.7 et Ruby on Rails 6.0. Pour les installer, veuillez consulter cette page : https://guides.rubyonrails.org/getting_started.html

Le système de tests utilise le navigateur Chrome, qui est donc requis.

Pour installer l'application, clonez ce répertoire puis lancer les commandes suivantes :

```
~$ cd tests_monkey
~/tests_monkey/$ rails db:reset
~/tests_monkey/$ bundle install
~/tests_monkey/$ rails s
```

Puis lancer votre navigateur et visitez l'adresse suivante : http://localhost:3000

# Screenshot
![screenshot](https://github.com/philippe-nougaillon/Tests_monkey/blob/master/public/Capture_2020-06-18_13-06-54.png)