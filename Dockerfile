FROM python:3.10-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY login_test.py .
CMD ["pytest","--html=reports/report_docker.html"]
