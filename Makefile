install:
	#install commands
	pip install --upgrade pip &&\
	 pip install -r requirements.txt 
	python -m textblob.download_corpora
format: 
	#format code
	black *.py mylib/
lint:
	#flake8 or #pylint
	pylint --disable=R,C *.py mylib/*.py
test:
	python -m pytest -vv --cov=mylib --cov==main test_logic.py test_main.py
build:
	#build container
	docker build -t deploy-fastapi .
run:
	#run docker
	#docker run -p 127.0.0.1:8080:8080 2680c72d4921
deploy:
	#deploy
all: install lint test deploy