from django.shortcuts import render
from django.shortcuts import render_to_response, RequestContext
# from accounting.models import Должности, Адреса, ЕденицыИзмерения, Характеристики, Производители, ТипыУлиц, \
#     ХарактеристикиМодели, ТипыТехники, МоделиТехники, Комнаты, Рабочиеместа, Комплекты, НазванияКомплекта, \
#     ЕденицыТехники, НазванияЕденицыТехники, Телефоны, Сотрудники, Поставщики, ТипыОрганизаций, Накладные, \
#     ЭкземплярыТехники, ТехникаПоНакладной, ТипыПП, ПрограммныеПродукты, ПППоНакладной, УстановленныеПП, \
#     Списания, СписаннаяТехника
import accounting.models

import _csv as csv
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

    elif res == 'Рабочиеместа':
        response['Content-Disposition'] = 'attachment; filename="Workplaces.csv"'
        writer.writerow(['id рабочего места', 'Комната', 'Номер рабочего места'])
        model = accounting.models.Рабочиеместа
        for obj in model.objects.all().order_by('id_рабочего_места'):
            writer.writerow([obj.id_рабочего_места, obj.id_комнаты, obj.номер_рабочего_места])

    elif res == 'Сотрудники':
        response['Content-Disposition'] = 'attachment; filename="Employee.csv"'
        writer.writerow(['id сотрудника', 'Фамилия', 'Имя', 'Отчество', 'Дата рождения', 'Должность',
                         'Рабочее место', 'Пол', 'Телефон', 'Адреса'])
        model = accounting.models.Сотрудники
        for obj in model.objects.all().order_by('id_сотрудника'):
            writer.writerow([obj.id_сотрудника, obj.фамилия, obj.имя, obj.отчество, obj.дата_рождения, obj.id_должности,
                             obj.id_рабочего_места, "мужской" if obj.пол == 'м' else "женский", obj.id_телефона,
                             obj.id_адреса])

    elif res == 'Списания':
        response['Content-Disposition'] = 'attachment; filename="Write-off.csv"'
        writer.writerow(['id списания', 'Дата списания', 'Сотрудник', 'Заголовок'])
        model = accounting.models.Списания
        for obj in model.objects.all().order_by('id_списание'):
            writer.writerow([obj.id_списание, obj.дата, obj.id_сотрудника, obj.заголовок])

    elif res == 'СписаннаяТехника':
        response['Content-Disposition'] = 'attachment; filename="DecommissionedEquipment.csv"'
        writer.writerow(['id списанной техники', 'Эземпляр техники', 'Списание', 'Причина'])
        model = accounting.models.СписаннаяТехника
        for obj in model.objects.all().order_by('id_списанной_техники'):
            writer.writerow([obj.id_списанной_техники, obj.id_экземпляра_техники, obj.id_списания, obj.причина])

    elif res == 'Телефоны':
        response['Content-Disposition'] = 'attachment; filename="Phones.csv"'
        writer.writerow(['id телефона', 'Телефон'])
        model = accounting.models.Телефоны
        for obj in model.objects.all().order_by('id_телефона'):
            writer.writerow([obj.id_телефона, obj.телефон])

    elif res == 'ТехникаПоНакладной':
        response['Content-Disposition'] = 'attachment; filename="TechnicianSurface.csv"'
        writer.writerow(['id техники по накладной', 'Накладная', 'Модель техники', 'Количество',
                         'Цена за еденицу'])
        model = accounting.models.ТехникаПоНакладной
        for obj in model.objects.all().order_by('id_техники_по_накладной'):
            writer.writerow([obj.id_техники_по_накладной, obj.id_накладной, obj.id_модели_техники, obj.количество,
                             obj.цена_за_еденицу])

    elif res == 'ТипыОрганизаций':
        response['Content-Disposition'] = 'attachment; filename="TypesOfOrganizations.csv"'
        writer.writerow(['id типа организации', 'Аббревиатура', 'Название'])
        model = accounting.models.ТипыОрганизаций
        for obj in model.objects.all().order_by('id_типа_организации'):
            writer.writerow([obj.id_типа_организации, obj.аббревиатура, obj.название])

    elif res == 'ТипыПП':
        response['Content-Disposition'] = 'attachment; filename="TypesOfSoftware.csv"'
        writer.writerow(['id типа пп', 'Название'])
        model = accounting.models.ТипыПП
        for obj in model.objects.all().order_by('id_типа_пп'):
            writer.writerow([obj.id_типа_пп, obj.название])

    elif res == 'ТипыТехники':
        response['Content-Disposition'] = 'attachment; filename="TypesOfVehicles.csv"'
        writer.writerow(['id типа техники', 'Название'])
        model = accounting.models.ТипыТехники
        for obj in model.objects.all().order_by('id_типа_техники'):
            writer.writerow([obj.id_типа_техники, obj.название])

    elif res == 'ТипыУлиц':
        response['Content-Disposition'] = 'attachment; filename="TypesOfStreets.csv"'
        writer.writerow(['id типа улицы', 'Название', 'Сокращенное название'])
        model = accounting.models.ТипыУлиц
        for obj in model.objects.all().order_by('id_типа_улицы'):
            writer.writerow([obj.id_типа_улицы, obj.название, obj.сокращенное_название])

    elif res == 'УстановленныеПП':
        response['Content-Disposition'] = 'attachment; filename="InstalledSoftware.csv"'
        writer.writerow(['id установленного пп', 'пп по накладной', 'Серийный_ключ', 'Экземпляр техники'])
        model = accounting.models.УстановленныеПП
        for obj in model.objects.all().order_by('id_установленногопп'):
            writer.writerow([obj.id_установленногопп, obj.id_пп_по_накладной, obj.серийный_ключ,
                             obj.id_экземпляра_техники])

    elif res == 'Характеристики':
        response['Content-Disposition'] = 'attachment; filename="Characteristics.csv"'
        writer.writerow(['id характеристики', 'Название', 'Единица измерения'])
        model = accounting.models.Характеристики
        for obj in model.objects.all().order_by('id_характеристики'):
            writer.writerow([obj.id_характеристики, obj.название, obj.id_еденицы_измерения])

    elif res == 'ХарактеристикиМодели':
        response['Content-Disposition'] = 'attachment; filename="CharacteristicsOfModel.csv"'
        writer.writerow(['id характеристики модели', 'Характеристика', 'Модель техники', 'Значение'])
        model = accounting.models.ХарактеристикиМодели
        for obj in model.objects.all().order_by('id_характеристики_модели'):
            writer.writerow([obj.id_характеристики_модели, obj.id_характеристики, obj.id_модели_техники, obj.значение])

    elif res == 'ЭкземплярыТехники':
        response['Content-Disposition'] = 'attachment; filename="EquipmentItems.csv"'
        writer.writerow(['id экземпляра техники', 'Единица техники', 'Заводской код', 'Инвентарный номер',
                         'Техника по накладной', 'Дата гарантии'])
        model = accounting.models.ЭкземплярыТехники
        for obj in model.objects.all().order_by('id_экземпляра_техники'):
            writer.writerow([obj.id_экземпляра_техники, obj.id_еденицы_техники, obj.заводской_код,
                             obj.инвентарный_номер, obj.id_техники_по_накладной, obj.дата_гарантии])

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
