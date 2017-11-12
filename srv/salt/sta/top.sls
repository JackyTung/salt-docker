# /srv/salt/sta/top.sls 
sta:
  '*':
    - prepare
  'project*sta':
    - say_something
