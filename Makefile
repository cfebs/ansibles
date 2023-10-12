export ANSIBLE_NOCOWS=1

hostname:=$(shell hostname || hostnamectl hostname)

.PHONY: dummy
dummy:
	@

.PHONY: this
this:
	@echo Running playbook for $(hostname)
	ansible-playbook -v -i hosts.ini $(hostname).yml --limit $(hostname) --ask-become-pass

.PHONY: this-no-become
this-no-become:
	@echo Running playbook for $(hostname)
	strace -fttTyyy -s 1024 -o/tmp/ansible_strace.txt ansible-playbook -v -i hosts.ini $(hostname).yml --limit $(hostname)
	#ansible-playbook -v -i hosts.ini $(hostname).yml --limit $(hostname)

.PHONY: this-debug
this-debug:
	@echo Running playbook for $(hostname) with debug tag
	ansible-playbook -i hosts.ini $(hostname).yml --limit $(hostname) --tags debug --ask-become-pass

.PHONY: this-dry
this-dry:
	@echo Running playbook for $(hostname) with check and diff tag
	ansible-playbook -i hosts.ini $(hostname).yml --check --diff --limit $(hostname) --ask-become-pass

.PHONY: tennisl1
tennisl1:
	ansible-playbook -i hosts.ini tennisl1.yml --limit tennisl1 --ask-become-pass

.PHONY: tennisd2
tennisd2:
	ansible-playbook -i hosts.ini tennisd2.yml --limit tennisd2 --ask-become-pass

.PHONY: tennislhua
tennislhua:
	ansible-playbook -i hosts.ini tennislhua.yml --limit tennislhua --ask-become-pass

.PHONY: tennispi1
tennispi1:
	ansible-playbook -i hosts.ini tennispi1.yml --limit tennispi1 --ask-become-pass

.PHONY: tennislframe
tennislframe:
	ansible-playbook -i hosts.ini tennislframe.yml --limit tennislframe --ask-become-pass

.PHONY: debug-facts
debug-facts:
	sudo strace -fvttTyy -s 256 -o /tmp/ansible_facts_strace.txt time ansible-playbook -i hosts.ini facts.yaml
