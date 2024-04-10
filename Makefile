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
	docker build -t deploy-fastapi .
run: 
	#Run Docker
	docker run -p 127.0.0.1:8080:8080 35cb21f47e7b
deploy:
	# Deploy
all: install lint test deploy