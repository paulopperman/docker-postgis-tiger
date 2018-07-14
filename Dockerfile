FROM mdillon/postgis

# set required environment variables, including states to get
ENV PGUSER=postgres
ENV geostates="'"RI"'"
ENV PGBIN=usr/bin

# install additional dependencies for tiger data
RUN apt-get update
RUN apt-get install -y --no-install-recommends wget unzip zip ca-certificates


# create data folder
RUN mkdir gisdata; mkdir /gisdata/temp; chmod -R 777 /gisdata

# copy files and init database
COPY tiger_loader_platform.sql .
COPY init-db.sh .
RUN chmod +x init-db.sh
COPY docker-entrypoint-script.sh .
COPY wait-for-postgres.sh .
# COPY init-db.sh /docker-entrypoint-initdb.d/q1-add-tiger.sh
RUN chmod +x docker-entrypoint-script.sh

# ENTRYPOINT ["bash", "/docker-entrypoint-script.sh"]


#RUN bash init-db.sh
#
##RUN psql -f tiger_loader_platform.sql
#

#

##
### restart postgres
##RUN service postgres restart
#
## generate and run the nation script
#RUN psql -c "SELECT loader_generate_nation_script('stretch') AS aaaaa" -t -x -A -F "" -q -o 02a_load_nation_tiger.sh
#RUN sed -i 's/aaaaa//g' 02a_load_nation_tiger.sh; chmod a+x ./02a_load_nation_tiger.sh
