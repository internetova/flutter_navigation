# flutter_navigation PageView

Навигация с помощью PageView и PageStorage.

1. Потребуется PageController для управления прокруткой
2. В BottomNavigationBar дополнительный метод для передачи в PageController текущего индекса страницы
3. PageStorage для сохранения состояния виджета

PageStorage - это виджет Flutter, который предоставляет способ сохранения и восстановления состояния между переходами 
между страницами в виджете PageView или аналогичных виджетах. Это позволяет вам сохранять данные и состояние 
виджетов на каждой странице, даже когда пользователь переключается между ними.

Когда вы используете PageView для создания множества страниц, PageStorage может использоваться для:

- Сохранения данных на каждой странице, например, информации введенной пользователем.
- Сохранения состояния виджетов, таких как скролл, выбор элементов и других параметров.
- Поддержания состояния виджетов между переключениями страниц для создания более плавного пользовательского опыта.

PageStorage применяется как обертка для виджетов, которые вы хотите сохранить. Он имеет один обязательный параметр:

bucket: Уникальный ключ, который идентифицирует место для сохранения состояния этого виджета. Обычно, для каждой страницы PageView вы используете уникальный ключ.



## Полезные ссылки

- [https://api.flutter.dev/flutter/widgets/PageStorage-class.html](https://api.flutter.dev/flutter/widgets/PageStorage-class.html)
- [https://api.flutter.dev/flutter/widgets/PageStorageKey-class.html](https://api.flutter.dev/flutter/widgets/PageStorageKey-class.html)
- [https://api.flutter.dev/flutter/widgets/PageStorageBucket-class.html](https://api.flutter.dev/flutter/widgets/PageStorageBucket-class.html)
