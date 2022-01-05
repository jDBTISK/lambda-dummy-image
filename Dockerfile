FROM public.ecr.aws/lambda/python:3.9

COPY src/main.py /var/task/main.py

CMD [ "main.lambda_handler" ]
