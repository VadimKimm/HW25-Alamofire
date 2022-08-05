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
        nameLabel.text = card?.nameLabelText
        typeLabel.text = card?.typeLabelText
        descriptionLabel.text = card?.descriptionLabelText
        rarityLabel.text = card?.rarityLabelText
        manaCostLabel.text = card?.manaCostLabelText
        setNameLabel.text = card?.setNameLabelText
        powerLabel.text = card?.powerLabelText
        artistLabel.text = card?.artistLabelText
        legalitiesLabel.text = card?.legalitieslabelText
    }

    // MARK: - View -

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.nameLabelFontSize, weight: .bold)
        label.numberOfLines = 1
        return label
    }()

    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 0
        return label
    }()

    private lazy var rarityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private lazy var setNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private var powerLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private lazy var artistLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private lazy var manaCostLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private lazy var legalitiesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 0
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
        addSubview(nameLabel)
        addSubview(typeLabel)
        addSubview(descriptionLabel)
        addSubview(rarityLabel)
        addSubview(setNameLabel)
        addSubview(powerLabel)
        addSubview(artistLabel)
        addSubview(manaCostLabel)
        addSubview(legalitiesLabel)
    }

    private func setupLayout() {
        nameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metrics.primaryTopOffset)
        }

        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        typeLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        manaCostLabel.snp.makeConstraints { make in
            make.top.equalTo(typeLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        rarityLabel.snp.makeConstraints { make in
            make.top.equalTo(manaCostLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        powerLabel.snp.makeConstraints { make in
            make.top.equalTo(rarityLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        setNameLabel.snp.makeConstraints { make in
            make.top.equalTo(powerLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        artistLabel.snp.makeConstraints { make in
            make.top.equalTo(setNameLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
        }

        legalitiesLabel.snp.makeConstraints { make in
            make.top.equalTo(artistLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
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

