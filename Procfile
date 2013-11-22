proxy: vendor/projects/offline/bin/setup-squid ${GOOSE}/config/proxy.port
sshd: vendor/projects/offline/bin/setup-sshd ${GOOSE}/config/sshd.port ${GOOSE}/config/authorized_keys
agent: vendor/projects/offline/bin/setup-ssh-agent ${GOOSE}/config/authorized_keys
logs: sleep 10; bin/tail-logs vendor/projects/offline//var/squid/logs/access.log
