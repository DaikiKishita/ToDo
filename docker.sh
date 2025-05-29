docker compose down --volumes
docker compose up -d  maven

#mavenでビルドする際に時間がかかるため待機
sleep 10

docker compose up -d tomcat