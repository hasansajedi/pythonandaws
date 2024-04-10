install:
	# Install commands
	pip install --upgrade pip &&\
	pip install -r requirements.txt
format:
	# Format code
	black  *.py mylib/*.py
lint:
	# flake8 or pylint
	pylint --disable=R,C *.py mylib/*.py
test:
	#Test
	python -m pytest -vv --cov=mylib --cov=main test_*.py
build: 
	#Build container
	docker build -t fastapi-app .
run: 
	#Run Docker
	docker run -p 127.0.0.1:8080:8080 35cb21f47e7b
deploy:
	# Deploy
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 569986840293.dkr.ecr.us-east-1.amazonaws.com
	docker build -t fastapi-app .
	docker tag fastapi-app:latest 569986840293.dkr.ecr.us-east-1.amazonaws.com/fastapi-app:latest
	docker push 569986840293.dkr.ecr.us-east-1.amazonaws.com/fastapi-app:latest
all: install lint test deploy