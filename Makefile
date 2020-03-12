export ANSIBLE_NOCOWS=1

.PHONY: dummy
dummy:
	@

.PHONY: tennisl1
tennisl1:
	ansible-playbook -i hosts.ini tennisl1.yml --limit tennisl1 --ask-become-pass
