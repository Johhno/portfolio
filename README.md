# portfolio
portfolio

# Extensions VCStudio
PHP intelephense . Ben Mewburn

Twig language 2 . mblode

PHP Namespace Resolver . Mehedi Hassan

## Settings
suggest basic disable variables
format on save

emmet include languages
item twig value html

## Prérequis

- install scoop
```shell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

- install symfony 
```shell
scoop install symfony-cli
```
- install/update composer
```shell
Symfony flex => composer require annotations (Routes)
                composer require twig (HTML)
                composer req debug
                composer req doctrine
```
- lancer
```shell
symfony serve
(background)symfony serve -d
```
- folder migrations

```shell
php bin/console make:migration
```

## Doc
https://symfony.com/doc/current/setup/symfony_server.html
## PHP not found
https://www.forevolve.com/en/articles/2016/10/27/how-to-add-your-php-runtime-directory-to-your-windows-10-path-environment-variable/
## Notes
- phpmyadmin => 5.6 
- phpmyadmin6 => PHP 7.3+