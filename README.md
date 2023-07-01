# MyFinance

## Pet project: Приложение для учёта доходов и расходов

![Снимок экрана 2023-07-01 в 17 00 17](https://github.com/Joker4fun/MyFinance/assets/33445216/4d871bba-34e3-4bc2-ab07-0eeddaaefad0)
 <img src="https://github.com/Joker4fun/MyFinance/assets/33445216/b3238cbe-b871-4ced-9b32-28be7fce48a7" width="249"> 
<img src="https://github.com/Joker4fun/MyFinance/assets/33445216/3e484a50-a506-4ffe-b74e-5b03a75d8432" width="249">
  
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


![Снимок экрана 2023-07-01 в 17 00 48](https://github.com/Joker4fun/MyFinance/assets/33445216/542edcc9-c6d1-4e3b-aafd-cb26941b00a9)


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
