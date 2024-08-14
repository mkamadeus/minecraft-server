if sudo apt list --installed java-21-amazon-corretto-jdk >/dev/null 2>&1; then
  echo "Java 21 is already installed."
else
  sudo apt-get -y upgrade
  sudo apt-get -y update
  sudo apt-get -y install ca-certificates apt-transport-https gnupg wget jq
  wget -O - https://apt.corretto.aws/corretto.key | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/corretto-keyring.gpg && echo "deb [signed-by=/usr/share/keyrings/corretto-keyring.gpg] https://apt.corretto.aws stable main" | sudo tee /etc/apt/sources.list.d/corretto.list
  sudo apt-get -y update
fi

sudo apt-get install -y java-21-amazon-corretto-jdk libxi6 libxtst6 libxrender1
