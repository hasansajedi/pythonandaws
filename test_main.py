from fastapi.testclient import TestClient
from main import app

client = TestClient(app)


def test_read_main():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Welcome to wikipedia API. /search or /wiki"}


def test_read_phrase():
    response = client.get("/phrase/NBA")
    assert response.status_code == 200
    assert "broadcasting" in response.json()["result"]
