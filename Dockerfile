FROM apache/airflow:slim-latest-python3.12

RUN apt-get update && apt-get install -y procps less && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /tmp/
USER airflow
WORKDIR  /home/airflow
COPY src /home/airflow

RUN pip install -r /tmp/requirements.txt

CMD ["/bin/bash", "/home/airflow/src/python/test-case.py"]
