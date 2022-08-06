//
//  ComicsView.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import UIKit

class ComicsView: UIView {

    // MARK: - View -

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(ComicTableViewCell.self,
                           forCellReuseIdentifier: ComicTableViewCell.identifier)
        return tableView
    }()

    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Find comics by name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = Metrics.cornerRadius
        textField.clearsOnBeginEditing = true
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .systemGray4
        return textField
    }()

    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = Metrics.cornerRadius
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemGray4
        return button
    }()

    lazy var separatorLine: UIView = {
        let separator = UIView()
        separator.backgroundColor = .systemGray4
        return separator
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
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(separatorLine)
        addSubview(tableView)
    }

    private func setupLayout() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metrics.searchTextFieldTopOffset)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.searchTextFieldLeftOffset)
            make.right.equalTo(searchButton.snp.left).offset(Metrics.searchTextFieldRightOffset)
            make.height.equalTo(Metrics.searchTextFieldHeight)
        }

        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(Metrics.searchButtonRightOffset)
            make.height.equalTo(searchTextField)
            make.width.equalTo(Metrics.searchButtonWidth)
        }

        separatorLine.snp.makeConstraints { make in
            make.top.equalTo(searchTextField.snp.bottom).offset(Metrics.separatorLineTopOffset)
            make.height.equalTo(2)
            make.left.equalTo(searchTextField.snp.left)
            make.right.equalTo(searchButton.snp.right)
        }

        tableView.snp.makeConstraints { make in
            make.top.equalTo(separatorLine.snp.bottom)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
    }

    private func setupView() {
        backgroundColor = .systemBackground
    }
}

//MARK: - Metrics -

extension ComicsView {
    enum Metrics {
        static let searchTextFieldTopOffset = 10
        static let searchTextFieldLeftOffset = 10
        static let searchTextFieldRightOffset = -10
        static let searchTextFieldHeight = 40

        static let searchButtonRightOffset = -20
        static let searchButtonWidth = 80

        static let separatorLineTopOffset = 10

        static let cornerRadius: CGFloat = 10
    }
}

