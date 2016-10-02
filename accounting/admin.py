from django.contrib import admin
from django.contrib.auth.models import Group, User, models
from accounting.forms import АдресаФорм, ТелефоныФорм

from accounting.models import Должности, Адреса, ЕденицыИзмерения, Характеристики, Производители, ТипыУлиц, \
    ХарактеристикиМодели, ТипыТехники, МоделиТехники, Комнаты, Рабочиеместа, Комплекты, НазванияКомплекта, \
    ЕденицыТехники, НазванияЕденицыТехники, Телефоны, Сотрудники, Поставщики, ТипыОрганизаций, Накладные, \
    ЭкземплярыТехники, ТехникаПоНакладной, ТипыПП, ПрограммныеПродукты, ПППоНакладной, УстановленныеПП, \
    Списания, СписаннаяТехника


class АдресаАдмин(admin.ModelAdmin):
    list_display = ('country', 'city', 'id_типа_улицы', 'street', 'house', 'apartment', 'belongs')
    form = АдресаФорм

    def country(self, obj):
        return obj.адрес.split(',')[0]

    def city(self, obj):
        return obj.адрес.split(',')[1]

    def street(self, obj):
        return obj.адрес.split(',')[2]

    def house(self, obj):
        return obj.адрес.split(',')[3]

    def apartment(self, obj):
        if len(obj.адрес.split(',')) > 4:
            return obj.адрес.split(',')[4]
        else:
            return ""

    def belongs(self, obj):
        id_адреса = obj.id_адреса
        providers = Поставщики.objects.filter(id_адреса=id_адреса)
        employees = Сотрудники.objects.filter(id_адреса=id_адреса)
        if providers:
            res = ""
            count = 0
            for i in providers:
                res+=str(i)+", "
                count+=1
            return 'Поставщики: '+ res[:-2] if count>1 else 'Поставщик: '+ res[:-2]
        elif employees:
            res = ""
            count = 0
            for i in employees:
                res+=str(i)+", "
                count+=1
            print(res[:-2])
            return 'Сотрудники: '+ res[:-2] if count>1 else 'Сотрудники: '+ res[:-2]
        else:
            return None

    country.short_description = 'Страна'
    city.short_description = 'Город'
    street.short_descriptor = 'Улица'
    house.short_descriptor = 'Дом'
    apartment.short_descriptor = 'Квартира'
    belongs.short_description = 'Принадлежит'


class ТелефоныАдмин(admin.ModelAdmin):
    list_display = ('телефон','belongs')
    form = ТелефоныФорм

    def changelist_view(self, request, extra_context=None):
        extra_context = extra_context or {}
        extra_context['some_var'] = 'This is what I want to show'
        return super(ТелефоныАдмин, self).changelist_view(request, extra_context=extra_context)

    def belongs(self, obj):
        id_телефона = obj.id_телефона
        providers = Поставщики.objects.filter(id_телефона=id_телефона)
        employees = Сотрудники.objects.filter(id_телефона=id_телефона)
        if providers:
            res = ""
            count = 0
            for i in providers:
                res+=str(i)+", "
                count+=1
            return 'Поставщики: '+ res[:-2] if count>1 else 'Поставщик: '+ res[:-2]
        elif employees:
            res = ""
            count = 0
            for i in employees:
                res+=str(i)+", "
                count+=1
            print(res[:-2])
            return 'Сотрудники: '+ res[:-2] if count>1 else 'Сотрудники: '+ res[:-2]
        else:
            return None

    belongs.short_description = 'Принадлежит'

#         provider = Поставщики.objects.filter(id_телефона=value)
#     if provider:
#         raise ValidationError('Данный номер указан у поставщика {0}'.format(*provider))



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
    list_display = ('название', 'id_типа_организации', 'id_телефона', 'id_адреса', 'другие_контактные_данные',
                    'комментарий',)
    fields = ('название', 'id_типа_организации', 'id_телефона', 'id_адреса', 'другие_контактные_данные', 'комментарий',)


class ТипыОрганизацийАдмин(admin.ModelAdmin):
    list_display = ('название', 'аббревиатура',)
    search_fields = ('название', 'аббревиатура',)


class НакладныеАдмин(admin.ModelAdmin):
    list_display = ('номер_накладной', 'id_поставщика', 'дата_поставки',)
    fields = ('номер_накладной', 'id_поставщика', 'дата_поставки',)
    # search_fields = ('id_поставщика__название', 'дата_поставки',)


# class ЭкземплярыТехникиАдмин(admin.ModelAdmin):
#     list_display = ('id_техники_по_накладной', 'id_еденицы_техники', 'инвентарный_номер', 'заводской_код',
#                     'дата_гарантии')


class ЭкземплярыТехникиАдмин(admin.ModelAdmin):
    list_display = ('_модель_техники', "id_еденицы_техники", 'инвентарный_номер', '_накладная', 'заводской_код',
                     'дата_гарантии',"_decommissioned",)#'number_of_orders',)
    search_fields = ('инвентарный_номер',)
    ordering = ('дата_гарантии',)

    def _модель_техники(self, obj):
        return str(obj.id_техники_по_накладной.id_модели_техники)

    def _накладная(self, obj):
        return str(obj.id_техники_по_накладной.id_накладной.номер_накладной)

    def _еденица_техники(self, obj):
        return str(obj.id_еденицы_техники)

    def _decommissioned(self, obj):
        id_экземпляра = obj.id_экземпляра_техники
        decommissioned = СписаннаяТехника.objects.filter(id_экземпляра_техники=id_экземпляра)
        if decommissioned:
            return "Да"
        else:
            return "Нет"

    # def queryset(self, request):
    #     # qs = super(ЭкземплярыТехникиАдмин, self).queryset(request)
    #     # qs = qs.annotate(models.Count('списаннаятехника'))
    #     # return qs
    #     return ЭкземплярыТехники.objects.annotate(artist_count=models.Count('artists'))
    #
    # def number_of_orders(self, obj):
    #     id_экземпляра = obj.id_экземпляра_техники
    #     decommissioned = СписаннаяТехника.objects.filter(id_экземпляра_техники=id_экземпляра)
    #     if decommissioned:
    #         return "Да"
    #     else:
    #         return "Нет"
    #     # return obj.order__count
    # number_of_orders.admin_order_field = 'order__count'

    _модель_техники.short_description = 'Модель техники'
    _накладная.short_description = "Накладная"
    _еденица_техники.short_description = "Еденица техники"
    _decommissioned.short_description = "Списана"


class ТехникаПоНакладнойАдмин(admin.ModelAdmin):
    list_display = ('id_модели_техники', 'id_накладной', 'количество', 'цена_за_еденицу')


class ПрограммныеПродуктыАдмин(admin.ModelAdmin):
    list_display = ('название', 'id_типа_пп')


class ПППоНакладнойАдмин(admin.ModelAdmin):
    list_display = ('id_накладной', 'id_пп', 'количество', 'цена_за_еденицу')


class КомнатыАдмин(admin.ModelAdmin):
    list_display = ('номер_комнаты',)


class УстановленныеППАдмин(admin.ModelAdmin):
    list_display = ('_id_экземпляра_техники', '_id_пп_по_накладной', 'серийный_ключ')

    def _id_пп_по_накладной(self, obj):
        return str(obj.id_пп_по_накладной)

    def _id_экземпляра_техники(self, obj):
        return str(obj.id_экземпляра_техники)

    _id_пп_по_накладной.short_description = 'Программный продукт по накладной'
    _id_экземпляра_техники.short_description = 'Экземпляр техники'


class СписанияАдмин(admin.ModelAdmin):
    list_display = ('id_сотрудника', 'дата', 'заголовок')


class СписаннаяТехникаАдмин(admin.ModelAdmin):
    # list_display = ('id_экземпляра_техники', 'id_списания', 'причина')
    list_display = ('_id_списания', '_id_экземпляра_техники', 'причина')

    def _id_экземпляра_техники(self, obj):
        return str(obj.id_экземпляра_техники)

    def _id_списания(self, obj):
        return str(obj.id_списания)

    _id_списания.short_description = 'Списание'
    _id_экземпляра_техники.short_description = 'Экземпляр техники'


class КомплектыАдмин(admin.ModelAdmin):
    list_display = ('id_рабочего_места', 'id_названия_комплекта',)


class РабочиеместаАдмин(admin.ModelAdmin):
    list_display = ('id_комнаты', 'номер_рабочего_места')


admin.site.register(МоделиТехники, МоделиТехникиАдмин)
admin.site.register(Должности, ДолжностиАдмин)
admin.site.register(Адреса, АдресаАдмин)
admin.site.register(ЕденицыИзмерения, ЕденицыИзмеренияАдмин)
admin.site.register(Характеристики, ХарактеристикиАдмин)
admin.site.register(Производители, ПроизводителиАдмин)
admin.site.register(ТипыУлиц, ТипыУлицАдмин)
admin.site.register(ХарактеристикиМодели, ХарактеристикиМоделиАдмин)
admin.site.register(ТипыТехники, ТипыТехникиАдмин)
admin.site.register(Комнаты, КомнатыАдмин)
admin.site.register(Рабочиеместа, РабочиеместаАдмин)
admin.site.register(Комплекты, КомплектыАдмин)
admin.site.register(НазванияКомплекта)
admin.site.register(ЕденицыТехники, ЕденицыТехникиАдмин)
admin.site.register(НазванияЕденицыТехники)
admin.site.register(Телефоны, ТелефоныАдмин)
admin.site.register(Сотрудники, СотрудникиАдмин)
admin.site.register(Поставщики, ПоставщикиАдмин)
admin.site.register(ТипыОрганизаций, ТипыОрганизацийАдмин)
admin.site.register(Накладные, НакладныеАдмин)
admin.site.register(ТехникаПоНакладной, ТехникаПоНакладнойАдмин)
admin.site.register(ЭкземплярыТехники, ЭкземплярыТехникиАдмин)
admin.site.register(ТипыПП)
admin.site.register(ПрограммныеПродукты, ПрограммныеПродуктыАдмин)
admin.site.register(ПППоНакладной, ПППоНакладнойАдмин)
admin.site.register(УстановленныеПП, УстановленныеППАдмин)
admin.site.register(Списания, СписанияАдмин)
admin.site.register(СписаннаяТехника, СписаннаяТехникаАдмин)

admin.site.unregister(Group)
admin.site.unregister(User)
