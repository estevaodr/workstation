tags = $(subst roles/,,$(wildcard roles/*))
.PHONY: all $(tags)

all:
	@ansible-galaxy install -r requirements.yml
	@ansible-playbook -i "localhost" -c local main.yml --ask-become-pass

verbose:
	@ansible-playbook -vvv -i "localhost" -c local main.yml --ask-become-pass

requirements:
	ansible-galaxy install -r requirements.yml

$(tags):
	ansible-playbook -i "localhost" -c local -t $@ -vvv  main.yml --ask-become-pass