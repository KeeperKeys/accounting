from django import forms
from accounting.models import Адреса, Телефоны, Характеристики, ХарактеристикиМодели


class АдресаФорм(forms.ModelForm):
    country = forms.CharField(max_length=50, help_text="Введите название страны", label='Страна')
    city = forms.CharField(max_length=50, help_text="Введите название города", label='Город')
    street = forms.CharField(max_length=50, help_text="Введете название улицы", label='Улица')
    house = forms.CharField(max_length=10, help_text="Введите номер дома", label='Дом')
    apartment = forms.CharField(max_length=10, help_text="Введите номер квартиры", label='Квартира')

    def __init__(self, *args, **kwargs):
        super(АдресаФорм, self).__init__(*args, **kwargs)
        if self.instance.адрес:
            self.initial['country'] = self.instance.адрес.split(',')[0]
            self.initial['city'] = self.instance.адрес.split(',')[1][1:]
            self.initial['street'] = self.instance.адрес.split(',')[2][1:]
            self.initial['house'] = self.instance.адрес.split(',')[3][1:]
            self.initial['apartment'] = self.instance.адрес.split(',')[4][1:] \
                if (len(self.instance.адрес.split(',')) > 4) else ""

    def save(self, commit=True):
        instance = super(АдресаФорм, self).save(commit=False)
        instance.адрес = ", ".join((self.data['country'],
                                    self.data['city'],
                                    self.data['street'],
                                    self.data['house'],
                                    self.data['apartment']))
        if commit:
            instance.save()
        return instance

    class Meta:
        model = Адреса
        fields = ('country', 'city', 'id_типа_улицы', 'street', 'house', 'apartment')
        labels = {
            'id_типа_улицы': 'Тип улицы',
        }


class ТелефоныФорм(forms.ModelForm):
    country_code = forms.CharField(max_length=6, help_text="Введите код страны", label='Код страны')
    reg_oper_code = forms.CharField(max_length=5, help_text="Введите код региона/оператора",
                                    label='Код региона/оператора')
    phone = forms.CharField(max_length=9, help_text="Введете номер телефона", label='Телефон')

    def __init__(self, *args, **kwargs):
        super(ТелефоныФорм, self).__init__(*args, **kwargs)
        if self.instance.телефон:
            self.initial['country_code'] = self.instance.телефон.split('(')[0]
            self.initial['reg_oper_code'] = self.instance.телефон.split('(')[1].split(')')[0]
            self.initial['phone'] = self.instance.телефон.split(')')[1]

    def save(self, commit=True):
        instance = super(ТелефоныФорм, self).save(commit=False)
        instance.телефон = self.data['country_code'] + '(' + self.data['reg_oper_code'] + ')' + self.data['phone']
        if commit:
            instance.save()
        return instance

    class Meta:
        model = Телефоны
        fields = ('country_code', 'reg_oper_code', 'phone')

        # class Поставщики


        # class МоделиТехникиФорм(forms.ModelForm):
        #     mm = forms.ModelMultipleChoiceField(
        #         queryset=Характеристики.objects.all(),
        #         widget=FilteredSelectMultiple(_('ss'), False, attrs={'rows':'10'}))

        # class ПоставщикиФорм
