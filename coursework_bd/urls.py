from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    # url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/accounting/(\w+)/csv/', 'accounting.views.sample_page'),
    url(r'^admin/', include(admin.site.urls)),

]
