if docker-machine active >/dev/null 2>&1; then
    eval $(docker-machine env)
fi
