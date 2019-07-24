FROM ruby:2.5.3

RUN apt-get update

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