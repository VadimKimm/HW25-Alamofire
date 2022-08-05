//
//  MtgTableViewCell.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 03.08.2022.
//

import UIKit
import SnapKit

class MtgTableViewCell: UITableViewCell {

    static let identifier = "MtgTableViewCell"

    // MARK: - Configuration -

    func configure(with card: Card?) {
        cardNameLabel.text = card?.nameLabelText
        cardTypeLabel.text = card?.typeLabelText
    }

    // MARK: - Views -

    private lazy var cardNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.nameLabelFontSize, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    private lazy var cardTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.manaCostLabelFontSize)
        label.numberOfLines = 1
        return label
    }()

    //MARK: - Setting up TableViewCell -

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(cardNameLabel)
        contentView.addSubview(cardTypeLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        cardNameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(Metrics.nameLabelTopOffset)
            make.left.equalTo(contentView.snp.left).offset(Metrics.nameLabelLeftOffset)
        }

        cardTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNameLabel.snp.bottom).offset(Metrics.cardTypeLabelTopOffset)
            make.left.equalTo(cardNameLabel.snp.left)
        }
    }
}

//MARK: - Metrics -

extension MtgTableViewCell {
    enum Metrics {
        static let nameLabelFontSize: CGFloat = 17
        static let manaCostLabelFontSize: CGFloat = 14

        static let nameLabelTopOffset = 15
        static let nameLabelLeftOffset = 17
        static let cardTypeLabelTopOffset = 10
    }
}
