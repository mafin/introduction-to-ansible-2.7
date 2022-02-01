
```
ansible -i hosts-dev --list-hosts all
ansible --list-hosts loadbalancers
ansible -m shell -a "uname -srm" webservers:loadbalancers
```

Load balance manager: http://18.203.187.1/balancer-manager
