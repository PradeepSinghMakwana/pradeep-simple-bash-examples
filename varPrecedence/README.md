Understanding variable precedence
===============================
# Reference: https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html#variable-precedence-where-should-i-put-a-variable

Ansible does apply variable precedence, and you might have a use for it. Here is the order of precedence from least to greatest (the last listed variables override all other variables):

command line values (for example, -u my_user, these are not variables)

role defaults (defined in role/defaults/main.yml) 1

inventory file or script group vars 2

inventory group_vars/all 3

playbook group_vars/all 3

inventory group_vars/* 3

playbook group_vars/* 3

inventory file or script host vars 2

inventory host_vars/* 3

playbook host_vars/* 3

host facts / cached set_facts 4

play vars

play vars_prompt

play vars_files

role vars (defined in role/vars/main.yml)

block vars (only for tasks in block)

task vars (only for the task)

include_vars

set_facts / registered vars

role (and include_role) params

include params

extra vars (for example, -e "user=my_user")(always win precedence)

In general, Ansible gives precedence to variables that were defined more recently, more actively, and with more explicit scope.


Ansible Roles Directory Structure
===============================
# Reference: https://docs.ansible.com/ansible/latest/user_guide/playbooks_reuse_roles.html#role-directory-structure

# playbooks
site.yml
webservers.yml
fooservers.yml
roles/
    common/
        tasks/
        handlers/
        library/
        files/
        templates/
        vars/
        defaults/
        meta/
    webservers/
        tasks/
        defaults/
        meta/



Ansible Inventory Directory Structure
==============================
# Reference: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#using-multiple-inventory-sources

Aggregating inventory sources with a directory

inventory/
  openstack.yml          # configure inventory plugin to get hosts from Openstack cloud
  dynamic-inventory.py   # add additional hosts with dynamic inventory script
  static-inventory       # add static hosts and groups
  group_vars/
    all.yml              # assign variables to all hosts

# Reference: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#organizing-host-and-group-variables

/etc/ansible/group_vars/raleigh # can optionally end in '.yml', '.yaml', or '.json'
/etc/ansible/group_vars/webservers
/etc/ansible/host_vars/foosball



Use of ansible_group_priority to set variable precedence.
----------------------------------------
# Reference: https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html#how-variables-are-merged

a_group:
  vars:
    testvar: a
    ansible_group_priority: 10
b_group:
  vars:
    testvar: b

ansible_group_priority can only be set in the inventory source and not in group_vars/, as the variable is used in the loading of group_vars.

