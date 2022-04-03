docker run -d --name elasticsearch --net elastic-search-network -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -it elasticsearch:8.1.2
