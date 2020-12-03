docker build \
    --build-arg HTTPS_PROXY=http://$USER:$(/usr/bin/pass hagl\proxy | sed -n 1p)@proxy1.hella.com:3128 \
    -t favourites-node .

docker run \
    --name favourites \
    -d \
    --rm \
    --network favorites-net \
    --env HTTPS_PROXY="http://$USER:$(/usr/bin/pass hagl\proxy | sed -n 1p)@proxy1.hella.com:3128" \
    -p 3000:3000  \
    favourites-node


docker run \
    -d \
    --name mongodb \
    --network favorites-net \
    docker-remote.artifactory.ham.hella.com/mongo


When sending a query of 
{
    "name": "A New Hope",
    "type": "character",
    "url": "google.com"
}
to localhost:3000/favorites, make sure to use the header Content-Type: application/json