﻿///////////////////////////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2022, ООО 1С-Софт
// Все права защищены. Эта программа и сопроводительные материалы предоставляются 
// в соответствии с условиями лицензии Attribution 4.0 International (CC BY 4.0)
// Текст лицензии доступен по ссылке:
// https://creativecommons.org/licenses/by/4.0/legalcode
///////////////////////////////////////////////////////////////////////////////////////////////////////

#Если Сервер Или ТолстыйКлиентОбычноеПриложение Или ВнешнееСоединение Тогда

#Область ПрограммныйИнтерфейс

#Область ДляВызоваИзДругихПодсистем

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

// Смотри также ОбновлениеИнформационнойБазыПереопределяемый.ПриНастройкеНачальногоЗаполненияЭлементов
// 
// Параметры:
//  Настройки - см. ОбновлениеИнформационнойБазыПереопределяемый.ПриНастройкеНачальногоЗаполненияЭлементов.Настройки
//
Процедура ПриНастройкеНачальногоЗаполненияЭлементов(Настройки) Экспорт
	
	Настройки.ПриНачальномЗаполненииЭлемента = Ложь;
	
КонецПроцедуры

// Смотри также ОбновлениеИнформационнойБазыПереопределяемый.ПриНачальномЗаполненииЭлементов
// 
// Параметры:
//   КодыЯзыков - см. ОбновлениеИнформационнойБазыПереопределяемый.ПриНачальномЗаполненииЭлементов.КодыЯзыков
//   Элементы - см. ОбновлениеИнформационнойБазыПереопределяемый.ПриНачальномЗаполненииЭлементов.Элементы
//   ТабличныеЧасти - см. ОбновлениеИнформационнойБазыПереопределяемый.ПриНачальномЗаполненииЭлементов.ТабличныеЧасти
//
Процедура ПриНачальномЗаполненииЭлементов(КодыЯзыков, Элементы, ТабличныеЧасти) Экспорт

	Элемент = Элементы.Добавить();
	Элемент.ИмяПредопределенныхДанных = "ВсеВнешниеПользователи";
	Элемент.Наименование = НСтр("ru = 'Все внешние пользователи'", ОбщегоНазначения.КодОсновногоЯзыка());
	
	ПустыеСсылки = ПользователиСлужебныйПовтИсп.ПустыеСсылкиТиповОбъектовАвторизации();
	Для Каждого ПустаяСсылка Из ПустыеСсылки Цикл
		ТаблицаНазначение = ТабличныеЧасти.Назначение; // ТаблицаЗначений
		НоваяСтрока = ТаблицаНазначение.Добавить();
		НоваяСтрока.ТипПользователей = ПустаяСсылка;
	КонецЦикла;
	Элемент.Назначение = ТабличныеЧасти.Назначение;
	
КонецПроцедуры

#КонецОбласти


#КонецЕсли
