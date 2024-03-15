import pytest
from flask.testing import FlaskClient
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client

def test_index(client: FlaskClient):
    response = client.get('/')
    assert response.status_code == 200
    assert b'<form action="/submit" method="post">' in response.data

def test_submit(client: FlaskClient):
    response = client.post('/submit', data={'name': 'Test Name'})
    assert response.status_code == 200
    assert b'Thank you for submitting the form' in response.data
