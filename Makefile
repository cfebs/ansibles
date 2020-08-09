export ANSIBLE_NOCOWS=1

.PHONY: dummy
dummy:
	@

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
