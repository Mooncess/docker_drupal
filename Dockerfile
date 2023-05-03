FROM drupal:latest

RUN apt-get update && apt-get install -y \
    git \
    unzip \ 
    curl \
    vim \
    mariadb-client \ 
    && rm -rf /var/lib/apt/lists/*

COPY ./config/drupal.conf /etc/apache2/sites-available/

RUN a2ensite drupal.conf
