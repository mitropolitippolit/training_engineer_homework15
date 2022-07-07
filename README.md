# Training engineer

# Homework 15 - Prometheus and Grafana

### Instructions

Настроить мониторинг для выбранного приложения.

### prometheus.yml excerpt

    - job_name: 'tomcat'
    metrics_path: /
    scheme: http
    static_configs:
      - targets: ['localhost:8081']
        labels:
          instance: 'tomcat'

### Screenshot

![img01.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img01.png)
![img02.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img02.png)
![img03.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img03.png)
![img04.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img04.png)
![img05.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img05.png)
![img06.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img06.png)
![img07.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img07.png)
![img08.png](https://raw.githubusercontent.com/mitropolitippolit/training_engineer_homework15/master/img/img08.png)
