install:
	#install commands
	pip install --upgrade pip &&\
	 pip install -r requirements.txt
	python -m textblob.download_corpora
post-install:
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
	aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 478409464809.dkr.ecr.us-west-2.amazonaws.com
	docker build -t fastapi-wiki .
	docker tag fastapi-wiki:latest 478409464809.dkr.ecr.us-west-2.amazonaws.com/fastapi-wiki:latest
	docker push 478409464809.dkr.ecr.us-west-2.amazonaws.com/fastapi-wiki:latest
all: install post-install lint test deploy