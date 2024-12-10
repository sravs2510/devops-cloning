#!/bin/bash
# System Update and Upgrade
apt update
apt upgrade –y 
# Install OpenSearch
apt -y install curl lsb-release gnupg2 ca-certificates 
curl -fsSL https://artifacts.opensearch.org/publickeys/opensearch.pgp|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/opensearch.gpg 
echo "deb https://artifacts.opensearch.org/releases/bundle/opensearch/2.x/apt stable main" | sudo tee /etc/apt/sources.list.d/opensearch-2.x.list 
apt update 
apt list -a opensearch
# Version 2.11.1
apt install opensearch=2.11.1
echo "cluster.name: opensearch" >> /etc/opensearch/opensearch.yml 
echo "network.host: 0.0.0.0" >> /etc/opensearch/opensearch.yml 
echo "http.port: 9200" >> /etc/opensearch/opensearch.yml 
# Disable https
sudo sed -i "s/plugins.security.ssl.http.enabled: true/plugins.security.ssl.http.enabled: false/g" /etc/opensearch/opensearch.yml   
echo "node.name: ${HOSTNAME}" >> /etc/opensearch/opensearch.yml 
echo "discovery.type: single-node" >> /etc/opensearch/opensearch.yml 
systemctl restart opensearch
systemctl enable --now opensearch 
systemctl status opensearch

# Install OpenSearch Dashboards
echo "deb https://artifacts.opensearch.org/releases/bundle/opensearch-dashboards/2.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/opensearch-2.x.list 
apt update 
apt list -a opensearch-dashboards
apt install opensearch-dashboards=2.11.1 
echo "server.host: 0.0.0.0" >> /etc/opensearch-dashboards/opensearch_dashboards.yml
# opensearch.hosts: [https://localhost:9200]  --> opensearch.hosts: [http://localhost:9200] 
sed -i "s/https/http/g" /etc/opensearch-dashboards/opensearch_dashboards.yml
systemctl enable opensearch-dashboards 
systemctl restart opensearch-dashboards