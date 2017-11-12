# /srv/salt/dev/top.sls 
dev:
  '*':
    - prepare
  'project*dev':
    - say_something
