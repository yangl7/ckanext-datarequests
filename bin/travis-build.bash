#!/bin/bash
set -e

echo "This is travis-build.bash..."

echo "Installing the packages that CKAN requires..."
# sudo apt-get update -qq
# sudo apt-get install solr-jetty
#sudo yum update -y
#sudo yum install solr-jetty

echo "Installing CKAN and its Python dependencies..."
#git clone https://github.com/ckan/ckan
cd ~/Projects/ckan/2.8.1/src
#git checkout ckan-$CKANVERSION
echo "-----------------------------------------------------------------------"
~/.pyenv/shims/pip install -r requirement-setuptools.txt
#python setup.py develop
~/.pyenv/shims/pip install -r requirements.txt #--allow-all-external
~/.pyenv/shims/pip install -r dev-requirements.txt #--allow-all-external
~/.pyenv/shims/pip install .
cd -

echo "Setting up Solr..."
# solr is multicore for tests on ckan master now, but it's easier to run tests
# on Travis single-core still.
# see https://github.com/ckan/ckan/issues/2972
#sed -i -e 's/solr_url.*/solr_url = http:\/\/127.0.0.1:8983\/solr/' ckan/test-core.ini
#printf "NO_START=0\nJETTY_HOST=127.0.0.1\nJETTY_PORT=8983\nJAVA_HOME=$JAVA_HOME" | sudo tee /etc/default/jetty
#sudo cp ckan/ckan/config/solr/schema.xml /etc/solr/conf/schema.xml
#sudo service jetty restart

echo "Creating the PostgreSQL user and database..."
#docker exec -it ckan_postgres psql -U ckan -c "DROP ROLE IF EXISTS ckan_default; CREATE USER ckan_default WITH PASSWORD 'pass';"
#docker exec -it ckan_postgres psql -U ckan -c "DROP ROLE IF EXISTS datastore_default; CREATE USER datastore_default WITH PASSWORD 'pass';"
#docker exec -it ckan_postgres psql -U ckan -c "CREATE DATABASE ckan_test WITH OWNER ckan_default;"
#docker exec -it ckan_postgres psql -U ckan -c "CREATE DATABASE datastore_test WITH OWNER ckan_default;"

echo "Initialising the database..."
#cd ckan
#paster db init -c /var/lib/jenkins/Projects/ckan/2.8.1/src/test-core.ini
cd -

echo "Installing ckanext-datarequests and its requirements..."
#sudo python setup.py develop

echo "travis-build.bash is done."
