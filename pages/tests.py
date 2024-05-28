from django.test import Client
from django.urls import reverse

import pytest


@pytest.fixture
def client():
    return Client()


@pytest.mark.django_db(transaction=True)
def test_homepage_content(client):
    url = reverse("home")
    response = client.get(url)
    assert response.status_code == 200
    assert (
        '<h1 class="text-light">Unlock Your Dream Job!</h1>'
        in response.content.decode()
    )
    assert "Welcome!" in response.content.decode()


@pytest.mark.django_db(transaction=True)
def test_about_page_content(client):
    url = reverse("about")
    pass  # Your test goes here. The URL defined above is the correct one for calling the About page.
