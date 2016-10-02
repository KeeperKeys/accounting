# from __future__ import unicode_literals

from django.db import models
from django.core.exceptions import ValidationError
from django.core.validators import MinValueValidator
from _datetime import date, datetime


class Адреса(models.Model):
    id_адреса = models.AutoField(primary_key=True)
    адрес = models.CharField(max_length=200)
    id_типа_улицы = models.ForeignKey('ТипыУлиц', db_column='id_типа_улицы', verbose_name='тип улицы')

    def __str__(self):
        string = ", ".join(
            (self.адрес.split(',')[0],
             self.адрес.split(',')[1],
             self.id_типа_улицы.сокращенное_название,
             self.адрес.split(',')[2],
             self.адрес.split(',')[3]))
        if len(self.адрес.split(',')) > 4:
            string += ',' + self.адрес.split(',')[4]
        return string

    class Meta:
        db_table = 'Адреса'
        verbose_name = 'адрес'
        verbose_name_plural = 'адреса'


class Должности(models.Model):
    id_должности = models.AutoField(primary_key=True)
    название = models.CharField(max_length=40, unique=True, help_text='Введите название должности')

    def __str__(self):
        return self.название

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'Должности'
        verbose_name = 'должность'
        verbose_name_plural = 'должности'


class ЕденицыИзмерения(models.Model):
    id_еденицы_измерения = models.AutoField(primary_key=True)
    название = models.CharField(max_length=30, unique=True)
    сокращенное_название = models.CharField(max_length=10)

    def __str__(self):
        return "{0} ({1})".format(self.название, self.сокращенное_название)

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'ЕденицыИзмерения'
        verbose_name = 'единица измерения'
        verbose_name_plural = 'единицы измерения'


class ЕденицыТехники(models.Model):
    id_еденицы_техники = models.AutoField(primary_key=True)
    id_комплекта = models.ForeignKey('Комплекты', db_column='id_комплекта', verbose_name='название комплекта')
    id_названия_еденицы_техники = models.ForeignKey('НазванияЕденицыТехники', db_column='id_названия_еденицы_техники',
                                                    verbose_name='название еденицы техники')

    def __str__(self):
        return "{0}, {1}".format(self.id_названия_еденицы_техники, self.id_комплекта)

    class Meta:
        db_table = 'ЕденицыТехники'
        verbose_name = 'еденица техники'
        verbose_name_plural = 'еденицы техники'


class НазванияЕденицыТехники(models.Model):
    id_названия_еденицы_техники = models.AutoField(primary_key=True)
    название = models.CharField(max_length=40, unique=True)

    def __str__(self):
        return self.название

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'НазванияЕденицыТехники'
        verbose_name = 'название единицы техники'
        verbose_name_plural = 'названия единицы техники'


class Комнаты(models.Model):
    id_комнаты = models.AutoField(primary_key=True)
    номер_комнаты = models.CharField(max_length=5)

    def __str__(self):
        return self.номер_комнаты

    class Meta:
        db_table = 'Комнаты'
        verbose_name = 'комната'
        verbose_name_plural = 'комнаты'


class Комплекты(models.Model):
    id_комплекта = models.AutoField(primary_key=True)
    id_рабочего_места = models.ForeignKey('Рабочиеместа', db_column='id_рабочего_места', verbose_name='рабочее место')
    id_названия_комплекта = models.ForeignKey('НазванияКомплекта', db_column='id_названия_комплекта',
                                              verbose_name='название комплекта')

    def __str__(self):
        return '{0}, компл. "{1}"'.format(str(self.id_рабочего_места).lower(), self.id_названия_комплекта)

    class Meta:
        db_table = 'Комплекты'
        verbose_name = 'комплект'
        verbose_name_plural = 'комплекты'


class НазванияКомплекта(models.Model):
    id_названия_комплекта = models.AutoField(primary_key=True)
    название = models.CharField(max_length=40, unique=True)

    def __str__(self):
        return self.название

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'НазванияКомплекта'
        verbose_name = 'название комплекта'
        verbose_name_plural = 'названия комплекта'


class МоделиТехники(models.Model):
    # добавить связь многие ко многим или нет...
    id_модели_техники = models.AutoField(primary_key=True)
    название = models.CharField(max_length=100)
    id_производителя = models.ForeignKey('Производители', db_column='id_производителя', verbose_name='Производитель')
    id_типа_техники = models.ForeignKey('ТипыТехники', db_column='id_типа_техники', verbose_name='Тип техники')
    # haract = models.ManyToManyField('Характеристики', through='ХарактеристикиМодели')

    def __str__(self):
        return '{0} {1} {2}'.format(self.название, self.id_производителя.название, self.id_типа_техники.название)

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'МоделиТехники'
        verbose_name = 'модель техники'
        verbose_name_plural = 'модели техники'

def validate_date_naklad(value):
    if value>date.today():
        raise ValidationError('Нельзя указать дату накладной больше сегодняшней')
    elif value<date(1970,1,1):
        raise ValidationError('Дата накладной должна быть старше 1 января 1970')


class Накладные(models.Model):
    id_накладной = models.AutoField(primary_key=True)
    дата_поставки = models.DateField(validators=[validate_date_naklad])
    id_поставщика = models.ForeignKey('Поставщики', db_column='id_поставщика', verbose_name='Поставщик')
    номер_накладной = models.CharField(max_length=20, unique=True)

    def __str__(self):
        return "{2:%d-%m-%Y} {0} ({1}) ".format(self.номер_накладной, self.id_поставщика, self.дата_поставки)

    class Meta:
        db_table = 'Накладные'
        # unique_together = (('id_накладной', 'дата_поставки'),)
        # unique_together = ('номер_накладной',)
        verbose_name = 'накладная'
        verbose_name_plural = 'накладные'


class ПППоНакладной(models.Model):
    id_пп_по_накладной = models.AutoField(db_column='id_ПП_по_накладной', primary_key=True)
    id_накладной = models.ForeignKey('Накладные', db_column='id_накладной', verbose_name='Накладная')
    id_пп = models.ForeignKey('ПрограммныеПродукты', db_column='id_ПП', verbose_name='Программный продукт')
    количество = models.SmallIntegerField(validators=[MinValueValidator(0, 'Убедитесь, что это значение больше нуля')])
    цена_за_еденицу = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True,
                                          validators=[MinValueValidator(0, 'Убедитесь, что это значение больше нуля')])

    def __str__(self):
        return "{0} {1}, количество {2}".format(self.id_накладной.номер_накладной, self.id_пп, self.количество)

    class Meta:
        db_table = 'ПППоНакладной'
        # strange bug - accounting.ПППоНакладной: 'unique_together' refers to the non-existent field 'id_ПП'.
        # unique_together = (('id_накладной', 'id_ПП'),)
        verbose_name = 'пограммный продукт по накладной'
        verbose_name_plural = 'программные продукты по накладной'

def validate_phone_provider(value):
    employee = Сотрудники.objects.filter(id_телефона=value)
    if employee:
        raise ValidationError('Данный номер указан у сотрудника {0}'.format(*employee))

def validate_address_provider(value):
    employee = Сотрудники.objects.filter(id_адреса=value)
    if employee:
        raise ValidationError('Данный адрес указан у сотрудника {0}'.format(*employee))

class Поставщики(models.Model):
    id_поставщика = models.AutoField(primary_key=True)
    id_адреса = models.ForeignKey('Адреса', db_column='id_адреса', verbose_name='Адрес',
                                  validators=[validate_address_provider])
    id_телефона = models.ForeignKey('Телефоны', db_column='id_телефона', verbose_name='Телефон',
                                    validators=[validate_phone_provider])
    id_типа_организации = models.ForeignKey('ТипыОрганизаций', db_column='id_типа_организации',
                                            verbose_name='Тип организации')
    другие_контактные_данные = models.TextField(blank=True, null=True)
    комментарий = models.TextField(blank=True, null=True)
    название = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.id_типа_организации.аббревиатура + ' "' + self.название + '"'

    class Meta:
        db_table = 'Поставщики'
        verbose_name = 'поставщик'
        verbose_name_plural = 'поставщики'


class ПрограммныеПродукты(models.Model):
    id_пп = models.AutoField(db_column='id_ПП', primary_key=True)
    название = models.CharField(max_length=100)
    id_типа_пп = models.ForeignKey('ТипыПП', db_column='id_типа_ПП', verbose_name='Тип программного продукта')

    def __str__(self):
        return "{0} {1}".format(self.id_типа_пп, self.название)

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'ПрограммныеПродукты'
        verbose_name = 'программный продукт'
        verbose_name_plural = 'программные продукты'


class Производители(models.Model):
    id_производителя = models.AutoField(primary_key=True)
    название = models.CharField(max_length=100)

    def __str__(self):
        return self.название

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'Производители'
        verbose_name = 'производитель'
        verbose_name_plural = 'производители'


class Рабочиеместа(models.Model):
    id_рабочего_места = models.AutoField(primary_key=True)
    id_комнаты = models.ForeignKey('Комнаты', db_column='id_комнаты', verbose_name='номер комнаты')
    номер_рабочего_места = models.CharField(max_length=3)

    def __str__(self):
        return "Км. № {0}, раб. место № {1}".format(self.id_комнаты, self.номер_рабочего_места)

    class Meta:
        db_table = 'РабочиеМеста'
        verbose_name = 'рабочее место'
        verbose_name_plural = 'рабочие места'

def validate_date_birthday(value):
    timetuple = datetime.now().timetuple()[:3]
    if value>date(timetuple[0]-14,timetuple[1], timetuple[2]):
        raise ValidationError('В соответствии со ст. 188 КЗоТ Украины не допускается использование труда '
                              'лиц не достигших 14 лет')
    elif value<date(timetuple[0]-100,timetuple[1], timetuple[2]):
        raise ValidationError('Возраст сотрудника должен быть меньше 100 лет')

def validate_phone_employee(value):
    provider = Поставщики.objects.filter(id_телефона=value)
    if provider:
        raise ValidationError('Данный номер указан у поставщика {0}'.format(*provider))

def validate_address_employee(value):
    provider = Поставщики.objects.filter(id_адреса=value)
    if provider:
        raise ValidationError('Данный адрес указан у поставщика {0}'.format(*provider))


class Сотрудники(models.Model):
    Полы = (
        ('м', 'Мужской'),
        ('ж', 'Женский'),
    )

    id_сотрудника = models.AutoField(primary_key=True)
    фамилия = models.CharField(max_length=30)
    имя = models.CharField(max_length=30)
    отчество = models.CharField(max_length=20)
    дата_рождения = models.DateField(validators=[validate_date_birthday])
    id_должности = models.ForeignKey('Должности', db_column='id_должности', verbose_name='Должность')
    id_рабочего_места = models.ForeignKey('Рабочиеместа', db_column='id_рабочего_места', verbose_name='Рабочее место')
    пол = models.CharField(max_length=1, blank=True, null=True, choices=Полы)
    id_телефона = models.ForeignKey('Телефоны', db_column='id_телефона', verbose_name='Телефон',
                                    validators=[validate_phone_employee])
    id_адреса = models.ForeignKey('Адреса', db_column='id_адреса', verbose_name='Адрес',
                                  validators=[validate_address_employee])

    def __str__(self):
        return self.фамилия + ' ' + self.имя[0] + '. ' + self.отчество[0] + '.'

    # def clean(self):
    #     cleaned_data = super(Сотрудники, self).clean()
    #     if
    #     return cleaned_data

    def save(self, *args, **kwargs):
        self.фамилия = self.фамилия[0:1].upper() + self.фамилия[1:].lower()
        self.имя = self.имя[0:1].upper() + self.имя[1:].lower()
        self.отчество = self.отчество[0:1].upper() + self.отчество[1:].lower()

        super().save(*args, **kwargs)

    class Meta:
        db_table = 'Сотрудники'
        verbose_name = 'сотрудник'
        verbose_name_plural = 'сотрудники'


class Списания(models.Model):
    id_списание = models.AutoField(primary_key=True)
    дата = models.DateField()
    id_сотрудника = models.ForeignKey('Сотрудники', db_column='id_сотрудника', verbose_name='Сотрудник')
    заголовок = models.CharField(max_length=50)

    def __str__(self):
        return "{0} {1:%d-%m-%Y}".format(self.id_сотрудника, self.дата)

    class Meta:
        db_table = 'Списания'
        verbose_name = 'списание'
        verbose_name_plural = 'списания'


class СписаннаяТехника(models.Model):
    id_списанной_техники = models.AutoField(primary_key=True)
    id_экземпляра_техники = models.ForeignKey('ЭкземплярыТехники', db_column='id_экземпляра_техники',
                                              verbose_name='Экземпляр техники')
    id_списания = models.ForeignKey('Списания', db_column='id_списания', verbose_name="Списание")
    причина = models.TextField(blank=True, null=True)

    def __str__(self):
        return "{0} {1}".format(self.id_экземпляра_техники, self.id_списания)

    class Meta:
        db_table = 'СписаннаяТехника'
        unique_together = (('id_экземпляра_техники', 'id_списания'),)
        verbose_name = 'списанная техника'
        verbose_name_plural = 'списанная техника'


class Телефоны(models.Model):
    id_телефона = models.AutoField(primary_key=True)
    телефон = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.телефон

    class Meta:
        db_table = 'Телефоны'
        verbose_name = 'телефон'
        verbose_name_plural = 'телефоны'


class ТехникаПоНакладной(models.Model):
    id_техники_по_накладной = models.AutoField(primary_key=True)
    id_накладной = models.ForeignKey('Накладные', db_column='id_накладной', verbose_name='Накладная')
    id_модели_техники = models.ForeignKey('МоделиТехники', db_column='id_модели_техники',
                                          verbose_name='Модель техники')
    количество = models.SmallIntegerField(validators=[MinValueValidator(0, 'Убедитесь, что это значение больше нуля')])
    цена_за_еденицу = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True,
                                          validators=[MinValueValidator(0, 'Убедитесь, что это значение больше нуля')])

    def __str__(self):
        return "{0} {1}, количество {2}".format(self.id_накладной.номер_накладной, self.id_модели_техники,
                                                self.количество)

    class Meta:
        db_table = 'ТехникаПоНакладной'
        unique_together = (('id_накладной', 'id_модели_техники'),)
        verbose_name = 'техника по накладной'
        verbose_name_plural = 'техника по накладной'


class ТипыОрганизаций(models.Model):
    id_типа_организации = models.AutoField(primary_key=True)
    аббревиатура = models.CharField(max_length=5, unique=True)
    название = models.CharField(max_length=70, unique=True)

    def __str__(self):
        # return self.название + ' (' + self.аббревиатура + ')'
        return self.аббревиатура

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        self.аббревиатура = self.аббревиатура.upper()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'ТипыОрганизаций'
        verbose_name = 'тип организации'
        verbose_name_plural = 'типы организаций'


class ТипыПП(models.Model):
    id_типа_пп = models.AutoField(db_column='id_типа_ПП', primary_key=True)
    название = models.CharField(max_length=80, unique=True)

    def __str__(self):
        return self.название

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'ТипыПП'
        verbose_name = 'тип программного продукта'
        verbose_name_plural = 'типы программных продуктов'


class ТипыТехники(models.Model):
    id_типа_техники = models.AutoField(primary_key=True)
    название = models.CharField(max_length=60, unique=True)

    def __str__(self):
        return self.название

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'ТипыТехники'
        verbose_name = 'тип техники'
        verbose_name_plural = 'типы техники'


class ТипыУлиц(models.Model):
    id_типа_улицы = models.AutoField(primary_key=True)
    название = models.CharField(max_length=20, unique=True)
    сокращенное_название = models.CharField(max_length=4, help_text="Без точки в конце", unique=True)

    def __str__(self):
        return "{0} ({1})".format(self.название, self.сокращенное_название)

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        self.сокращенное_название = self.сокращенное_название.lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'ТипыУлиц'
        verbose_name = 'тип улицы'
        verbose_name_plural = 'типы улиц'


def validate_count_pp(value):
    instPP = УстановленныеПП.objects.filter(id_пп_по_накладной=value).count()
    maxPoNakl = ПППоНакладной.objects.get(id_пп_по_накладной=value).количество
    if maxPoNakl <= instPP:
        raise ValidationError('Нельзя установить ПП в количестве больше купленных')


class УстановленныеПП(models.Model):
    id_установленногопп = models.AutoField(db_column='id_установленногоПП', primary_key=True)
    id_пп_по_накладной = models.ForeignKey('ПППоНакладной', db_column='id_ПП_по_накладной',
                                           verbose_name='Программный продукт по накладной',
                                           validators=[validate_count_pp])
    серийный_ключ = models.CharField(max_length=30)
    id_экземпляра_техники = models.ForeignKey('ЭкземплярыТехники', db_column='id_экземпляра_техники',
                                              verbose_name='Экземпляр техники')

    def __str__(self):
        return "{0} {1} {2}".format(self.id_пп_по_накладной, self.id_экземпляра_техники, self.серийный_ключ)

    class Meta:
        db_table = 'УстановленныеПП'
        verbose_name = 'установленный программный продукт'
        verbose_name_plural = 'установленные программные продукты'


class Характеристики(models.Model):
    id_характеристики = models.AutoField(primary_key=True)
    название = models.CharField(max_length=30, unique=True)
    id_еденицы_измерения = models.ForeignKey('ЕденицыИзмерения', db_column='id_еденицы_измерения',
                                             verbose_name='Еденицы измерения')

    def __str__(self):
        return self.название

    def save(self, *args, **kwargs):
        self.название = self.название[0:1].upper() + self.название[1:].lower()
        super().save(*args, **kwargs)

    class Meta:
        db_table = 'Характеристики'
        verbose_name = 'характеристика'
        verbose_name_plural = 'характеристики'


class ХарактеристикиМодели(models.Model):
    id_характеристики_модели = models.AutoField(primary_key=True)
    id_характеристики = models.ForeignKey('Характеристики', db_column='id_характеристики',
                                          verbose_name='название характери  стики')
    id_модели_техники = models.ForeignKey('МоделиТехники', db_column='id_модели_техники',
                                          verbose_name='название модели техники')
    значение = models.DecimalField(max_digits=10, decimal_places=2,
                                   validators=[MinValueValidator(0, 'Убедитесь, что это значение больше нуля')])

    def __str__(self):
        return '{0} {1} {2}'.format(self.id_модели_техники.название, self.id_характеристики.название, self.значение)

    class Meta:
        db_table = 'ХарактеристикиМодели'
        unique_together = (('id_характеристики', 'id_модели_техники'),)
        verbose_name = 'характеристика модели'
        verbose_name_plural = "характеристики модели"


def validate_count_ex_tech(value):
    exTech = ЭкземплярыТехники.objects.filter(id_техники_по_накладной=value).count()
    maxPoNakl = ТехникаПоНакладной.objects.get(id_техники_по_накладной=value).количество
    if maxPoNakl <= exTech:
        raise ValidationError('Нельзя оформить больше экземпляров чем куплено.')

def validate_warranty_date(value):
    print(value)
    if value<=date.today():
        print(2)
        raise ValidationError('Дата гарантии должна быть больше сегодняшней даты.')

class ЭкземплярыТехники(models.Model):
    id_экземпляра_техники = models.AutoField(primary_key=True)
    id_техники_по_накладной = models.ForeignKey('ТехникаПоНакладной', db_column='id_техники_по_накладной',
                                                verbose_name="Техника по накладной",
                                                validators=[validate_count_ex_tech])
    id_еденицы_техники = models.ForeignKey('ЕденицыТехники', db_column='id_еденицы_техники',
                                           verbose_name="Еденица техники")
    заводской_код = models.CharField(max_length=20, blank=True, null=True)
    инвентарный_номер = models.CharField(max_length=20)
    дата_гарантии = models.DateField(blank=True, null=True, validators=[validate_warranty_date])

    def __str__(self):
        return '{0} {1} {2} {3:%d-%m-%Y}'.format(self.id_техники_по_накладной.id_накладной.номер_накладной,
                                                 self.id_техники_по_накладной.id_модели_техники,
                                                 self.инвентарный_номер,
                                                 self.дата_гарантии)

    class Meta:
        db_table = 'ЭкземплярыТехники'
        verbose_name = 'экземпляр техники'
        verbose_name_plural = 'экземпляры техники'
