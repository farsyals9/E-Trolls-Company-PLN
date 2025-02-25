# APLIKASI PEMBAYARAN LISTRIK PASCABAYAR - THIS REPOSITORY STILL IN DEVELOPMENT
# E-TROLLS-COMPANY-PLN
## This Website Development Requirements

Here is what you need to download for the first time if you want to develop this web site with my latest source code :

- [Composer 2.7.5](https://getcomposer.org/)
- [CodeIgniter 4 4.5.3](https://github.com/codeigniter4/CodeIgniter4/releases/tag/v4.5.3)
- [XAMPP 7.4.29-1 Windows](https://sourceforge.net/projects/xampp/files/XAMPP%20Windows/7.4.29-1/)
- [Git](https://git-scm.com/downloads) bash

## Features

- Login and Register for customer
- Customers can calculate how much electricity bills per month using the integrated calculator inside this website
- Customers can make electricity payments on this website (<b>not finished yet</b>)
- Admin account for managing customers
- Admin can manage customer data and customer billing data
- Edit Profile features for admin account and customer account
- Update Password features for admin account and customer account

## Setup

- Make sure that you have already installed all the website development requirements above.
- [<b>Download](https://github.com/farsyals9/ranMa/archive/refs/heads/master.zip) this project file </b> and unzip it wherever you want.
- Or you can use <b>git bash</b> with `git bash here` to the specified folder and start cloning this repository with this command `git clone https://github.com/farsyals9/E-Trolls-Company-PLN.git`.
- Copy and paste `env` file to the same directory file and rename it to `.env` and then paste this code to set the database:

```
# ENVIRONMENT

CI_ENVIRONMENT = development

# APP

app.baseURL = 'http://localhost:8080'
# If you have trouble with `.`, you could also use `_`.
# app_baseURL = ''
# app.forceGlobalSecureRequests = false
# app.CSPEnabled = false

# DATABASE

database.default.hostname = localhost
database.default.database = payment
database.default.username = root
database.default.password =
database.default.DBDriver = MySQLi
database.default.DBPrefix =
database.default.port = 3306
```

- To import the database, go to [`phpmyadmin`](http://localhost/phpmyadmin) and create a new database named `payment`.
- In [`phpmyadmin`](http://localhost/phpmyadmin), select the `payment` database you created and then select import.
- Import the database named `payment.sql` inside directory file `APPPATH\app\Database`.
- This website is currently using [`http://localhost:8080/`](http://localhost:8080/) from spark. To start the localhost with [spark](https://codeigniter.com/user_guide/cli/spark_commands.html), run this command `php spark serve` from your terminal to turn on the localhost.
- If you want to develop this website using XAMPP you can change the <b>baseURL</b> in `App.php` and make sure the project file is saved in `htdocs`.

## Myth\Auth Library Setup

- Run `composer update` from the terminal to update the dependencies with <b>composer</b>.
- After the update is complete, you can find folder named `myth\auth` inside `APPPATH\app\Vendor` and start setting up this library.
- If you cant find the library inside `Vendor`, try to run this command inside terminal

```
composer require myth/auth
```

- Find `Auth.php` inside `Vendor\myth\auth\Config\` and change the variable below

### Default User Group

Change value `$defaultUserGroup` variable to:

```
public $defaultUserGroup = 'pelanggan';
```

### Views

Change value `$views` variable to:

```
public $views = [
    'login'       => 'Myth\Auth\Views\login',
    'register'    => 'Myth\Auth\Views\register',
    'forgot'      => 'Myth\Auth\Views\forgot',
    'reset'       => 'Myth\Auth\Views\reset',
    'emailForgot' => 'Myth\Auth\Views\emails\forgot',
];
```

### Allow Password Reset via Email

Change value `$activeResetter` variable to:

```
public $activeResetter = null;
```

### Allow Persistent Login Cookies (Remember me)

Change value `$allowRemembering` variable to:

```
public $allowRemembering = true;
```

### Remember Length

Change the value variable '$rememberLength' to whatever you want:

```
public $rememberLength = 30 * DAY;
```

## Found a problem when developing this application ?

Create new [issue](https://github.com/farsyals9/E-Trolls-Company-PLN/issues) for this repository or you can try to contact my [email](mailto:farsyals9@gmail.com) / [instagram](https://www.instagram.com/farsya_ls/) 
