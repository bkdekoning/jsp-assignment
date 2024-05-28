from django.urls import path
from .views import HomePageView, AboutPageView, MyAccountPageView

urlpatterns = [
    path("", HomePageView.as_view(), name="home"),
    path("about/", AboutPageView.as_view(), name="about"),
    path("my_account/", MyAccountPageView.as_view(), name="my_account"),
]
