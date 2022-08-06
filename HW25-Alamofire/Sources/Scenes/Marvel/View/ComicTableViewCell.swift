//
//  ComicTableViewCell.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import Foundation

import UIKit
import SnapKit

class ComicTableViewCell: UITableViewCell {

    static let identifier = "MarvelTableViewCell"

    // MARK: - Configuration -

    func configure(with comics: ComicDisplayable?) {
        comicTitleLabel.text = comics?.titleLabelText
        comicIdLabel.text = "Comics id: " + String(comics?.idLabelText ?? -1)
    }

    // MARK: - Views -

    private lazy var comicTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.comicTitleLabelFontSize, weight: .bold)
        label.numberOfLines = 0
        return label
    }()

    private lazy var comicIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.comicIdLabelFontSize)
        label.numberOfLines = 1
        return label
    }()

    //MARK: - Setting up TableViewCell -

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(comicTitleLabel)
        contentView.addSubview(comicIdLabel)
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        comicTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(Metrics.comicTitleLabelFontSize)
            make.left.equalTo(contentView.snp.left).offset(Metrics.comicTitleLabelLeftOffset)
            make.right.equalTo(contentView.snp.right).offset(Metrics.comicTitleLabelRightOffset)
        }

        comicIdLabel.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(Metrics.comicIdLabelBottomOffset)
            make.left.equalTo(comicTitleLabel.snp.left)
        }
    }
}

//MARK: - Metrics -

extension ComicTableViewCell {
    enum Metrics {
        static let comicTitleLabelFontSize: CGFloat = 14
        static let comicIdLabelFontSize: CGFloat = 12

        static let comicTitleLabelTopOffset = 15
        static let comicTitleLabelLeftOffset = 17
        static let comicTitleLabelRightOffset = -17

        static let comicIdLabelBottomOffset = -10
    }
}
