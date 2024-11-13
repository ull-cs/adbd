#!/bin/bash
mongoimport --host localhost --db test --collection restaurants --file /data/restaurants.json --jsonArray
