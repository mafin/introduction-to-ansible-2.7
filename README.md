
```
ansible -i hosts-dev --list-hosts all
ansible --list-hosts loadbalancers
ansible -m shell -a "uname -srm" webservers:loadbalancers
ansible -m service -a "name=apache2 state=stopped" --become loadbalancers
ansible -m setup app1
ansible-galaxy role init roles/webservers
ansible-playbook setup-app.yml --check
ansible-playbook playbooks/setup-app.yml --tags upload
ansible-playbook playbooks/setup-app.yml --skip-tags upload
```

Load balance manager: http://18.203.187.1/balancer-manager
