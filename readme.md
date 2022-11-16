# DevOption Ignite

DevOption Ignite is a production ready Docker image for Laravel applications. Since the image uses PHP Swoole and Laravel Octane, it is a perfect fit for Laravel applications that need to handle a lot of concurrent requests.

## Usage

- Install `laravel/octane` in your Laravel application.

```bash
composer require laravel/octane
```

- Create a new `Dockerfile` in your Laravel project root directory.

```dockerfile
FROM devoption/ignite:latest

# Copy the application files
COPY . /var/www/html

# Change the permissions of the storage and bootstrap directories
RUN chmod -R 777 /var/www/html/storage
RUN chmod -R 777 /var/www/html/bootstrap/cache
```

- Build the image

```bash
docker build -t application-name .
```

> Note: Replace `application-name` with the name of your application.

- Run the container

```bash
docker run -d -p 80:8000 application-name
```

> Note: Replace `application-name` with the name of your application.
