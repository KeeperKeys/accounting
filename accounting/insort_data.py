from accounting.helpful_functions import dictfetchall
from django.db import connection


def show_tables():
    cursor = connection.cursor()
    cursor.execute("use cw")
    cursor.execute("show tables")
    print(dictfetchall(cursor))


def insert_address():
    cursor = connection.cursor()
    cursor.execute("use cw")
    cursor.execute(
        'insert into Адреса (id_адреса, адрес, id_типа_улицы) VALUES("1","Украина, Харьков, Пушкинская, 79/1, 77","1"),' +
        '("2","Украина, Харьков, Балашова, 12, 4","2"), ("3","Украина, Харьков, Горича, 11","1")')


def insert_type_street():
    cursor = connection.cursor()
    cursor.execute("use cw")
    cursor.execute(
        'insert into ТипыУлиц (id_типа_улицы, название, сокращенное_название) VALUES("1","улица","ул"),("2","проспект","пр-т"),("3","бульвар","б-р")')


insert_address()
