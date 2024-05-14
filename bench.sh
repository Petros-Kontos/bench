#!/bin/bash

docker compose up --build -d

echo 'Waiting for servers to initialize...'
sleep 5

ab -n 100000 -c 100 http://localhost:3000/ 2>&1 | tee ./results/express.txt
ab -n 100000 -c 100 http://localhost:3001/ 2>&1 | tee ./results/go.txt

docker compose down --rmi all