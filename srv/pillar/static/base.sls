static:
  {% if salt['grains.get']('component', '') == 'mgr' %}
  file_name: mgr.txt
  {% elif salt['grains.get']('component','') == 'worker' %}
  file_name: worker.txt
  {% endif %}


