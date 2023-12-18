cd
sudo apt update && apt upgrade -y
apt install apache2
ufw allow "Apache"
ufw allow "Apache Full"
ufw allow "OpenSSH"
yes | sudo ufw enable
apt install php php-common php-curl php-pgsql php-zip -y
apt install postgresql postgresql-contrib -y
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'
apt install pgadmin4-web -y 
sudo /usr/pgadmin4/bin/setup-web.sh
PGADMIN_SETUP_PASSWORD=!changeMe! PGADMIN_SETUP_EMAIL=email@example.com /usr/pgadmin4/bin/setup-web.sh --yes
apt install php-cli unzip
curl -sS https://getcomposer.org/installer -o /tmp/composer-setup.php
HASH=`curl -sS https://composer.github.io/installer.sig`
php -r "if (hash_file('SHA384', '/tmp/composer-setup.php') === '$HASH') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php /tmp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
wget https://get.symfony.com/cli/installer -O - | bash
curl -sS https://get.symfony.com/cli/installer | bash
curl -1sLf 'https://dl.cloudsmith.io/public/symfony/stable/setup.deb.sh' | sudo -E bash
sudo apt install symfony-cli
printf "<VirtualHost *:80>
        # The ServerName directive sets the request scheme, hostname and port that
        # the server uses to identify itself. This is used when creating
        # redirection URLs. In the context of virtual hosts, the ServerName
        # specifies what hostname must appear in the request's Host: header to
        # match this virtual host. For the default virtual host (this file) this
        # value is not decisive as it is used as a last resort host regardless.
        # However, you must set it for any further virtual host explicitly.
        #ServerName www.example.com

        ServerAdmin example@gmail.com
        ServerName sousdomaine.example.com
        DocumentRoot /home/demo/public

        DirectoryIndex index.php
        <Directory "/home/demo/public">
        Require all granted
        AllowOverride all

        FallbackResource /index.php
        </Directory>

        # Available loglevels: trace8, ..., trace1, debug, info, notice, warn,
        # error, crit, alert, emerg.
        # It is also possible to configure the loglevel for particular
        # modules, e.g.
        #LogLevel info ssl:warn

        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined

        # For most configuration files from conf-available/, which are
        # enabled or disabled at a global level, it is possible to
        # include a line for only one particular virtual host. For example the
        # following line enables the CGI configuration for this host only
        # after it has been globally disabled with "a2disconf".
        #Include conf-available/serve-cgi-bin.conf
RewriteEngine on
</VirtualHost>" > symfony.conf
snap install certbot --classic
