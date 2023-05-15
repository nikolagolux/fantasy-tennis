# Specify DockerHub image with specific Ruby version
FROM ruby:3.0

# Install the required and additional packages
RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    libpq-dev \
    postgresql-client \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add Node.js to sources list
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash -
# Install Node.js version that will enable installation of yarn
RUN apt-get install -y --no-install-recommends \
    nodejs \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Yarn - this is needed for webpacker.
RUN npm install -g yarn

# RUN mkdir /app
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile /app/Gemfile 
COPY Gemfile.lock /app/Gemfile.lock

# Run bundle install
RUN bundle install

# Copy everything in current directory to the WORKDIR
COPY . /app

RUN rails webpacker:install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod u+x /usr/bin/entrypoint.sh
ENTRYPOINT ["/usr/bin/entrypoint.sh"]

# Expose port 3000 to allow us to access the site in our broser with localhost:3000
EXPOSE 3000

# Start rails server
CMD ["rails", "s", "-b", "0.0.0.0"]