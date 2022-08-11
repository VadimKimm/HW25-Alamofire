//
//  DetailComicView.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import UIKit

class DetailComicView: UIScrollView {

    // MARK: - Configuration -

    func configure(with comic: ComicDisplayable?) {
        comicTitleLabel.text = comic?.titleLabelText
        comicIdLabel.text = comic?.idLabelText
        comicCreatorsLabel.text = comic?.creatorsLabelText
        comicDescriptionLabel.text = comic?.descriptionLabelText

        let queue = DispatchQueue(label: "myQueue", qos: .userInteractive)
        queue.async {
            guard let imagePath = comic?.imageUrl,
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL)
            else { return }

            DispatchQueue.main.async {
                self.comicImage.image = UIImage(data: imageData)
            }
        }
    }

    // MARK: - View -

    private lazy var parentView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var comicTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.comicTitleLabelFontSize, weight: .bold)
        label.numberOfLines = 0
        return label
    }()

    private var comicImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "icloud.and.arrow.down")
        return image
    }()

    private lazy var comicImageContainer: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.clipsToBounds = true
        return view
    }()

    private lazy var comicIdLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 1
        return label
    }()

    private lazy var comicCreatorsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: Metrics.primaryFontSize)
        label.numberOfLines = 0
        return label
    }()

    private lazy var comicDescriptionLabel: UILabel = {
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
        setupView()
    }

    // MARK: - Settings -

    private func setupHierarchy() {
        let parentViewSubviews = [
            comicTitleLabel,
            comicImageContainer,
            comicImage,
            comicIdLabel,
            comicCreatorsLabel,
            comicDescriptionLabel
        ]

        addSubview(parentView)
        parentViewSubviews.forEach { parentView.addSubview($0) }
//        parentViewSubviews.map { parentView.addSubview($0) }
    }

    private func setupLayout() {
        parentView.snp.makeConstraints { make in
            make.edges.equalTo(self.snp.edges)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).offset(Metrics.parentViewPortraitHeightOffset)
        }

        comicTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(parentView.safeAreaLayoutGuide.snp.top).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        comicImageContainer.snp.makeConstraints { make in
            make.top.equalTo(comicTitleLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.centerX.equalTo(parentView.snp.centerX)
            make.height.equalTo(400)
            make.width.equalTo(300)
        }

        comicImage.snp.makeConstraints { make in
            make.edges.equalTo(comicImageContainer.snp.edges)
        }

        comicIdLabel.snp.makeConstraints { make in
            make.top.equalTo(comicImageContainer.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        comicCreatorsLabel.snp.makeConstraints { make in
            make.top.equalTo(comicIdLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }

        comicDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(comicCreatorsLabel.snp.bottom).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(Metrics.primaryLeftOffset)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(Metrics.primaryRightOffset)
        }
    }

    private func setupView() {
        backgroundColor = .systemBackground
    }
}

//MARK: - Metrics -

extension DetailComicView {
    enum Metrics {
        static let comicTitleLabelFontSize: CGFloat = 22
        static let primaryFontSize: CGFloat = 14

        static let parentViewPortraitHeightOffset = 500

        static let primaryTopOffset = 15
        static let primaryLeftOffset = 15
        static let primaryRightOffset = -20
    }
}
