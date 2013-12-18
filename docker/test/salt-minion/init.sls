{%- set path = 'path/to/dockerfile' %}

image:
  docker:
    - built
    - name: salt/saltminion
    - path: {{ path }}

container:
  docker:
    - installed
    - name: saltminion
    - image: salt/saltminion
    - require:
      - docker: image

run:
  docker:
    - running
    - name: saltminion
    - container: saltminion
    - publish_all_ports: True
    - links:
      salt/saltmaster: salt_master
    - require:
      - docker: container
