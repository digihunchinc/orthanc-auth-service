FROM python:3.10

ENV PYTHONUNBUFFERED=1

COPY requirements.txt /
RUN pip install -r requirements.txt

RUN mkdir /orthanc_share
COPY sources/orthanc_share /orthanc_share

WORKDIR /orthanc_share
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port" , "8000"]

