echo "remove all containers "
docker rm -f $(docker ps -qa)

echo "remove all images "
docker rmi $(docker images -qa)

echo "remove all volumes"
docker volume rm $(docker volume ls -q)


