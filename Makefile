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
	# test
build: 
	#Build container
deploy:
	# Deploy
all: install lint test deploy