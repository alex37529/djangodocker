from django.http import HttpResponse
from django.template import RequestContext, loader

from .models import Comment


def comment_list(request):
    template = loader.get_template('djangodocker/templates/comments.html')
    comments = Comment.objects.all()
    #raise Exception(comments)
    return HttpResponse(template.render({'comments': comments}))
