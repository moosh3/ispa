docker-compose run --rm web ./bin/test.sh

if [ $? -ne 0 ]; then
    echo "Tests did not pass! Fix it."
    exit 1
fi
