# makefile

tf-apply:
	terraform -chdir=./tf/ apply

tf-destroy:
	terraform -chdir=./tf/ destroy

install:
	ansible-playbook playbooks/all-playbooks.yml

