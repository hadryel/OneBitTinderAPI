FROM ruby:2.5.3
 
# add nodejs and yarn dependencies for the frontend
# RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
# curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
# echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
 
# Instala nossas dependencias
# RUN apt-get update && apt-get install -qq -y --no-install-recommends \
# nodejs yarn build-essential libpq-dev imagemagick git-all nano
# RUN apt-get update && apt-get install -qq -y gcc
RUN apt-get update

# RUN apt-get install -qq -y make

# RUN apt-get install -qq -y proj-bin

# RUN apt-get install -qq -y libgeos-dev

# RUN apt-get install -qq -y libxml2

# RUN apt-get install -qq -y libjson-c-dev

# RUN apt-get install -qq -y gdal-bin

# RUN apt-get install -qq -y postgis
 
# Seta nosso path
ENV INSTALL_PATH /onebittinder
 
# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH
 
# Seta o nosso path como o diretório principal
WORKDIR $INSTALL_PATH
 
# Seta o path para as Gems
ENV BUNDLE_PATH /gems
 
# Copia nosso código para dentro do container
COPY . .
