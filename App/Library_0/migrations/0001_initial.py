# Generated by Django 4.2.1 on 2024-08-20 12:00

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Book',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=200, unique=True)),
                ('author', models.CharField(max_length=100)),
                ('publication_date', models.DateField()),
                ('category', models.CharField(choices=[('fiction', 'Fiction'), ('nonfiction', 'Non-fiction'), ('mystery', 'Mystery'), ('biography', 'Biography'), ('science', 'Science'), ('fantasy', 'Fantasy')], max_length=50)),
                ('is_borrowed', models.BooleanField(default=False)),
            ],
        ),
        migrations.CreateModel(
            name='Patient',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('address', models.CharField(max_length=200)),
                ('phone_number', models.CharField(max_length=20)),
                ('category', models.CharField(choices=[('burn', 'Burn'), ('emergency', 'Emergency'), ('regular', 'Regular')], max_length=50)),
                ('age', models.IntegerField()),
                ('date_of_visit', models.DateField()),
                ('follow_up_status', models.BooleanField(default=False)),
                ('examination_or_operation_fees', models.DecimalField(decimal_places=2, max_digits=10)),
            ],
        ),
    ]
