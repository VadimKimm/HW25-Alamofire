//
//  MtgView.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 03.08.2022.
//

import UIKit

class MtgView: UIView {

    // MARK: - View -

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.register(MtgTableViewCell.self,
                           forCellReuseIdentifier: MtgTableViewCell.identifier)
        return tableView
    }()

    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Find card by name"
        textField.textAlignment = .center
        textField.layer.cornerRadius = 10
        textField.backgroundColor = .systemGray4
        return textField
    }()

    lazy var searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 10
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.backgroundColor = .systemGray4
        return button
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
        addSubview(searchTextField)
        addSubview(searchButton)
        addSubview(tableView)
    }

    private func setupLayout() {
        searchTextField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metrics.searchTextFieldTopOffset)
            make.centerX.equalTo(self.snp.centerX)
            make.left.equalTo(self.safeAreaLayoutGuide.snp.left).offset(Metrics.searchTextFieldLeftOffset)
            make.right.equalTo(searchButton.snp.left).offset(Metrics.searchTextFieldRightOffset)
            make.height.equalTo(40)
        }

        searchButton.snp.makeConstraints { make in
            make.top.equalTo(searchTextField)
            make.right.equalTo(self.safeAreaLayoutGuide.snp.right).offset(Metrics.searchButtonRightOffset)
            make.height.equalTo(searchTextField)
            make.width.equalTo(80)
        }

    }
}

