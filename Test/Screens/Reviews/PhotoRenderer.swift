//
//  PhotoRenderer.swift
//  Test
//
//  Created by admin on 1/3/2025.
//

import UIKit

struct PhotosRendererConfig {
    let photoSize: CGSize
    let spacing: CGFloat
    let cornerRadius: CGFloat
}

// MARK: - Internal

extension PhotosRendererConfig {
    static func `default`() -> Self {
        return PhotosRendererConfig(
            photoSize: CGSize(width: 55.0, height: 66.0),
            spacing: 8.0,
            cornerRadius: 8.0
        )
    }
}

final class PhotosRenderer {

    private let config: PhotosRendererConfig

    init(config: PhotosRendererConfig) {
        self.config = config
    }

    /// Создает изображение из массива фото.
    func createPhotosImage(from photos: [UIImage]) -> UIImage? {
        guard !photos.isEmpty else { return nil }

        // Рассчитываем размер итогового изображения
        let size = CGSize(
            width: (config.photoSize.width + config.spacing) * CGFloat(photos.count) - config.spacing,
            height: config.photoSize.height
        )

        // Отрисовываем изображение
        let imageRenderer = UIGraphicsImageRenderer(size: size)
        let renderedImage = imageRenderer.image { _ in
            var origin = CGPoint.zero
            for photo in photos {
                // Ресайзим фото и применяем радиус скругления
                let resizedPhoto = photo.resize(to: config.photoSize, cornerRadius: config.cornerRadius)
                resizedPhoto.draw(in: CGRect(origin: origin, size: config.photoSize))
                origin.x += config.photoSize.width + config.spacing
            }
        }
        return renderedImage
    }
}
