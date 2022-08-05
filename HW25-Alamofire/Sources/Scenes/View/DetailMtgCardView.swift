//
//  DetailMtgView.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import UIKit

class DetailMtgCardView: UIView {

    // MARK: - Configuration -

    func configure(with card: Displayable?) {
        cardNameLabel.text = card?.nameLabelText
        cardTypeLabel.text = card?.typeLabelText
        descriptionLabel.text = card?.descriptionLabelText
        rarityTypeLabel.text = card?.rarityLabelText
        manaCostLabel.text = card?.manaCostLabelText
    }

    // MARK: - View -

    private let cardNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.nameLabelFontSize, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    private let cardTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 0
        return label
    }()

    private let rarityTypeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 0
        return label
    }()

    private let manaCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    // MARK: - Initial -

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupHierarchy()
        setupLayout()
        backgroundColor = .white
    }

    // MARK: - Settings -

    private func setupHierarchy() {
        addSubview(cardNameLabel)
        addSubview(cardTypeLabel)
        addSubview(descriptionLabel)
        addSubview(rarityTypeLabel)
        addSubview(manaCostLabel)
    }

    private func setupLayout() {
        cardNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metrics.primaryTopOffset)
        }

        cardTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNameLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(cardTypeLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        rarityTypeLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        manaCostLabel.snp.makeConstraints { make in
            make.top.equalTo(rarityTypeLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }
    }
}

extension DetailMtgCardView {
    enum Metrics {
        static let nameLabelFontSize: CGFloat = 22
        static let primaryFontSize: CGFloat = 14

        static let primaryTopOffset = 15
        static let primaryLeftOffset = 15
        static let primaryRightOffset = -20
    }
}

