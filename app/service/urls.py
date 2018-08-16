from django.contrib import admin
from django.conf.urls import include, url
from django.conf import settings
from django.views.generic import RedirectView
from .defaultRouterWithSimpleViews import DefaultRouterWithSimpleViews


router = DefaultRouterWithSimpleViews()

urlpatterns = [
    url(r'^$', RedirectView.as_view(url='api')),
    url(r'^admin/', admin.site.urls),
    url(r'^api/', include(router.urls)),
]


if settings.DEBUG:

    from django.conf.urls.static import static
    import debug_toolbar

    urlpatterns = [
        url(r'^__debug__/', include(debug_toolbar.urls)),
    ] + urlpatterns

    urlpatterns += static(settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT)
