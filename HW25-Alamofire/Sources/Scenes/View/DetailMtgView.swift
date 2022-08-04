//
//  DetailMtgView.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import UIKit

class DetailMtgView: UIView {

    // MARK: - Configuration -

    func configure(with model: Displayable?) {
        cardNameLabel.text = model?.cardNameLabelText
        manaCostLabel.text = model?.manaCostLabelText
    }

    // MARK: - View -

    private let cardNameLabel: UILabel = {
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
        addSubview(manaCostLabel)
    }

    private func setupLayout() {
        cardNameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self.snp.centerX)
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metrics.cardNameLabelTopOffset)
        }

        manaCostLabel.snp.makeConstraints { make in
            make.top.equalTo(cardNameLabel.snp.bottom).offset(20)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.manaCostLabelTopOffset)
        }
    }
}

extension DetailMtgView {
    enum Metrics {
        static let nameLabelFontSize: CGFloat = 22
        static let manaCostLabelFontSize: CGFloat = 14

        static let cardNameLabelTopOffset = 15
        static let manaCostLabelTopOffset = 15
    }
}

