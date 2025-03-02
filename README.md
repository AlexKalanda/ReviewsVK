# ReviewsVK

## Описание изменений

1. Доработал ячейки до "максимальный вариант"
<div>
  <a href="https://github.com/AlexKalanda/Test_VK/blob/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-03-02%20at%2016.51.37.png">
    <img src="https://github.com/AlexKalanda/Test_VK/blob/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-03-02%20at%2016.51.37.png" alt="Фото 1" width="45%" />
  </a>
  <a href="https://github.com/AlexKalanda/Test_VK/blob/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-03-02%20at%2016.52.14.png">
    <img src="https://github.com/AlexKalanda/Test_VK/blob/main/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202025-03-02%20at%2016.52.14.png" alt="Фото 2" width="45%" />
  </a>
</div>
2. Проблему с плавностью скролинга решил с помощью очередей выполнения задач

3. По нажатию на кнопку "Показать полность..." текст раскрывается без анимации

4. В JSON добавлено свойство photo_urls. Которое хранит ссылки на фото, во ViewModel есть метод createPhotos который создает фото и передает уже в ячейку, далее в ячейки в методе configure включается в работу PhotosRenderer который отрисовывает фото с заданами значениясми. Cделал таким образом что бы не нарушать код-стайл

5. Реалезовал Pull-to-refresh

6. При первой загрузки данных отрабатывает кастомный индикатор загрузки. Реалезован через Extension для UIViewController.
