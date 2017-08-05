import pytest

from events import views

@pytest.mark.django_db
def test_event_list(client):
    response = client.get('/about/')
    assert response.status_code == 200

@pytest.mark.django_db
def test_event_list(client):
    response = client.get('/')
    assert response.status_code == 200

@pytest.mark.django_db
def test_event_list(client):
    response = client.get('/events/')
    assert response.status_code == 200
