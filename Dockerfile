FROM alpine:3.18

################################################################################
# Install Dependencies
################################################################################

RUN apk add --no-cache bash curl g++

################################################################################
# Install PHP 8.2
################################################################################

RUN apk add --no-cache                                                         \
    $(                                                                         \
        apk search -qe --no-cache 'php82*'                                     \
            | sed -e 's/[^ ]*dev[^ ]*//ig'                                     \
            | sed -e 's/[^ ]*xdebug[^ ]*//ig'                                  \
            | sed -e 's/[^ ]*couchbase[^ ]*//ig'                               \
            | sed -e 's/[^ ]*pecl-psr[^ ]*//ig'                                \
            | cat                                                              \
    )

################################################################################
# Setup the Application
################################################################################

WORKDIR /var/www/html

EXPOSE 8000

################################################################################
# Start Web Server
################################################################################

ENTRYPOINT [ "php82", "artisan", "octane:start", "--server=swoole", "--host=0.0.0.0" ]
