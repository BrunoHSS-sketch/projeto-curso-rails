FROM ruby:2.7.0

# Instalar Node.js e Yarn
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs
RUN npm install -g yarn

# Instalar dependências do sistema (como SQLite, nodejs e bibliotecas necessárias para gems nativas)
RUN apt-get update -qq && apt-get install -y \
  nodejs \
  sqlite3 \
  build-essential \
  libsqlite3-dev \
  libxml2-dev \
  libxslt1-dev \
  zlib1g-dev \
  libcurl4-openssl-dev

# Definir o diretório de trabalho
WORKDIR /myapp

# Copiar o Gemfile e o Gemfile.lock
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock

RUN gem install bundler -v 2.3.22
# Instalar as dependências do bundler
RUN bundle install

# Copiar o restante do código do projeto
COPY . /myapp

# Configurar o banco de dados e pré-compilar assets
RUN rake db:create db:migrate
RUN rake assets:precompile

# Expor a porta 3000
EXPOSE 3000

# Comando para iniciar o servidor Rails
CMD ["rails", "server", "-b", "0.0.0.0"]
