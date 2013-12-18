{%- set path = 'path/to/Dockerfile' %}

image:
  docker:
    - built
    - name: salt/saltmaster
    - path: {{ path }}

container:
  docker:
    - installed
    - name: saltmaster
    - image: salt/saltmaster
    - require:
      - docker: image

run:
  docker:
    - running
    - name: saltmaster
    - container: saltmaster
    - publish_all_ports: True
    - require:
      - docker: container
