//
//  MtgController.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 03.08.2022.
//

import UIKit

class MtgController: UIViewController {

    //MARK: - Properties -

    private var mtgView: MtgView? {
        guard isViewLoaded else { return nil }
        return view as? MtgView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        super.loadView()
        view = MtgView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    //MARK: - Private functions -

    private func configureView() {
        mtgView?.tableView.delegate = self
        mtgView?.tableView.dataSource = self
    }
}

//MARK: - UITableViewDataSource -

extension MtgController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

//MARK: - UITableViewDelegate -

extension MtgController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

