from django.shortcuts import render


def index(request):
    return render(request, "Hello, world. You're at the portfolios index.")
