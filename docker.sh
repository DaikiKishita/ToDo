
docker compose down --volumes

sleep 10

docker compose up -d maven

sleep 10

docker compoe up -d tomcat
