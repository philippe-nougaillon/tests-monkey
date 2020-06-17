# README

## Cette application permet de simuler l'activité d'un utilisateur sur un site web.

En utilisant un langage de script simple à base de verbe tels que 'visit', 'click', 'fill_in', 'take_snapshot', vous allez pouvoir décrire une suite d'actions qui seront jouées et rejouées à volonté.

Ex: Pour tester si un article est toujours en rupture de stock sur amazon

```
url = 'https://www.amazon.fr/gp/product/B087XP46LX'
visit url
assert_selector 'span', text: 'Temporairement en rupture de stock.'
take_screenshot
```

Les instructions sont issues du système de test de Ruby on Rails. Pour en savoir plus, veuillez consulter la documentation : https://guides.rubyonrails.org/testing.html

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

