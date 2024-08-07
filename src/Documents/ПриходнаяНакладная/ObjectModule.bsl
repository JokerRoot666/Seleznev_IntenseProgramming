Процедура ОбработкаЗаполнения(ДанныеЗаполнения,СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	//Данный фрагмент построен конструктором.
	//При повторном использовании конструктора, внесенные вручную данные будут утеряны!

	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.ЗаказПоставщику") Тогда
		// Заполнение шапки
		НаменованиеПоставщика = ДанныеЗаполнения.НаменованиеПоставщика;
		Договор = ДанныеЗаполнения.Договор;
		ИтоговаяСумма = ДанныеЗаполнения.ИтоговаяСумма;
		Основание = ДанныеЗаполнения.Ссылка;

		Для Каждого ТекСтрокаМатериалы из ДанныеЗаполнения.Материалы Цикл
			НоваяСтрока = Материалы.Добавить();
			НоваяСтрока.Материал = ТекСтрокаМатериалы.Материал;
			НоваяСтрока.Количество = ТекСтрокаМатериалы.Количество;
			НоваяСтрока.Цена = ТекСтрокаМатериалы.Цена;
			НоваяСтрока.Сумма = ТекСтрокаМатериалы.Сумма;
		КонецЦикла;

		Для Каждого ТекСтрокаРасходныеМатериалы из ДанныеЗаполнения.РасходныеМатериалы Цикл
			НоваяСтрока = РасходныеМатериалы.Добавить();
			НоваяСтрока.Расходник = ТекСтрокаРасходныеМатериалы.Расходник;
			НоваяСтрока.Количество = ТекСтрокаРасходныеМатериалы.Количество;
			НоваяСтрока.Цена = ТекСтрокаРасходныеМатериалы.Цена;
			НоваяСтрока.Сумма = ТекСтрокаРасходныеМатериалы.Сумма;
		КонецЦикла;
	КонецЕсли;

	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ

КонецПроцедуры
#Область ОбработчикиСобытий
Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	ЭтотОбъект.ИтоговаяСумма = ЭтотОбъект.Материалы.Итог("Сумма") + ЭтотОбъект.РасходныеМатериалы.Итог("Сумма");
КонецПроцедуры
#КонецОбласти