# MyFinance

## Pet project: Приложение для учёта доходов и расходов

![Preview](preview.png "Preview")

## Основной стек технологий :
- SwiftUI
- Core Data
- Charts

## Особенности:
- Все данные хранятся в базе данных - *BalanceEntity* на мобильном устройстве,
- Возможность построения графика расходов и\или доходов по времени,
- Возможность создать категорию расходов 
- Отдельные графикии для разных категорий в разрезе времени: неделя\месяц\квартал\все время

## Описание приложения:

![Preview](preview-3.png "Preview")

**Основные сущности**
```
- Основные сущности это: Доходы, Графики и Расходы.
- Есть возможность построения графика платежей
- Есть статистика в виде графиков по всем движениям средств
```

**Доходы**
```
Главный экран приложения.
В верхнем правом углу отображается строка с "Балансом всех средств"
В нижней части экрана распологается кнопка "Добавить доход", по нажаматию на которую - можно увеличить текущий баланс средств
```

**Графики**
```
Категория необходима для структурирования транзакций, а также для наглядной статистики по расходам и доходам. 
```

**Расходы**
```
Экран со списком "Категорий рассходов" (Дом, Машина, ЖКХ), есть возможностью добавить новую категории расходов, удалить категорию и просмотреть записи по каждой из них.
```

**Категория расходов**
```
Экран со списком внесенных затрат. 
Пример: Категория "Дом", в ней список трат - 
- Шторы 25.10.22 350 Р
- Чашка 23.10.22 150 Р
- Кровать 21.10.22 22999 Р

Есть возможность добавить новый расход, удалить старый и просмотреть все статистику трат на графике.

```
