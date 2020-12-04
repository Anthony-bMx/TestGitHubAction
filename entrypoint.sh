#!/bin/sh -l

echo "Hello $1"
time=$(date)
wget https://jsonplaceholder.typicode.com/todos/1 -O downloadedfile.json 
echo "::set-output name=time::$time"
