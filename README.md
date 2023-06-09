
# RT- Camp Task list

In this task, I have created a YAML file for Docker to facilitate the downloading of images and the creation of containers for the LEMP stack. The LEMP stack includes Linux, Nginx, MySQL, and PHP. Additionally, the YAML file incorporates a WordPress image, with the site name being supplied through a Command Line Argument by the user and then user is provided with various chocies to operate the website.




## Run Locally

Clone the project

```bash
  git clone https://github.com/shah-parshwa/RT-camp.git
```

Go to the project directory

```bash
  cd my-project
```

```bash
  sudo bash Task.sh example.com(Website name can be modified as per user convenience)
```


## Task - List

- Validates the presence of a single command-line argument provided by the user.
- Checks if Docker and Docker Compose are installed; if not, installs them.
- Downloads the LEMP (Linux, Nginx, MySQL, PHP) and WordPress images from Docker Hub.
- Automatically starts the containers for the LEMP stack and WordPress.
- Sets an alias for the local host using the name specified by the user in the Command Line Interface (CLI).
- Provides user options to manage the website:
  - Enable the website by turning on the container.
  - Disable the website by turning off the container.
  - Delete all containers associated with the provided setup.
  - Additional actions can be performed based on user preferences using a switch case.
