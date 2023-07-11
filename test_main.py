
from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message":"Wikipedia API. Call/search or /Wiki"}


def test_read_phrase():
    response = client.get("/phrases/Barack%20Obama")
    assert response.status_code == 200
    assert response.json() == {"results": [
        "barack hussein obama ii",
        "bə-rahk hoo-sayn oh-bah-mə",
        "august",
        "american politician",
        "44th president"
        ]
    }

def test_read_wiki():
    response = client.get("/wiki/Barack%20Obama")
    assert response.status_code == 200
    assert response.json() == {"results": "Barack Hussein Obama II ( (listen) bə-RAHK hoo-SAYN oh-BAH-mə; born August 4, 1961) is an American politician who served as the 44th president of the United States from 2009 to 2017."}