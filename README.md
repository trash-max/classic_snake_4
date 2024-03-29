
![GitHub last commit](https://img.shields.io/github/last-commit/trash-max/classic_snake_4)

# "Змейка" для Android
Реализация варианта классической игры "Змейка" для Android, на игровом движке [Godot](https://github.com/godotengine/godot)

Скачать:

<a href='https://play.google.com/store/apps/details?id=org.godotengine.classicsnake4&pcampaignid=pcampaignidMKT-Other-global-all-co-prtnr-py-PartBadge-Mar2515-1'><img alt='Get it on Google Play' src='https://play.google.com/intl/en_us/badges/static/images/badges/en_badge_web_generic.png' width="256"/></a>


Девлог о создании:
[Playlist YouTube](https://youtube.com/playlist?list=PLJn3nbk2RjwTy6ARA4ZfKOphTGhD8gwHb)






### Список серий


#### 00 Часть. Обзорная.
Минимальный функционал игры готов, змейка движется, собирает генерированную еду, отращивает хвост и сталкивается со стенами.
Но самое главное, игра уже компилируется в AAB (Android App Bundle) и опубликована в Google Play Market
 
[Смотреть на YouTube](https://youtu.be/_y_LxHTPBRQ)



#### 01 Часть. Змейка для Android.
 - Создание нового проекта Godot
 - Основа игровой сцены
 - Основа (голова) нашей змеи
 - Установка основных таймеров и сегментов
 - Первое движение нашей змеи
 
[Смотреть на YouTube](https://youtu.be/De6qGwkY7Eo)



#### 02 Часть. Змейка для Android.
 - Закладываем основы движения змеи
 - Метод Relative для обработки выбора направления движения


#### 03 Часть. Змейка для Android.
Скрипт в шестьдесят срок :) Все серьезно!
Создаем функцию, которая генерирует блоки стены и расставляет их по границам игрового поля.


#### 04 Часть. Змейка для Android.
Учим змейку сталкиваться со стенами.
Добавляем в каждый элемент стены поле для регистрации столкновения, настраиваем слои, передаем согнал о столкновении в управляющий процессом скрипт.


#### 05 Часть. Змейка для Android. Еда.
Вероятно это яблоки, по крайнем мере мне всегда так думалось :)
Создадим еду для нашей змеи и основы функции для размещения ее на игровом поле случайным образом.


#### 06 Часть. Сигналы.
Новый способ регистрации сигналов Godot 4 (Alfa, правда). Способы из 3 ветки точно не работают.
В общем, генерируем сигналы нашему управляющему скрипту о том, что змея врезалась в препятствие или подобрала яблоко. (Это же яблоко?)


#### 07 Часть. Call Deffered.
Работа над ошибками из предыдущей серии. Использование метода call_deffered() для корректного помещения еды (яблок?) на игровое поле.


#### 08 Часть. Хвост.
Делаем хвост для нашей змеи. Учим змею отращивать его при съедании яблок, и регистрировать столкновения с ним. Хвост, же, просто движется за змеей.


#### 09 Часть. GUI.
Делаем графическое меню для нашей игры.
Стартовый экран, три основные кнопки:
- Старт
- Настройки
- Выход

Ну и несколько полей для отображения игровой информации.
Добавляем в основой теме шрифт на другой.


#### 10 Часть. GUI Функционал
Добавляем функционала в графическое меню.  Пишем функции запуска игры и выхода при нажатии соответствующих кнопок.

Eng:
Adding functionality to the graphical menu. We write the functions of starting the game and exiting when the corresponding buttons are pressed.

[Смотреть на YouTube](https://youtu.be/sFXFtuPjUfc)


#### 11 Часть. Установка Android Studio и Java
Установка в Ubuntu необходимых компонентов для сборки игры на движке Godot 4 в apk и aab:

- Android Studio 
- Android SDK
- Android SDK CLI
- CMake
- NDK
- JAVA 11 (jre и jdk)
- Godot Export templates (Шаблоны экспорта)

Eng: 
Installing the required components in Ubuntu to build a game on the Godot 4 engine in APK or AAB

[Смотреть на YouTube](https://youtu.be/v9bVNiKF63U)


#### 12 Часть. Экспорт игры в APK
Экспортирование игры в APK файл.
- Создание пары отлажочных ключей в java keystore
- Экспорт в режиме отладки подписанной версии игры в APK файл
- Запуск приложения в эмуляторе Android Studio
- Запуск приложения на реальном телефоне. (Nokia, вроде бы...)

Eng:
Export game to APK from Godot 4

[Смотреть на YouTube](https://youtu.be/pnonAjVaV94)


#### 13 Часть. Экспорт приложения в AAB
Экспорт в Android App Bundle (AAB)
- Генерация пары ключей для подписи AAB файла для загрузки в Play Market
- Краткие настройки экспорта игры из Godot 4 (alfa 6)
- Обзор графических инструментов для работы с Java Keytool в Windows и Linux

[Создание ключей для подписи Anroid приложений в Godot](https://trash-max.github.io/howto/keystore/)

Eng:
Export to Android App Bundle (AAB)
- Generation of a key pair for signing an AAB file for uploading to the Play Market
- Brief settings for exporting the game from Godot 4
- Overview of graphical tools for working with Java Keytool on Windows and Linux

[Смотреть на YouTube](https://youtu.be/id9Qrt_izYg)


#### 14 Часть. Git и GitHub.
Делаем новый Git для нашего проекта и заливаем его на GitHub.
(Ну и все такое, инициализация там, ветки всякие, опенсорс, коммиты, пушы и т.д.)

Eng:
Initialize a new Git for the project and upload it to GitHub.
(And all that, initialization there, different branches, open source, commits, push, etc.)

[Смотреть на YouTube](https://youtu.be/uavbHZyAGcI)


#### 15 Часть. Заливаем в Play Market
Загружаем первый выпуск игры в Play Market для внутреннего тестирования.

Eng:
Uploading the first release of the game to the Play Market for internal testing.


...

#### 22 Часть. Выбор сегментов стены
Организация случайного выбора сегментов стены.
[Смотреть на YouTube](https://youtu.be/ZwiWE2KC7EY)


#### 23, наверное, самая скучная часть. Случайный выбор методом копипасты.
Добавляю рандом в выбор элементов еды, плиток пола, и змеиного хвоста методом лютой копипасты.

Eng:
Implement randomly selecting food, floor, and snake tails using copy-paste methods
[Смотреть на YouTube](https://youtu.be/7JEIKojQ32A)


#### 24 Часть. Новый генератор яблок.
Теперь яблоки появляются только на пустых плитках пола.

Перед каждой генерацией создается список из актуальный пустых тайлов пола, который из которого случайным образом выбирается одна,куда и помещается экземпляр яблока.

eng:
A new food generator. 
Now apples are created only on empty floor tiles.

[Смотреть на YouTube](https://youtu.be/HSli5LNO4hc)


#### 25 Часть. Игровой счет.
Все просто - подсчет очков игрока и их отображение на экране.

Использование новой функции из Godot 4 - "Доступ к уникальному имени сцены", очень упростил реализацию и отслеживание постоянных ссылок на элементы меню.

eng:
It's simple - counting the player's points and displaying them on the screen.

Using a new feature from Godot 4 - "Scene Unique Names", really simplified the implementation and tracking of permanent links to menu items.

[Смотреть на YouTube](https://youtu.be/IqA2eokE3M4)


#### 26 Часть. Пауза.
Все просто - делаю паузу в игре.
Небольшой бонус: #yield больше не используется в Godot 4, теперь #await и новый синтакс.

It's simple - I'm implementing a pause in the game.
A small bonus: yield is no longer used in Godot 4, now you need to use "await" with the new syntax

[Смотреть на YouTube](https://youtu.be/MweE6n5qY-I)


#### 27 Часть. Центр.
Улучшаю "костыль" по расчету центр для snake pit.
(Еще по мелочи подправил меню и дополнил перевод).

[Смотреть на YouTube](https://youtu.be/0IiE9WL4M7w)


#### 28 Часть. Звук.
Добавил к игре немного звуковых эффектов, а именно:
- Фоновая музыка на уровне
- Звук нажатия на кнопку
- Звук съедаемого змеей яблока
(Используется стандартный AudioStreamPlayer.)

Added music and sound effects to the game:
- Background music on the level
- The sound of pressing the button
- The sound of an apple being eaten by a snake
(The standard Audio Stream Player is used.)


#### 29 Часть. Меню настроек.
Добавлено меню настроек с опциями включения и отключения музыки и звуковых эффектов.

#### 30 Часть. Сохраняем настройки.
Сохраняем и загружаем настройки игры в файл конфигурации в любой ОС при помощи класса Godot -  ConfigFile

