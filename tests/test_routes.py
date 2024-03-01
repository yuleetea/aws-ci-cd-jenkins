# tests/test_routes.py

from app import app

# Example test case
def test_index():
    client = app.test_client()
    response = client.get('/')
#    assert response.status_code == 200
#    assert 'Hello, World!' in response.data
    print("Hello :)")
    print(response.data)
