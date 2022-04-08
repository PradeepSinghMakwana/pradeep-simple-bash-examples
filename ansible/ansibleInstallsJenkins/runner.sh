#!/bin/bash
ansible-playbook playbook.yml --user=root --ask-become-pass -e ansible_python_interpreter=/usr/bin/python
