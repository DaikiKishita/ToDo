docker compose down --volumes

sleep 10

docker compose up -d --rm  maven

sleep 10

docker compose up -d tomcat
