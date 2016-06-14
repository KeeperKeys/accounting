# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines for those models you wish to give write DB access
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class Адреса(models.Model):
    id_адреса = models.SmallIntegerField(primary_key=True)
    адрес = models.CharField(max_length=200)
    id_типа_улицы = models.ForeignKey('ТипыУлиц', db_column='id_типа_улицы')

    def __str__(self):
        return ", ".join(
            (self.адрес.split(',')[0],
             self.адрес.split(',')[1],
             self.id_типа_улицы.сокращенное_название,
             self.адрес.split(',')[2],
             self.адрес.split(',')[3]))
             # self.адрес.split(',')[4]))

    class Meta:
        db_table = 'Адреса'
        verbose_name = 'адрес'
        verbose_name_plural = 'адреса'


class Должности(models.Model):
    id_должности = models.AutoField(primary_key=True)
    название = models.CharField(max_length=40, blank=True, null=True, help_text='Введите название должности')

    def __str__(self):
        return self.название

    class Meta:
        db_table = 'Должности'
        verbose_name = 'должность'
        verbose_name_plural = 'должности'


# class ЕденицыИзмерения(models.Model):
#     id_field = models.IntegerField(db_column='id_\u0435\u0434\u0435\u043d\u0438\u0446\u044b_\u0438\u0437\u043c\u0435\u0440\u0435\u043d\u0438\u044f', primary_key=True)
#     field_field = models.CharField(db_column='\u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435', max_length=90, blank=True)
#     field_field_0 = models.CharField(db_column='\u0441\u043e\u043a\u0440\u0430\u0449\u0435\u043d\u043d\u043e\u0435_\u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435', max_length=30, blank=True)
#     class Meta:
#         managed = False
#         db_table = 'ЕденицыИзмерения'


class ЕденицыИзмерения(models.Model):
    id_еденицы_измерения = models.AutoField(primary_key=True)
    название = models.CharField(max_length=30, blank=True, null=True)
    сокращенное_название = models.CharField(max_length=10, blank=True, null=True)

    def __str__(self):
        return "{0} ({1})".format(self.название, self.сокращенное_название)

    class Meta:
        db_table = 'ЕденицыИзмерения'
        verbose_name = 'единица измерения'
        verbose_name_plural = 'единицы измерения'


# class ЕденицыТехники(models.Model):
#     id_field = models.IntegerField(
#         db_column='id_\u0435\u0434\u0435\u043d\u0438\u0446\u044b_\u0442\u0435\u0445\u043d\u0438\u043a\u0438',
#         primary_key=True)
#     id_field_0 = models.ForeignKey('Комплекты', db_column='id_\u043a\u043e\u043c\u043f\u043b\u0435\u043a\u0442\u0430')
#
#     class Meta:
#         managed = False
#         db_table = 'ЕденицыТехники'


class ЕденицыТехники(models.Model):
    id_еденицы_техники = models.AutoField(primary_key=True)
    id_комплекта = models.ForeignKey('Комплекты', db_column='id_комплекта', verbose_name='название комплекта')
    id_названия_еденицы_техники = models.ForeignKey('НазванияЕденицыТехники', db_column='id_названия_еденицы_техники',
                                                    verbose_name='название еденицы техники')

    def __str__(self):
        return "{0} ".format(self.id_названия_еденицы_техники, self.id_комплекта)

    class Meta:
        db_table = 'ЕденицыТехники'
        verbose_name = 'еденица техники'
        verbose_name_plural = 'еденицы техники'


class НазванияЕденицыТехники(models.Model):
    id_названия_еденицы_техники = models.AutoField(primary_key=True)
    название = models.CharField(max_length=40, blank=True, null=True)

    def __str__(self):
        return self.название

    class Meta:
        db_table = 'НазванияЕденицыТехники'
        verbose_name = 'название единицы техники'
        verbose_name_plural = 'названия единицы техники'


# class Комнаты(models.Model):
#     id_field = models.IntegerField(db_column='id_\u043a\u043e\u043c\u043d\u0430\u0442\u044b', primary_key=True)
#     field_field = models.CharField(
#         db_column='\u043d\u043e\u043c\u0435\u0440_\u043a\u043e\u043c\u043d\u0430\u0442\u044b', max_length=15)
#
#     class Meta:
#         managed = False
#         db_table = 'Комнаты'


class Комнаты(models.Model):
    id_комнаты = models.AutoField(primary_key=True)
    номер_комнаты = models.CharField(max_length=5)

    def __str__(self):
        return self.номер_комнаты

    class Meta:
        db_table = 'Комнаты'
        verbose_name = 'комната'
        verbose_name_plural = 'комнаты'


# class Комплекты(models.Model):
#     id_field = models.IntegerField(db_column='id_\u043a\u043e\u043c\u043f\u043b\u0435\u043a\u0442\u0430',
#                                    primary_key=True)
#     id_field_0 = models.ForeignKey('Рабочиеместа',
#                                    db_column='id_\u0440\u0430\u0431\u043e\u0447\u0435\u0433\u043e_\u043c\u0435\u0441\u0442\u0430')
#
#     class Meta:
#         managed = False
#         db_table = 'Комплекты'

class Комплекты(models.Model):
    id_комплекта = models.AutoField(primary_key=True)
    id_рабочего_места = models.ForeignKey('Рабочиеместа', db_column='id_рабочего_места', verbose_name='рабочее место')
    id_названия_комплекта = models.ForeignKey('НазванияКомплекта', db_column='id_названия_комплекта', verbose_name='название комплекта')

    def __str__(self):
        return '{0}, комплект "{1}"'.format(self.id_рабочего_места, self.id_названия_комплекта)

    class Meta:
        db_table = 'Комплекты'
        verbose_name = 'комплект'
        verbose_name_plural = 'комплекты'


class НазванияКомплекта(models.Model):
    id_названия_комплекта = models.AutoField(primary_key=True)
    название = models.CharField(max_length=40, blank=True, null=True)

    def __str__(self):
        return self.название

    class Meta:
        db_table = 'НазванияКомплекта'
        verbose_name = 'название комплекта'
        verbose_name_plural = 'названия комплекта'



class МоделиТехники(models.Model):
    "добавить свзяь многие ко многим"
    id_модели_техники = models.AutoField(primary_key=True)
    название = models.CharField(max_length=100)
    id_производителя = models.ForeignKey('Производители', db_column='id_производителя', verbose_name='Производитель')
    id_типа_техники = models.ForeignKey('ТипыТехники', db_column='id_типа_техники', verbose_name='Тип техники')
    #haract = models.ManyToManyField('Характеристики', through='ХарактеристикиМодели')

    def __str__(self):
        return '{0} {1} {2}'.format(self.название, self.id_производителя.название, self.id_типа_техники.название)

    class Meta:
        db_table = 'МоделиТехники'
        verbose_name = 'модель техники'
        verbose_name_plural = 'модели техники'


class Накладные(models.Model):
    id_field = models.IntegerField(db_column='id_\u043d\u0430\u043a\u043b\u0430\u0434\u043d\u043e\u0439')
    field_field = models.DateField(
        db_column='\u0434\u0430\u0442\u0430_\u043f\u043e\u0441\u0442\u0430\u0432\u043a\u0438')
    id_field_0 = models.ForeignKey('Поставщики',
                                   db_column='id_\u043f\u043e\u0441\u0442\u0430\u0432\u0449\u0438\u043a\u0430')

    class Meta:
        managed = False
        db_table = 'Накладные'


class ПППоНакладной(models.Model):
    id_field = models.ForeignKey('Накладные', db_column='id_\u043d\u0430\u043a\u043b\u0430\u0434\u043d\u043e\u0439')
    id_field_0 = models.ForeignKey('ПрограммныеПродукты', db_column='id_\u041f\u041f')
    field_field = models.DecimalField(
        db_column='\u0446\u0435\u043d\u0430_\u0437\u0430_\u0435\u0434\u0435\u043d\u0438\u0446\u0443', max_digits=8,
        decimal_places=2, blank=True, null=True)
    field_field_0 = models.IntegerField(db_column='\u043a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e')

    class Meta:
        managed = False
        db_table = 'ПППоНакладной'


# class Поставщики(models.Model):
#     id_field = models.IntegerField(db_column='id_\u043f\u043e\u0441\u0442\u0430\u0432\u0449\u0438\u043a\u0430',
#                                    primary_key=True)
#     id_field_0 = models.ForeignKey('Адреса', db_column='id_\u0430\u0434\u0440\u0435\u0441\u0430')
#     id_field_1 = models.ForeignKey('Телефоны', db_column='id_\u0442\u0435\u043b\u0435\u0444\u043e\u043d\u0430')
#     field_field = models.TextField(
#         db_column='\u0434\u0440\u0443\u0433\u0438\u0435_\u043a\u043e\u043d\u0442\u0430\u043a\u0442\u043d\u044b\u0435_\u0434\u0430\u043d\u043d\u044b\u0435',
#         blank=True)
#     field_field_0 = models.TextField(db_column='\u043a\u043e\u043c\u043c\u0435\u043d\u0442\u0430\u0440\u0438\u0439',
#                                      blank=True)
#     field_field_1 = models.CharField(db_column='\u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435',
#                                      max_length=300)  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'. Field renamed because of name conflict.
#
#     class Meta:
#         managed = False
#         db_table = 'Поставщики'

class Поставщики(models.Model):
    id_поставщика = models.SmallIntegerField(primary_key=True)
    id_адреса = models.ForeignKey('Адреса', db_column='id_адреса')
    id_телефона = models.ForeignKey('Телефоны', db_column='id_телефона')
    другие_контактные_данные = models.TextField(blank=True, null=True)
    комментарий = models.TextField(blank=True, null=True)
    название = models.CharField(max_length=100)

    def __str__(self):
        return self.название

    class Meta:
        db_table = 'Поставщики'
        verbose_name = 'поставщик'
        verbose_name_plural = 'поставщики'


class ПрограммныеПродукты(models.Model):
    id_field = models.IntegerField(db_column='id_\u041f\u041f',
                                   primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    field_field = models.CharField(db_column='\u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435',
                                   max_length=300)  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'.
    id_field_0 = models.ForeignKey('ТипыПП',
                                   db_column='id_\u0442\u0438\u043f\u0430_\u041f\u041f')  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'. Field renamed because of name conflict.

    class Meta:
        managed = False
        db_table = 'ПрограммныеПродукты'


class Производители(models.Model):
    id_производителя = models.AutoField(primary_key=True)
    название = models.CharField(max_length=100)

    def __str__(self):
        return self.название

    class Meta:
        db_table = 'Производители'
        verbose_name = 'производитель'
        verbose_name_plural = 'производители'


class Рабочиеместа(models.Model):
    id_рабочего_места = models.AutoField(primary_key=True)
    id_комнаты = models.ForeignKey('Комнаты', db_column='id_комнаты', verbose_name='номер комнаты')
    номер_рабочего_места = models.CharField(max_length=3)

    def __str__(self):
        return "Комната № {0}, рабочее место № {1}".format(self.id_комнаты, self.номер_рабочего_места)

    class Meta:
        db_table = 'РабочиеМеста'
        verbose_name = 'рабочее место'
        verbose_name_plural = 'рабочие места'


class Сотрудники(models.Model):

    Полы = (
        ('м', 'Мужской'),
        ('ж', 'Женский'),
    )

    id_сотрудника = models.AutoField(primary_key=True)
    фамилия = models.CharField(max_length=30)
    имя = models.CharField(max_length=30)
    отчество = models.CharField(max_length=20)
    дата_рождения = models.DateField(blank=True, null=True)
    id_должности = models.ForeignKey('Должности', db_column='id_должности', verbose_name='Должность')
    id_рабочего_места = models.ForeignKey('Рабочиеместа', db_column='id_рабочего_места', verbose_name='Рабочее место')
    пол = models.CharField(max_length=1, blank=True, null=True, choices=Полы)
    id_телефона = models.ForeignKey('Телефоны', db_column='id_телефона', verbose_name='Телефон')
    id_адреса = models.ForeignKey('Адреса', db_column='id_адреса', verbose_name='Адрес')

    def __str__(self):
        return self.фамилия + ' ' + self.имя[0] + '. ' + self.отчество[0] + '.'

    class Meta:
        db_table = 'Сотрудники'
        verbose_name = 'сотрудник'
        verbose_name_plural = 'сотрудники'


class Списания(models.Model):
    id_field = models.IntegerField(db_column='id_\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u0435',
                                   primary_key=True)  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    field_field = models.DateField(
        db_column='\u0434\u0430\u0442\u0430')  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'.
    id_field_0 = models.ForeignKey('Сотрудники',
                                   db_column='id_\u0441\u043e\u0442\u0440\u0443\u0434\u043d\u0438\u043a\u0430')  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'. Field renamed because of name conflict.

    class Meta:
        managed = False
        db_table = 'Списания'


class СписаннаяТехника(models.Model):
    id_field = models.ForeignKey('ЭкземплярыТехники',
                                 db_column='id_\u044d\u043a\u0437\u0435\u043c\u043f\u043b\u044f\u0440\u0430_\u0442\u0435\u0445\u043d\u0438\u043a\u0438')  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    id_field_0 = models.ForeignKey('Списания',
                                   db_column='id_\u0441\u043f\u0438\u0441\u0430\u043d\u0438\u044f')  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'. Field renamed because of name conflict.
    field_field = models.TextField(db_column='\u043f\u0440\u0438\u0447\u0438\u043d\u0430',
                                   blank=True)  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'.

    class Meta:
        managed = False
        db_table = 'СписаннаяТехника'


class Телефоны(models.Model):
    id_телефона = models.AutoField(primary_key=True)
    телефон = models.CharField(max_length=100)

    def __str__(self):
        return self.телефон

    class Meta:
        db_table = 'Телефоны'
        verbose_name = 'телефон'
        verbose_name_plural = 'телефоны'


class ТехникаПоНакладной(models.Model):
    id_field = models.ForeignKey('Накладные',
                                 db_column='id_\u043d\u0430\u043a\u043b\u0430\u0434\u043d\u043e\u0439')  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    id_field_0 = models.ForeignKey('МоделиТехники',
                                   db_column='id_\u043c\u043e\u0434\u0435\u043b\u0438_\u0442\u0435\u0445\u043d\u0438\u043a\u0438')  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'. Field renamed because of name conflict.
    field_field = models.IntegerField(
        db_column='\u043a\u043e\u043b\u0438\u0447\u0435\u0441\u0442\u0432\u043e')  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'.
    field_field_0 = models.DecimalField(
        db_column='\u0446\u0435\u043d\u0430_\u0437\u0430_\u0435\u0434\u0435\u043d\u0438\u0446\u0443', max_digits=8,
        decimal_places=2, blank=True,
        null=True)  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'. Field renamed because of name conflict.

    class Meta:
        managed = False
        db_table = 'ТехникаПоНакладной'


class ТипыПП(models.Model):
    id_field = models.IntegerField(db_column='id_\u0442\u0438\u043f\u0430_\u041f\u041f',
                                   primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    field_field = models.CharField(db_column='\u043d\u0430\u0437\u0432\u0430\u043d\u0438\u0435', max_length=240,
                                   blank=True)  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'.

    class Meta:
        managed = False
        db_table = 'ТипыПП'


class ТипыТехники(models.Model):
    id_типа_техники = models.AutoField(primary_key=True)
    название = models.CharField(max_length=60)

    def __str__(self):
        return self.название

    class Meta:
        db_table = 'ТипыТехники'
        verbose_name = 'тип техники'
        verbose_name_plural = 'типы техники'


class ТипыУлиц(models.Model):
    id_типа_улицы = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=20)
    сокращенное_название = models.CharField(max_length=4)

    def __str__(self):
        return "{0} ({1})".format(self.название, self.сокращенное_название)

    class Meta:
        db_table = 'ТипыУлиц'
        verbose_name = 'тип улицы'
        verbose_name_plural = 'типы улиц'


class УстановленныеПП(models.Model):
    id_field = models.IntegerField(
        db_column='id_\u0443\u0441\u0442\u0430\u043d\u043e\u0432\u043b\u0435\u043d\u043d\u043e\u0433\u043e\u041f\u041f',
        primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'.
    id_field_0 = models.ForeignKey('ПППоНакладной',
                                   db_column='id_\u043d\u0430\u043a\u043b\u0430\u0434\u043d\u043e\u0439',
                                   related_name='fk_накладной_ПП1_1')  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'. Field renamed because of name conflict.
    id_field_1 = models.ForeignKey('ПППоНакладной', db_column='id_\u041f\u041f',
                                   related_name='fk_накладной_ПП1_2')  # Field name made lowercase. Field renamed to remove unsuitable characters. Field renamed because it ended with '_'. Field renamed because of name conflict.
    field_field = models.CharField(
        db_column='\u0441\u0435\u0440\u0438\u0439\u043d\u044b\u0439_\u043a\u043b\u044e\u0447',
        max_length=90)  # Field renamed to remove unsuitable characters. Field renamed because it started with '_'. Field renamed because it ended with '_'.
    id_field_2 = models.ForeignKey('ЭкземплярыТехники',
                                   db_column='id_\u044d\u043a\u0437\u0435\u043c\u043f\u043b\u044f\u0440\u0430_\u0442\u0435\u0445\u043d\u0438\u043a\u0438')  # Field renamed to remove unsuitable characters. Field renamed because it ended with '_'. Field renamed because of name conflict.

    class Meta:
        managed = False
        db_table = 'УстановленныеПП'


class Характеристики(models.Model):
    id_характеристики = models.AutoField(primary_key=True)
    название = models.CharField(max_length=30)
    id_еденицы_измерения = models.ForeignKey('ЕденицыИзмерения', db_column='id_еденицы_измерения',
                                             verbose_name='Еденицы измерения')

    def __str__(self):
        return self.название

    class Meta:
        db_table = 'Характеристики'
        verbose_name = 'характеристика'
        verbose_name_plural = 'характеристики'


class ХарактеристикиМодели(models.Model):
    """Дополнительное уникальное поле id_характеристики_модели, но в модели оно помечено как pk"""
    # сделать первичный ключ id новое поле. чертова джанга
    id_характеристики_модели = models.AutoField(primary_key=True)
    id_характеристики = models.ForeignKey('Характеристики', db_column='id_характеристики',
                                          verbose_name='название характеристики')
    id_модели_техники = models.ForeignKey('МоделиТехники', db_column='id_модели_техники',
                                          verbose_name='название модели техники')
    значение = models.DecimalField(max_digits=10, decimal_places=4, blank=True, null=True)

    def __str__(self):
        return '{0} {1} {2}'.format(self.id_модели_техники.название, self.id_характеристики.название, self.значение)

    class Meta:
        db_table = 'ХарактеристикиМодели'
        unique_together = (('id_характеристики', 'id_модели_техники'),)
        verbose_name = 'характеристика модели'
        verbose_name_plural = "характеристики модели"


class ЭкземплярыТехники(models.Model):
    id_экземпляра_техники = models.AutoField(primary_key=True)
    id_еденицы_техники = models.ForeignKey('ЕденицыТехники', db_column='id_еденицы_техники')
    заводской_код = models.CharField(max_length=20, blank=True, null=True)
    инвентарный_номер = models.CharField(max_length=20)
    id_накладной = models.ForeignKey('ТехникаПоНакладной', db_column='id_накладной',
                                     related_name='fk_id_накладной_модели_техники_1')
    id_модели_техники = models.ForeignKey('ТехникаПоНакладной', db_column='id_модели_техники',
                                          related_name='fk_id_накладной_модели_техники_2')
    дата_гарантии = models.DateField(blank=True, null=True)

    class Meta:
        db_table = 'ЭкземплярыТехники'
        verbose_name = 'экземпляр техники'
        verbose_name_plural = 'экземпляры техники'
