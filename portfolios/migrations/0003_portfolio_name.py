# Generated by Django 4.2.11 on 2024-04-21 23:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('portfolios', '0002_transaction_type_alter_portfoliostock_quantity_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='portfolio',
            name='name',
            field=models.CharField(default=None, max_length=20),
            preserve_default=False,
        ),
    ]