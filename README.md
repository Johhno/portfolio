# Portfolio
Le portfolio est développé avec Symfony 6.4, utilisant :  
- **Doctrine ORM 3.6.2** 
- **Karser reCAPTCHA3 Bundle 0.3**


### VSCode Extensions recommandées
- **PHP Intelephense** – Ben Mewburn  
- **Twig Language 2** – mblode  
- **PHP Namespace Resolver** – Mehedi Hassan 

### Settings

- Suggest basic disable variables  
- Format on save  
- Emmet include languages : `twig` → `html`

## Prérequis
Importer la base de données
importer les fichiers .env
Creer user
C:\laragon\bin\mysql\mysql-8.0.30-winx64\bin\mysql -u root -e "CREATE USER 'portfolio_user'@'localhost' IDENTIFIED BY 'portfolio_pass'; GRANT ALL PRIVILEGES ON portfolio.* TO 'portfolio_user'@'localhost'; FLUSH PRIVILEGES;"
### Installer Scoop
Ouvrir powershell en mode sans admin
windows + r > runas /trustlevel:0x20000 powershell
```shell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
```

### Installer Symfony 
```shell
scoop install symfony-cli
```
### Installer Composer 
https://getcomposer.org/

### Mettre à jour Composer et dépendances Symfony
#### Symfony Flex
```bash 
composer install
```
```bash 
composer show
```
```shell
symfony serve              # lance le serveur en premier plan
(background)symfony serve -d
```

### Gérer les migrations Doctrine
```shell
php bin/console make:migration
php bin/console doctrine:database:create
php bin/console doctrine:migrations:migrate
```

## Doc
https://symfony.com/doc/current/setup/symfony_server.html
## PHP not found
https://www.forevolve.com/en/articles/2016/10/27/how-to-add-your-php-runtime-directory-to-your-windows-10-path-environment-variable/
## Notes
- phpmyadmin => 5.6 
- phpmyadmin6 => PHP 7.3+
```shell
composer update "symfony/*" --with-all-dependencies --no-interaction --no-ansi
composer require symfony/flex --no-interaction --no-ansi

git add composer.json composer.lock
git commit -m "backup avant maj symfony 6.4 " || true
composer update "symfony/*" --with-all-dependencies -W
composer run-script auto-scripts
php bin/console cache:clear

use Symfony\Component\Security\Http\Attribute\IsGranted;
    #[Route('/purchases', name: 'purchase_index')]
    #[IsGranted('ROLE_USER', message: 'Vous devez être connecté pour consulter vos commandes.')]
    public function index(): Response

        /**
     * @Route("/purchases", name="purchase_index")
     * @IsGranted("ROLE_USER", message="Vous devez être connecté pour consulter vos commandes.")
     */
```