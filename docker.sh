docker compose down --volumes
docker compose up -d  maven --build

#mavenでビルドする際に時間がかかるため待機
sleep 15

docker compose up -d tomcat