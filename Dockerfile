# Use official PHP with Apache
FROM php:8.2-apache

# Install useful PHP extensions (optional but common)
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache rewrite (good practice even if not used)
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy all project files
COPY . /var/www/html/

# Give proper permissions
RUN chown -R www-data:www-data /var/www/html \
    && chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
