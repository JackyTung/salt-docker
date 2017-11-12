prepare_log_folder:
  file.directory:
    - name: /app-log
    - makedirs: True
    - dir_mode: 777

prepare_service_file:
  file.managed:
    - name: /app-log/{{ salt['pillar.get']('static:file_name', "") }} 
    - contents: {{ salt['pillar.get']('static:content', "") }}
    - require:
      - file: prepare_log_folder

{% for service in ['consul', 'docker']%}

prepare_{{ service }}_logfiles:
  file.managed:
    - name: /app-log/{{ service }}.log
    - contents: |
        This is demo example for service log
        Service = {{ service }}
    - require:
      - file: prepare_log_folder

{% endfor %}
