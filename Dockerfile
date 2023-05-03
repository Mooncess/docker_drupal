# Используем образ Drupal как базовый образ
FROM drupal:latest

# Устанавливаем зависимости Drupal и другие необходимые пакеты
RUN apt-get update && apt-get install -y \
    git \
    unzip \ 
    curl \
    vim \
    mariadb-client \ 
    && rm -rf /var/lib/apt/lists/*

# Копируем нашу конфигурацию внутрь контейнера
COPY ./config/drupal.conf /etc/apache2/sites-available/

# Активируем нашу конфигурацию
RUN a2ensite drupal.conf

# Открываем порты 80 и 443
EXPOSE 80
EXPOSE 443
