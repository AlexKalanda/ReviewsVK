/// Модель отзыва.
struct Review: Decodable {
    /// Текст отзыва.
    let text: String
    /// Время создания отзыва.
    let created: String
    /// Имя
    let firstName: String
    /// Фамилия
    let lastName: String
    ///  Рейтинг
    let rating: Int
    /// Фото
    let photoUrls: [String]
}
