docker build \
    --build-arg HTTPS_PROXY=http://$USER:$(/usr/bin/pass hagl\proxy | sed -n 1p)@proxy1.hella.com:3128 \
    -t favourites-node .


docker run \
    --name favourites \
    -d \
    --rm \
    -p 4000:4000  \
    favourites-node
