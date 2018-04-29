FROM php:7.1.2-apache
RUN docker-php-ext-install mysqli



RUN curl -sL https://deb.nodesource.com/setup_9.x | bash \
  && apt-get update \
  && apt-get install -y --no-install-recommends \
  git \
  libc-client-dev \
  libicu-dev \
  libkrb5-dev \
  libmagickwand-dev \
  libmcrypt-dev \
  libpng-dev \
  libxml2-dev \
  msmtp-mta \
  mysql-client \
  nodejs \
  sudo \
  unzip \
  zip \
  zlib1g-dev \
  wget
#  && rm -r /var/lib/apt/lists/*


RUN docker-php-ext-install bcmath \
  && docker-php-ext-install gd \
  && docker-php-ext-install gettext \
  && docker-php-ext-configure imap --with-kerberos --with-imap-ssl \
  && docker-php-ext-install imap \
  && docker-php-ext-install intl \
  && docker-php-ext-install mcrypt \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install soap \
  && docker-php-ext-install zip


# Get the geckodriver
RUN mkdir ~/libraries
RUN wget  https://github.com/mozilla/geckodriver/releases/download/v0.20.0/geckodriver-v0.20.0-linux64.tar.gz && tar -zxvf geckodriver-v0.20.0-linux64.tar.gz && mv geckodriver ~/libraries &&  rm geckodriver-v0.20.0-linux64.tar.gz

# Get the selenium
RUN wget -O ~/libraries/selenium.jar https://goo.gl/UzaKCo


COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
