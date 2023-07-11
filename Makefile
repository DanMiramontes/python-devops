install:
	#install commands
	pip install --upgrade pip &&\
	 pip install -r requirements.txt
format: 
	#format code
	black *.py mylib/
lint:
	#flake8 or #pylint
test:
	python -m pytest -vv --cov=mylib test_logic.py
build:
	#build container
deploy:
	#deploy
all: install lint test deploy