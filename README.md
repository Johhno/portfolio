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

composer update "symfony/*" --with-all-dependencies --no-interaction --no-ansi
composer require symfony/flex --no-interaction --no-ansi

git add composer.json composer.lock
git commit -m "backup avant maj symfony 6.4 " || true
composer update "symfony/*" --with-all-dependencies -W
composer require sensio/framework-extra-bundle:^6.2 -W
composer run-script auto-scripts
php bin/console cache:clear