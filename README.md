A postgis image build from `mdillon/postgis` that includes US Census TIGER database setup scripts.

This creates a default database named `geodjango` for use as a geodjango backend.

## Usage
```
docker run --name docker-postgis -e POSTGRES_PASSWORD mypass -p:5432:5432 -d paulopperman/docker-postgis-tiger:0.5
docker exec --it docker-postgis ./init-db.sh
```

### References:
* [mdillon/postgis](https://github.com/appropriate/docker-postgis)
* [Open design and architecture blog - Installing Tiger Geocoder on PostGIS 2.1 on Ubuntu using a single shell script](http://opendesignarch.blogspot.com/2015/09/installing-tiger-geocoder-on-postgis-21.html)
