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

    // MARK: - Views -

    private let cardImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()

    private let cardImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.nameLabelFontSize, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    private let manaCostLabel: UILabel = {
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

        contentView.clipsToBounds = true
        contentView.addSubview(cardImageContainer)
        cardImageContainer.addSubview(cardImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(manaCostLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        cardImageContainer.snp.makeConstraints { make in
            make.width.equalTo(contentView.snp.height).offset(Metrics.cardImageContainerWidthOffset)
            make.height.equalTo(contentView.snp.height).offset(Metrics.cardImageContainerHeightOffset)
            make.right.equalTo(contentView.snp.right).offset(Metrics.cardImageContainerRightOffset)
            make.centerY.equalTo(contentView.snp.centerY)
        }

        cardImage.snp.makeConstraints { make in
            make.edges.equalTo(cardImageContainer.snp.edges)
        }

        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(Metrics.nameLabelTopOffset)
            make.left.equalTo(contentView.snp.left).offset(Metrics.nameLabelLeftOffset)
        }

        manaCostLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Metrics.manaCostLabelTopOffset)
            make.left.equalTo(nameLabel.snp.left)
        }
    }
}

extension MtgTableViewCell {
    enum Metrics {
        static let cardImageContainerWidthOffset = -5
        static let cardImageContainerHeightOffset = -5
        static let cardImageContainerRightOffset = -15

        static let nameLabelFontSize: CGFloat = 17
        static let manaCostLabelFontSize: CGFloat = 14

        static let nameLabelTopOffset = 15
        static let nameLabelLeftOffset = 17
        static let manaCostLabelTopOffset = 15
    }
}
