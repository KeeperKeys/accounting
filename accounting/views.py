from django.shortcuts import render
from django.shortcuts import render_to_response, RequestContext
# from accounting.models import Должности, Адреса, ЕденицыИзмерения, Характеристики, Производители, ТипыУлиц, \
#     ХарактеристикиМодели, ТипыТехники, МоделиТехники, Комнаты, Рабочиеместа, Комплекты, НазванияКомплекта, \
#     ЕденицыТехники, НазванияЕденицыТехники, Телефоны, Сотрудники, Поставщики, ТипыОрганизаций, Накладные, \
#     ЭкземплярыТехники, ТехникаПоНакладной, ТипыПП, ПрограммныеПродукты, ПППоНакладной, УстановленныеПП, \
#     Списания, СписаннаяТехника
import accounting.models

import csv
from django.http import HttpResponse


# Create your views here.

def sample_page(request, model_title):
    res = ""
    for i in accounting.models.__dict__.keys():
        if i.lower() == model_title:
            res = i
            break
    response = HttpResponse(content_type='text/csv')
    writer = csv.writer(response)
    if res == 'Поставщики':
        response['Content-Disposition'] = 'attachment; filename="Providers.csv"'
        writer.writerow(['id поставщика', 'Тип организации', 'Телефон', 'Адрес', 'Другие контактные данные',
                         'Комментарий'])
        model = accounting.models.Поставщики
        for obj in model.objects.all().order_by('id_поставщика'):
            writer.writerow([obj.id_поставщика, obj.id_типа_организации, obj.id_телефона, obj.id_адреса,
                             obj.другие_контактные_данные, obj.комментарий])

    elif res == 'Адреса':
        response['Content-Disposition'] = 'attachment; filename="Address.csv"'
        writer.writerow(['id адреса', 'Страна', 'Город', 'Улица', 'Дом', 'Квартира'])
        model = accounting.models.Адреса
        for obj in model.objects.all().order_by('id_адреса'):
            writer.writerow([obj.id_адреса, obj.адрес.split(',')[0], obj.адрес.split(',')[1], obj.адрес.split(',')[2],
                             obj.адрес.split(',')[3], obj.адрес.split(',')[4] if len(obj.адрес.split(',')) > 4 else ""])

    elif res == 'Должности':
        response['Content-Disposition'] = 'attachment; filename="Positions.csv"'
        writer.writerow(['id должности', 'Название'])
        model = accounting.models.Должности
        for obj in model.objects.all().order_by('id_должности'):
            writer.writerow([obj.id_должности, obj.название])

    elif res == 'ЕденицыИзмерения':
        response['Content-Disposition'] = 'attachment; filename="Units.csv"'
        writer.writerow(['id единицы измерения', 'Название', 'Сокращенное название'])
        model = accounting.models.ЕденицыИзмерения
        for obj in model.objects.all().order_by('id_еденицы_измерения'):
            writer.writerow([obj.id_еденицы_измерения, obj.название, obj.сокращенное_название])

    elif res == 'ЕденицыТехники':
        response['Content-Disposition'] = 'attachment; filename="EngineeringUnits.csv"'
        writer.writerow(['id единицы техники', 'Комплект', 'Названия единицы техники'])
        model = accounting.models.ЕденицыТехники
        for obj in model.objects.all().order_by('id_еденицы_техники'):
            writer.writerow([obj.id_еденицы_техники, obj.id_комплекта, obj.id_названия_еденицы_техники])

    elif res == 'НазванияЕденицыТехники':
        response['Content-Disposition'] = 'attachment; filename="TheNamesOfPiecesOfEquipment.csv"'
        writer.writerow(['id названия еденицы техники', 'Название'])
        model = accounting.models.НазванияЕденицыТехники
        for obj in model.objects.all().order_by('id_названия_еденицы_техники'):
            writer.writerow([obj.id_названия_еденицы_техники, obj.название])

    elif res == 'Комнаты':
        response['Content-Disposition'] = 'attachment; filename="Apartments.csv"'
        writer.writerow(['id комнаты', 'Номер комнаты'])
        model = accounting.models.Комнаты
        for obj in model.objects.all().order_by('id_комнаты'):
            writer.writerow([obj.id_комнаты, obj.номер_комнаты])

    elif res == 'Комплекты':
        response['Content-Disposition'] = 'attachment; filename="Kits.csv"'
        writer.writerow(['id комплекта', 'Рабочее место', 'Название комплекта'])
        model = accounting.models.Комплекты
        for obj in model.objects.all().order_by('id_комплекта'):
            writer.writerow([obj.id_комплекта, obj.id_рабочего_места, obj.id_названия_комплекта])

    elif res == 'НазванияКомплекта':
        response['Content-Disposition'] = 'attachment; filename="TitlesOfKit.csv"'
        writer.writerow(['id названия комплекта', 'Название'])
        model = accounting.models.НазванияКомплекта
        for obj in model.objects.all().order_by('id_названия_комплекта'):
            writer.writerow([obj.id_названия_комплекта, obj.название])

    elif res == 'МоделиТехники':
        response['Content-Disposition'] = 'attachment; filename="ModelsTechniques.csv"'
        writer.writerow(['id модели техники', 'Название', 'Производитель', 'Типа техники'])
        model = accounting.models.МоделиТехники
        for obj in model.objects.all().order_by('id_модели_техники'):
            writer.writerow([obj.id_модели_техники, obj.название, obj.id_производителя, obj.id_типа_техники])

    elif res == 'Накладные':
        response['Content-Disposition'] = 'attachment; filename="Overhead.csv"'
        writer.writerow(['id накладной', 'Дата поставки', 'Поставщик', 'Номер накладной'])
        model = accounting.models.Накладные
        for obj in model.objects.all().order_by('id_накладной'):
            writer.writerow([obj.id_накладной, obj.дата_поставки, obj.id_поставщика, obj.номер_накладной])

    elif res == 'ПППоНакладной':
        response['Content-Disposition'] = 'attachment; filename="SoftwareInvoice.csv"'
        writer.writerow(['id пп по накладной', 'Накладная', 'Программный продукт', 'Цена за еденицу', 'Количество'])
        model = accounting.models.ПППоНакладной
        for obj in model.objects.all().order_by('id_пп_по_накладной'):
            writer.writerow([obj.id_пп_по_накладной, obj.id_накладной, obj.id_пп, obj.цена_за_еденицу, obj.количество])

    elif res == 'ПрограммныеПродукты':
        response['Content-Disposition'] = 'attachment; filename="Software.csv"'
        writer.writerow(['id программного продукта', 'Название', 'Типа программного продукта'])
        model = accounting.models.ПрограммныеПродукты
        for obj in model.objects.all().order_by('id_пп'):
            writer.writerow([obj.id_пп, obj.название, obj.id_типа_пп])

    elif res == 'Производители':
        response['Content-Disposition'] = 'attachment; filename="Producers.csv"'
        writer.writerow(['id_производителя', 'Название'])
        model = accounting.models.Производители
        for obj in model.objects.all().order_by('id_производителя'):
            writer.writerow([obj.id_производителя, obj.название])

    return response

    # elif res == 'НазванияЕденицыТехники':
    #     resp = create_csv('TheNamesOfPiecesOfEquipment',
    #                       'НазванияЕденицыТехники',
    #                       ['id названия еденицы техники', 'Название'],
    #                       ['id_названия_еденицы_техники', 'название'])

# def create_csv(title, model_title, rows_title, rows):
#     response = HttpResponse(content_type='text/csv')
#     writer = csv.writer(response)
#     response['Content-Disposition'] = 'attachment; filename="{0}.csv"'.format(title)
#     writer.writerow(rows_title)
#     model = accounting.models.__dict__[model_title]
#     for obj in model.objects.all().order_by(rows[0]):
#         l = list()
#         for i in rows:
#             l.append(obj.rows[i])
#     writer.writerow()
#         return response
