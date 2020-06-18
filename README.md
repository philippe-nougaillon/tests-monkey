# README

## Cette application permet de simuler l'activité d'un utilisateur sur un site web.

En utilisant un langage simple à base de verbes tels que 'visit', 'click', 'fill_in', 'sleep', 'take_snapshot', vous allez pouvoir écrire un script de test qui contient une suite d'actions et d'évaluation à faire. 

Si les actions fonctionnent et les évaluations sont positives, le test passe, sinon il échoue. 

Une copie d'écran est faite systématiquement en fin de script.

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

Les instructions des exemples ci-dessus sont issues du système de test de Ruby on Rails. 
Pour en savoir plus, veuillez consulter la documentation : https://guides.rubyonrails.org/testing.html

# Installation
Cette application nécessite Ruby 2.7 et Ruby on Rails 6.0. Pour les installer, veuillez consulter cette page : https://guides.rubyonrails.org/getting_started.html

Le système de tests utilise le navigateur Chrome, qui est donc requis.

Pour installer l'application, clonez ce répertoire puis lancez les commandes suivantes :

```
~$ cd tests_monkey
~/tests_monkey/$ rails db:reset
~/tests_monkey/$ bundle install
~/tests_monkey/$ rails s
```

Puis lancez votre navigateur et visitez l'adresse suivante : http://localhost:3000

# Screenshot
![screenshot](https://github.com/philippe-nougaillon/Tests_monkey/blob/master/public/Capture_2020-06-18_13-06-54.png)