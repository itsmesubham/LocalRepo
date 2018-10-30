images=$1
localaddr="192.168.0.109:5000/$images"
sudo docker pull $localaddr 

x="$(sudo docker images $localaddr 2> /dev/null | wc -l)"
if [ $x -eq 1 ]; then
  echo "Not Present"
  sudo docker pull $images
  sudo docker tag $images $localaddr
  sudo docker push $localaddr
fi
echo "$x";