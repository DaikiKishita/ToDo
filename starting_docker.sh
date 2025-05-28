docker compose down --volumes
sleep 10
docker compose up -d maven
sleep 15 
docker compose up -d tomcat
