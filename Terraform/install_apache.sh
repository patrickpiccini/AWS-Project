#! /bin/bash
sudo apt-get update -y
sudo apt install python3-pip -y

cd /
sudo mkdir app
cd app/

sudo git config --global user.name "HML_Server"
sudo git config --global user.email patrickbpiccini@hotmail.com
sudo git clone https://github.com/patrickpiccini/dev-icons.git

cd dev-icons/
pip install -r requirements.txt

python3 app.py >> log.txt

# flask run --host=0.0.0.0 --port=8080

