from django.conf.urls import include, url
from django.contrib import admin
from django.views.generic.base import RedirectView

urlpatterns = [
    # url(r'^grappelli/', include('grappelli.urls')),
    url(r'^admin/accounting/(\w+)/csv/', 'accounting.views.sample_page'),
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$',RedirectView.as_view(url='/admin')),
]
