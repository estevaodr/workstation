tags = $(subst roles/,,$(wildcard roles/*))
.PHONY: all $(tags)

all:
	ansible-playbook -i "localhost" -c local main.yml --ask-become-pass

requirements:
	ansible-galaxy install -r requirements.yml

$(tags):
	ansible-playbook -i "localhost" -c local -t $@  main.yml --ask-become-pass