from django.urls import re_path

from .consumers import ChatConsumer

websocket_urlpaterns = [
    re_path('uws/', ChatConsumer.as_asgi()),
]