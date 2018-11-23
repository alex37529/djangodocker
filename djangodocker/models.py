from django.db import models

class Config(models.Model):
    key = models.CharField(primary_key=True, max_length=100)
    value = models.CharField(max_length=100)

    def __str__(self):
        return f'{self.pk} {self.key}'

    #class Meta:
    #    managed = False
    #    db_table = 'application_config'

class Comment(models.Model):
    id = models.AutoField(primary_key=True, db_column='if', help_text='primary key')
    comment = models.TextField('comment', blank=False, help_text='Enter you comment')