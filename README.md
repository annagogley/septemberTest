# septemberTest

Приложение написано с помощью SwiftUI
Навигация первых 3х экранов осуществляется при помощи TabView 

## 1й экран (NotesPage): 

На экране расположено поле ввода, кнопка сохранить и список сохраненных данных
В поле вводится любое значение, после нажатия данные сохраняются в CoreData, после чего поле ввода очищается, и список сохраненных данных динамически обновляется

При пустом значении кнопка неактивна

## 2й экран (APIPage):

Осуществлена работа с API сервисом
https://api-ninjas.com/

При каждом переходе на этот экран отображается факт дня.
Обработана ошибка отсутствия соединения и Internal server error.

## 3й экран (ThirdPage):

На экране одна кнопка 
После ее нажатия приложение переходит на 4й экран

Всё окно должен занимает только 4й экран, без возможности вернуться на предыдущие 3 экрана
На устройстве сохраняется это действие, при перезапуске приложения всегда будет открываться только 4й экран

## 4й экран (GoogleWebView):

На всё окно должен отображаться WebView c ссылкой на google.com
Осуществлена навигация при помощи свайпов 
