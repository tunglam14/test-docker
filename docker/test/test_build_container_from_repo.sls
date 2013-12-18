{%- set path = 'path/to/Dockerfile' %}
{%- set image = 'lamdt/salt-master-ssh' %}
{%- set container = 'saltmaster' %}

image:
  docker:
    - pulled
    - name: {{ image }}

container:
  docker:
    - installed
    - name: {{ container }}
    - image: {{ image }}
    - command: /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
    - ports:
        - 22
        - 4505
        - 4506
    - require:
      - docker: image

run-container:
  docker:
    - running
    - container: {{ container }}
    - publish_all_ports: True
    - require:
      - docker: container
