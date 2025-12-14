# Use the official MongoDB image
FROM mongo:latest

# Set the working directory
WORKDIR /data

# Copy the restaurants.json file into the container
COPY restaurants.json /data/restaurants.json

# Create an initialization script to import the JSON file
COPY init-mongo.sh /docker-entrypoint-initdb.d/init-mongo.sh

# Ensure the script has execution permissions
RUN chmod +x /docker-entrypoint-initdb.d/init-mongo.sh

# Expose MongoDB port
EXPOSE 27017