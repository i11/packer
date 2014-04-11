#!/bin/bash -e

# Fetch rabbitmqadmin
curl -k http://localhost:15672/cli/rabbitmqadmin > /usr/local/bin/rabbitmqadmin
# Make it executable
chmod +x /usr/local/bin/rabbitmqadmin
