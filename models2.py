# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin sqlcustom [app_label]'
# into your database.
from __future__ import unicode_literals

from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=80)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey('AuthPermission')

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group_id', 'permission_id'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType')
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type_id', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=30)
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user_id', 'group_id'),)


class AuthUserUserPermissions(models.Model):
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user_id', 'permission_id'),)


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.SmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', blank=True, null=True)
    user = models.ForeignKey(AuthUser)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class (models.Model):
    id_адреса = models.SmallIntegerField(primary_key=True)
    адрес = models.CharField(max_length=200)
    id_типа_улицы = models.ForeignKey(db_column='id_типа_улицы')

    class Meta:
        managed = False
        db_table = 'Адреса'


class (models.Model):
    id_должности = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=40, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Должности'


class (models.Model):
    id_еденицы_измерения = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=30, blank=True, null=True)
    сокращенное_название = models.CharField(max_length=10, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ЕденицыИзмерения'


class (models.Model):
    id_еденицы_техники = models.AutoField(primary_key=True)
    id_комплекта = models.ForeignKey(db_column='id_комплекта')
    id_названия_еденицы_техники = models.ForeignKey(db_column='id_названия_еденицы_техники', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ЕденицыТехники'


class (models.Model):
    id_комнаты = models.SmallIntegerField(primary_key=True)
    номер_комнаты = models.CharField(max_length=5)

    class Meta:
        managed = False
        db_table = 'Комнаты'


class (models.Model):
    id_комплекта = models.SmallIntegerField(primary_key=True)
    id_рабочего_места = models.ForeignKey(db_column='id_рабочего_места')
    id_названия_комплекта = models.ForeignKey(db_column='id_названия_комплекта', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'Комплекты'


class (models.Model):
    id_модели_техники = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=100)
    id_производителя = models.ForeignKey(db_column='id_производителя')
    id_типа_техники = models.ForeignKey(db_column='id_типа_техники')

    class Meta:
        managed = False
        db_table = 'МоделиТехники'


class (models.Model):
    id_названия_еденицы_техники = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=40, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'НазванияЕденицыТехники'


class (models.Model):
    id_названия_комплекта = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=40, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'НазванияКомплекта'


class (models.Model):
    id_накладной = models.SmallIntegerField()
    дата_поставки = models.DateField()
    id_поставщика = models.ForeignKey(db_column='id_поставщика')

    class Meta:
        managed = False
        db_table = 'Накладные'
        unique_together = (('id_накладной', 'дата_поставки'),)


class (models.Model):
    id_накладной = models.ForeignKey(db_column='id_накладной')
    id_пп = models.ForeignKey(db_column='id_ПП')  # Field name made lowercase.
    цена_за_еденицу = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)
    количество = models.SmallIntegerField()

    class Meta:
        managed = False
        db_table = 'ПППоНакладной'
        unique_together = (('id_накладной', 'id_ПП'),)


class (models.Model):
    id_поставщика = models.SmallIntegerField(primary_key=True)
    id_адреса = models.ForeignKey(db_column='id_адреса')
    id_телефона = models.ForeignKey(db_column='id_телефона')
    другие_контактные_данные = models.TextField(blank=True, null=True)
    комментарий = models.TextField(blank=True, null=True)
    название = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'Поставщики'


class (models.Model):
    id_пп = models.SmallIntegerField(db_column='id_ПП', primary_key=True)  # Field name made lowercase.
    название = models.CharField(max_length=100)
    id_типа_пп = models.ForeignKey(db_column='id_типа_ПП')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ПрограммныеПродукты'


class (models.Model):
    id_производителя = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'Производители'


class (models.Model):
    id_рабочего_места = models.SmallIntegerField(primary_key=True)
    id_комнаты = models.ForeignKey(db_column='id_комнаты')
    номер_рабочего_места = models.CharField(max_length=3)

    class Meta:
        managed = False
        db_table = 'РабочиеМеста'


class (models.Model):
    id_сотрудника = models.SmallIntegerField(primary_key=True)
    фамилия = models.CharField(max_length=30)
    имя = models.CharField(max_length=30)
    отчество = models.CharField(max_length=20)
    дата_рождения = models.DateField(blank=True, null=True)
    id_должности = models.ForeignKey(db_column='id_должности')
    id_рабочего_места = models.ForeignKey(db_column='id_рабочего_места')
    пол = models.CharField(max_length=1, blank=True, null=True)
    id_телефона = models.ForeignKey(db_column='id_телефона')
    id_адреса = models.ForeignKey(db_column='id_адреса')

    class Meta:
        managed = False
        db_table = 'Сотрудники'


class (models.Model):
    id_списание = models.SmallIntegerField(primary_key=True)
    дата = models.DateField()
    id_сотрудника = models.ForeignKey(db_column='id_сотрудника')

    class Meta:
        managed = False
        db_table = 'Списания'


class (models.Model):
    id_экземпляра_техники = models.ForeignKey(db_column='id_экземпляра_техники')
    id_списания = models.ForeignKey(db_column='id_списания')
    причина = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'СписаннаяТехника'
        unique_together = (('id_экземпляра_техники', 'id_списания'),)


class (models.Model):
    id_телефона = models.SmallIntegerField(primary_key=True)
    телефон = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'Телефоны'


class (models.Model):
    id_накладной = models.ForeignKey(db_column='id_накладной')
    id_модели_техники = models.ForeignKey(db_column='id_модели_техники')
    количество = models.SmallIntegerField()
    цена_за_еденицу = models.DecimalField(max_digits=6, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ТехникаПоНакладной'
        unique_together = (('id_накладной', 'id_модели_техники'),)


class (models.Model):
    id_типа_пп = models.SmallIntegerField(db_column='id_типа_ПП', primary_key=True)  # Field name made lowercase.
    название = models.CharField(max_length=80, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ТипыПП'


class (models.Model):
    id_типа_техники = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=60)

    class Meta:
        managed = False
        db_table = 'ТипыТехники'


class (models.Model):
    id_типа_улицы = models.SmallIntegerField(primary_key=True)
    название = models.CharField(max_length=20)
    сокращенное_название = models.CharField(max_length=4)

    class Meta:
        managed = False
        db_table = 'ТипыУлиц'


class (models.Model):
    id_установленногопп = models.SmallIntegerField(db_column='id_установленногоПП', primary_key=True)  # Field name made lowercase.
    id_накладной = models.ForeignKey(db_column='id_накладной')
    id_пп = models.ForeignKey(db_column='id_ПП')  # Field name made lowercase.
    серийный_ключ = models.CharField(max_length=30)
    id_экземпляра_техники = models.ForeignKey(db_column='id_экземпляра_техники')

    class Meta:
        managed = False
        db_table = 'УстановленныеПП'


class (models.Model):
    id_характеристики = models.SmallIntegerField(primary_key=True)
    id_еденицы_измерения = models.ForeignKey(db_column='id_еденицы_измерения')
    название = models.CharField(max_length=30)

    class Meta:
        managed = False
        db_table = 'Характеристики'


class (models.Model):
    id_характеристики = models.ForeignKey(db_column='id_характеристики')
    id_модели_техники = models.ForeignKey(db_column='id_модели_техники')
    значение = models.DecimalField(max_digits=10, decimal_places=4, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ХарактеристикиМодели'
        unique_together = (('id_характеристики', 'id_модели_техники'),)


class (models.Model):
    id_экземпляра_техники = models.IntegerField(primary_key=True)
    id_еденицы_техники = models.ForeignKey(db_column='id_еденицы_техники')
    заводской_код = models.CharField(max_length=20, blank=True, null=True)
    инвентарный_номер = models.CharField(max_length=20)
    id_накладной = models.ForeignKey(db_column='id_накладной')
    id_модели_техники = models.ForeignKey(db_column='id_модели_техники')
    дата_гарантии = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'ЭкземплярыТехники'
