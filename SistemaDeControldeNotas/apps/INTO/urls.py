from django.conf.urls import url,include
from apps.INTO.views import Vista

app_name="INTO"
urlpatterns = [ 

	url(r'base',Vista.as_view(), name='base'),

]