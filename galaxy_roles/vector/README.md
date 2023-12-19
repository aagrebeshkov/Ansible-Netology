Ansible-Role Vector

'vector_version' -subj


## example playbook:
```
- name: install vector
  hosts:
    - example_host
  become: true
  roles:
    - role: vector``` 