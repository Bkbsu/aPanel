FROM aapanel/aapanel:lib

# Expose necessary ports
EXPOSE 8888 21 443 80 888

# Set the working directory
WORKDIR /www

# Copy necessary files into the container
COPY ./website_data /www/wwwroot
COPY ./mysql_data /www/server/data
COPY ./vhost /www/server/panel/vhost

# Copy the install script
COPY ./install.sh /www/install.sh

# Make the script executable
RUN chmod +x /www/install.sh

# CMD to run the install.sh script
CMD ["/www/install.sh"]
