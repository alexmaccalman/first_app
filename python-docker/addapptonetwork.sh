docker run \
  --rm -d \
  --network mysqlnet \
  --name rest-server \
  -p 8000:5000 \
  python-docker-dev