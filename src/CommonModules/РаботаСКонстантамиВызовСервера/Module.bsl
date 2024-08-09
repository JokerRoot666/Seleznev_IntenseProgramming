Функция ДанныеОрганизацииЗаполнены() Экспорт
	ГенДир_значение = Константы.ГенеральныйДиректор.Получить();
	ИНН_значение = Константы.ИНН_Организации.Получить();
	НазваниеОрганизации_значение = Константы.НазваниеОрганизации.Получить();
	
	ГенДир_заполнено = (ГенДир_значение <> Справочники.Сотрудники.ПустаяСсылка());
	ИНН_заполнено = (ИНН_значение <> 0);
	НазваниеОрганизации_заполнено = НЕ ПустаяСтрока(НазваниеОрганизации_значение);
	
	Возврат ГенДир_заполнено И ИНН_заполнено И НазваниеОрганизации_заполнено;
КонецФункции