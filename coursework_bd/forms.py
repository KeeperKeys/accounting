from django import forms
from  accounting.models import Адреса


class АдресаФорм(forms.Form):
    # country = forms.CharField(max_length=50,  # verbose_name="Страна",
    #                           help_text="Ведетие название страны")
    # city = forms.CharField(max_length=50, help_text="Введите название города")
    # street = forms.CharField(max_length=50, help_text="Ведетие название улицы")
    # house = forms.CharField(max_length=10, help_text="Ввдетие номер дома")
    # apartment = forms.CharField(max_length=10, help_text="Ввдетие номер квартиры")

    class Meta:
        model = Адреса
        fields = ['id_типа_улицы']
