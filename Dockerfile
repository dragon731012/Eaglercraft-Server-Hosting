# Use an official base image with Java
FROM openjdk:11-jre-slim


# Copy everything from the current directory to /app in the container
COPY . .

# Make sure main.sh is executable
RUN chmod +x main.sh

# Command to run the main.sh script
CMD ["./main.sh"]
