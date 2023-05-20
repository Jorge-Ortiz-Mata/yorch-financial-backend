FROM ruby:3.0.4 as production

USER root

# We'll install curl for later dependency package installation steps
RUN apt-get update \
 && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    git \
    sudo \
    libpq5 \
    openssl

WORKDIR /workspaces/yorch-financial-backend

COPY . .

RUN bundle install

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true
ENV RAILS_LOG_TO_STDOUT true
ENV SECRET_KEY_BASE=dummy_secret_key
# Test if the rails app loads:
RUN rails db:migrate

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
