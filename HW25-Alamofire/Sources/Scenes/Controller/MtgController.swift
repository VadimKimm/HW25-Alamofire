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
    private var savedCards: [Card] = []
    private let url = "https://api.magicthegathering.io/v1/cards"
    private var selectedCard: Displayable?

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
        title = "Magic The Gathering Cards"
        mtgView?.tableView.delegate = self
        mtgView?.tableView.dataSource = self
        mtgView?.tableView.keyboardDismissMode = .onDrag
        mtgView?.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
    }
}

//MARK: - Alamofire -

extension MtgController {
    private func fetchCards() {
        AF.request(url)
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let data = response.value else { return }
                let cards = data.all
                self.cards = cards
                self.savedCards = cards
                self.mtgView?.tableView.reloadData()
            }
    }

    private func searchCard(for name: String) {
        let parameters: [String: String] = ["name": name]
        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: Cards.self) { (response) in
                guard let data = response.value else { return }
                let cards = data.all
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

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedCard = cards[indexPath.row]
        return indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = DetailMtgController()
        detailViewController.card = selectedCard
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

//MARK: - @objc functions -

extension MtgController {
    @objc func searchButtonPressed(sender: UIButton) {
        guard let cardName = mtgView?.searchTextField.text, cardName != "" else {
            self.cards = savedCards
            self.mtgView?.tableView.reloadData()
            return
        }
        searchCard(for: cardName)
    }
}
