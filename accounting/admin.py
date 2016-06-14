from django.contrib import admin
from django.contrib.auth.models import Group, User, models
from accounting.forms import АдресаФорм, ТелефоныФорм

from accounting.models import Должности, Адреса, ЕденицыИзмерения, Характеристики, Производители, ТипыУлиц, \
    ХарактеристикиМодели, ТипыТехники, МоделиТехники, Комнаты, Рабочиеместа, Комплекты, НазванияКомплекта, \
    ЕденицыТехники, НазванияЕденицыТехники, Телефоны, Сотрудники, Поставщики


class АдресаАдмин(admin.ModelAdmin):
    list_display = ('country', 'city')
    form = АдресаФорм

    def country(self, obj):
        return obj.адрес.split(',')[0]

    def city(self, obj):
        return obj.адрес.split(',')[1]

    city.short_description = 'Город'
    country.short_description = 'Страна'


class ТелефоныАдмин(admin.ModelAdmin):
    form = ТелефоныФорм


class ДолжностиАдмин(admin.ModelAdmin):
    list_display = ('название',)
    search_fields = ('название',)
    ordering = ('название',)


class ЕденицыИзмеренияАдмин(admin.ModelAdmin):
    list_display = ('название', 'сокращенное_название',)
    search_fields = ('название', 'сокращенное_название',)
    ordering = ('название',)


# class МоделиТехникиТабулар(admin.TabularInline):
#    model = МоделиТехники.haract.through


class МоделиТехникиАдмин(admin.ModelAdmin):
    fields = ('название', 'id_производителя', 'id_типа_техники',)
    list_display = ('название', 'id_производителя', 'id_типа_техники',)
    search_fields = ('название', 'id_производителя__название', 'id_типа_техники__название',)

    # inlines = (МоделиТехникиТабулар, )


class ХарактеристикиАдмин(admin.ModelAdmin):
    list_display = ('название', 'id_еденицы_измерения',)
    search_fields = ('название', 'id_еденицы_измерения__название',)
    ordering = ('название',)


class ПроизводителиАдмин(admin.ModelAdmin):
    list_display = ('название',)
    search_fields = ('название',)
    ordering = ('название',)


class ТипыУлицАдмин(admin.ModelAdmin):
    list_display = ('название', 'сокращенное_название',)
    search_fields = ('название', 'сокращенное_название',)
    ordering = ('название',)


class ХарактеристикиМоделиАдмин(admin.ModelAdmin):
    list_display = ('id_характеристики', 'id_модели_техники', 'значение',)
    # search_fields = ('',)


class ТипыТехникиАдмин(admin.ModelAdmin):
    list_display = ('название',)
    search_fields = ('название',)


class ЕденицыТехникиАдмин(admin.ModelAdmin):
    list_display = ('id_названия_еденицы_техники', 'id_комплекта',)


class СотрудникиАдмин(admin.ModelAdmin):
    list_display = ('фамилия', 'имя', 'отчество', 'дата_рождения', 'id_должности',
                    'id_рабочего_места', 'пол', 'id_телефона', 'id_адреса')
    list_display_links = ('фамилия', 'имя', 'отчество')


class ПоставщикиАдмин(admin.ModelAdmin):
    list_display = ('название', 'id_телефона', 'id_адреса', 'другие_контактные_данные', 'комментарий',)
    fields = ('название', 'id_телефона', 'id_адреса', 'другие_контактные_данные', 'комментарий',)


admin.site.register(МоделиТехники, МоделиТехникиАдмин)
admin.site.register(Должности, ДолжностиАдмин)
admin.site.register(Адреса, АдресаАдмин)
admin.site.register(ЕденицыИзмерения, ЕденицыИзмеренияАдмин)
admin.site.register(Характеристики, ХарактеристикиАдмин)
admin.site.register(Производители, ПроизводителиАдмин)
admin.site.register(ТипыУлиц, ТипыУлицАдмин)
admin.site.register(ХарактеристикиМодели, ХарактеристикиМоделиАдмин)
admin.site.register(ТипыТехники, ТипыТехникиАдмин)
admin.site.register(Комнаты)
admin.site.register(Рабочиеместа)
admin.site.register(Комплекты)
admin.site.register(НазванияКомплекта)
admin.site.register(ЕденицыТехники, ЕденицыТехникиАдмин)
admin.site.register(НазванияЕденицыТехники)
admin.site.register(Телефоны, ТелефоныАдмин)
admin.site.register(Сотрудники, СотрудникиАдмин)
admin.site.register(Поставщики, ПоставщикиАдмин)

admin.site.unregister(Group)
admin.site.unregister(User)
