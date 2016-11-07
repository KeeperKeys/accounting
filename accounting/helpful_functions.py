

def dictfetchall(cursor):
    "Return all rows from a cursor as a dict"
    columns = [col[0] for col in cursor.description]
    return [
        dict(zip(columns, row))
        for row in cursor.fetchall()
        ]


# from _datetime import date
# string = '2016-10-01'
#
# res = [int(i) for i in string.split('-')]
#
# d = date(*res)
# print(d)