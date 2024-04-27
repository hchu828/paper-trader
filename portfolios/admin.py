from django.contrib import admin

from .models import Portfolio, Stock, PortfolioStock, Transaction, UserProfile

admin.site.register(Portfolio)
admin.site.register(Stock)
admin.site.register(PortfolioStock)
admin.site.register(Transaction)
admin.site.register(UserProfile)
