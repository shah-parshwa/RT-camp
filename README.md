Validates the presence of a single command-line argument provided by the user.
Checks if Docker and Docker Compose are installed; if not, installs them.
Downloads the LEMP (Linux, Nginx, MySQL, PHP) and WordPress images from Docker Hub.
Automatically starts the containers for the LEMP stack and WordPress.
Sets an alias for the local host using the name specified by the user in the Command Line Interface (CLI).
Allows users to access the website by entering the assigned alias in their browser, redirecting the request to the local host.
Provides the following options to the user for managing the website:
Enable the website by turning on the container.
Disable the website by turning off the container.
Delete all containers associated with the provided setup.
Perform additional actions based on user preferences using a switch case.
