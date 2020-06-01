# acquire image of ubuntu after intstall docker
docker pull ubuntu
# creat container with mounting ~/Gallopwave 
docker run -it -v ~/Gallopwave:/Gallopwave --name mac_ubuntu ubuntu /bin/bash

# ps: docker ps -a (check all existed container)
# open container: ${container_name}
docker start ${container_name} -i 

#multiple terminals of docker container
docker exec -it ${container_name} bash

apt-get install software-properties-common

