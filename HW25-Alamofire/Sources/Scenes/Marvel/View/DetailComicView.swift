//
//  DetailComicView.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import UIKit

class DetailComicView: UIScrollView {

    // MARK: - Configuration -

    func configure(with comics: ComicDisplayable?) {
        comicTitleLabel.text = comics?.titleLabelText
        comicIdLabel.text = "Comics id: " + String(comics?.idLabelText ?? -1)


        DispatchQueue.main.async {
            guard let imagePath = comics?.imageUrl,
                  let imageURL = URL(string: imagePath),
                  let imageData = try? Data(contentsOf: imageURL)
            else {
                self.comicImage.image = UIImage(named: "square-image")
                return
            }

            self.comicImage.image = UIImage(data: imageData)
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

    private lazy var comicImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var comicImageContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(parentView)
        parentView.addSubview(comicTitleLabel)
        parentView.addSubview(comicImageContainer)
        parentView.addSubview(comicImage)
        parentView.addSubview(comicIdLabel)
    }

    private func setupLayout() {
        parentView.snp.makeConstraints { make in
            make.edges.equalTo(self.snp.edges)
            make.width.equalTo(self.snp.width)
            make.height.equalTo(self.snp.height).offset(Metrics.parentViewHeightOffset)
        }

        comicTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(parentView.snp.centerX)
            make.top.equalTo(parentView.safeAreaLayoutGuide.snp.top).offset(Metrics.primaryTopOffset)
            make.left.equalTo(parentView.safeAreaLayoutGuide.snp.left).offset(15)
            make.right.equalTo(parentView.safeAreaLayoutGuide.snp.right).offset(-15)
        }

        comicImageContainer.snp.makeConstraints { make in
            make.top.equalTo(comicTitleLabel.snp.bottom).offset(15)
            make.centerX.equalTo(parentView.snp.centerX)
            make.height.equalTo(parentView.snp.width)
            make.width.equalTo(parentView.snp.width)
        }

        comicImage.snp.makeConstraints { make in
            make.edges.equalTo(comicImageContainer.snp.edges)
        }

        comicIdLabel.snp.makeConstraints { make in
            make.top.equalTo(comicImageContainer.snp.bottom).offset(Metrics.primaryTopOffset)
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

        static let parentViewHeightOffset = 220

        static let primaryTopOffset = 15
        static let primaryLeftOffset = 15
        static let primaryRightOffset = -20
    }
}

