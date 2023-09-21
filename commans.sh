docker volume create postgres_vol_1
docker volume create postgres_vol_2
docker volume create postgres_vol_2

docker network create app_net

docker run --rm -d \
    --name postrges_1 \
    -e POSTGRES_PASSWORD=postgres \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_DB=test_data\
    -v postgres_vol_1:/var/lib/postgresql/data \
	--net=app_net \
    postgres:14


docker run -d --rm --net=app_net -p 8080:8088 --name superset apache/superset