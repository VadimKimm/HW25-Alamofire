//
//  MtgController.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 03.08.2022.
//

import UIKit
import Alamofire

class MtgController: UIViewController {

    //MARK: - Properties -

    private var cards: [Card] = []
    private let url = "https://api.magicthegathering.io/v1/cards"

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
        fetchCards()
    }

    //MARK: - Private functions -

    private func configureView() {
        mtgView?.tableView.delegate = self
        mtgView?.tableView.dataSource = self
    }
}

//MARK: - Alamofire -

extension MtgController {
    private func fetchCards() {
        AF.request(url)
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let data = response.value else { return }
                let cards = data.cards
                self.cards = cards
                self.mtgView?.tableView.reloadData()
            }
    }
}

//MARK: - UITableViewDataSource -

extension MtgController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cards.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = cards[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MtgTableViewCell.identifier) as? MtgTableViewCell else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
}

//MARK: - UITableViewDelegate -

extension MtgController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }
}

