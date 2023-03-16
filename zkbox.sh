#root
adduser ed
sudo cp -r /root/.ssh /home/ed/.ssh
sudo chown -R ed:ed /home/ed/.ssh

apt update
apt upgrade
# install docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce
sudo usermod -aG docker ed
# install docker-compose
sudo apt install docker-compose
#mkdir -p ~/.docker/cli-plugins/
#curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose
#chmod +x ~/.docker/cli-plugins/docker-compose
#docker compose version
# install nodejs
curl -sL https://deb.nodesource.com/setup_18.x -o nodesource_setup.sh
bash nodesource_setup.sh 
apt install nodejs
corepack enable
npm i -g corepack
corepack prepare yarn@stable --activate
yarn set version stable

su - ed
git clone git@github.com:matter-labs/local-setup.git
