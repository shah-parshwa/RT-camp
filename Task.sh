#!/bin/bash
clear
if [ $# -ne 1 ]; then
    echo "Error: Argument not provided please provide exactly 1 arguement."
    exit 1
fi

if [ -x "$(command -v docker)" ]; then
    echo "Docker is installed."
else
    echo -e "Docker is not installed and installing it \n\n" 
    sudo apt-get update
    sudo apt-get -y install ca-certificates curl gnupg
    sudo install -y -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    echo -e "\n\n\nInstallation complete \n"
fi

if [ -x "$(command -v docker-compose)" ]; then
    echo -e  "Docker-Compose is installed."
else
    echo -e "Docker-Compose is not installed and installing it \n\n" 
    sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    echo -e "\n\n\nIn"
fi
    
sudo docker-compose -f docker-compose.yml -p $1 up -d

sudo bash -c "echo '127.0.0.0 $1' >> /etc/hosts"


while true; do
    # Display menu options
    echo "Menu:"
    echo "1. Start containers"
    echo "2. Stop containers"
    echo "3. Remove containers"
    echo "4. Redirect to Website"
    echo "5. Quit"


    read -p "Enter your choice: " choice

    case $choice in
        1)
            echo "Starting containers..."
            sudo docker start $(sudo docker ps -a -q)
            ;;
        2)
            echo "Stopping containers..."
            sudo docker stop $(sudo docker ps -a -q)
            ;;
        3)
            echo "Removing containers..."
            sudo docker rm -f $(sudo docker ps -a -q)
            break
           ;;
        4) 
            sudo -u $(whoami) xdg-open "http://$1" > /dev/null 2>&1
            ;;
        5)
            echo "Quitting..."
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done
