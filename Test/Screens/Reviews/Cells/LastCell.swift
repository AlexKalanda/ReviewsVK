//
//  LastCell.swift
//  Test
//
//  Created by admin on 28/2/2025.
//

import UIKit

fileprivate typealias Config = LastCellConfig
fileprivate typealias Layout = LastCellLayout

struct LastCellConfig {
    
    /// Идентификатор для переиспользования ячейки.
    static let reuseId = String(describing: LastCellConfig.self)
    
    /// Текст отзыва.
    var text: String
    
    /// Объект, хранящий посчитанные фреймы для ячейки отзыва.
    fileprivate let layout = LastCellLayout()
}

extension LastCellConfig: TableCellConfig {
    
    func update(cell: UITableViewCell) {
        guard let cell = cell as? LastCell else { return }
        cell.countTextLabel.text = "\(text) отзывов"
        cell.config = self
    }
    
    func height(with size: CGSize) -> CGFloat {
        layout.height(config: self, maxWidth: size.width)
    }

}

final class LastCell: UITableViewCell {
    
    fileprivate var config: Config?

    fileprivate let countTextLabel = UILabel()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCell()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let layout = config?.layout else { return }
        countTextLabel.frame = layout.textLabelFrame
    }

}

// MARK: - Private

private extension LastCell {
    
    func setupCell() {
        setupCountTextLabel()
    }
    
    func setupCountTextLabel() {
        contentView.addSubview(countTextLabel)
        countTextLabel.font = .reviewCount
        countTextLabel.textColor = .reviewCount
        countTextLabel.textAlignment = .center
    }
    
}


// MARK: -Layout

private final class LastCellLayout {
    // MARK: - Отступы
    /// Отступы от краёв ячейки до её содержимого.
    private let insets = UIEdgeInsets(top: 9.0, left: 12.0, bottom: 12.0, right: 12.0)
        
    // MARK: - Фрейм
    private(set) var textLabelFrame = CGRect.zero
    
    /// Возвращает высоту ячейки с данной конфигурацией config и ограничением по ширине maxWidth.
    func height(config: Config, maxWidth: CGFloat) -> CGFloat {
        // Ширина текстового блока равна ширине экрана за вычетом отступов
        let textWidth = maxWidth - insets.left - insets.right
        
        // Рассчитываем размер текста
        let textSize = (config.text as NSString).size(
            withAttributes: [.font: UIFont.reviewCount]
        )
        
        // Центрируем текст по горизонтали
        let textX = insets.left
        let textY = insets.top
        
        // Устанавливаем ширину текстового блока равной textWidth
        textLabelFrame = CGRect(
            origin: CGPoint(x: textX, y: textY),
            size: CGSize(width: textWidth, height: textSize.height)
        )
        
        return textY + textSize.height + insets.bottom
    }
}
