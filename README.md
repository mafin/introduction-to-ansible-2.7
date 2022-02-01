
```
ansible -i hosts-dev --list-hosts all
ansible --list-hosts loadbalancers
ansible -m shell -a "uname -srm" webservers:loadbalancers
```
