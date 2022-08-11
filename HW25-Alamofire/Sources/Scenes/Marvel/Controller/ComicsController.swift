//
//  ComicsController.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import UIKit
import Alamofire

class ComicsController: UIViewController {

    //MARK: - Properties -

    private var comics: [Comic] = []
    private lazy var savedComics: [Comic] = []
    private var selectedComic: ComicDisplayable?
    private let networkService = MarvelNetworkService()

    private var comicsView: ComicsView? {
        guard isViewLoaded else { return nil }
        return view as? ComicsView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        view = ComicsView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        fetchAllComics()
    }

    //MARK: - Private functions -

    private func configureView() {
        comicsView?.tableView.delegate = self
        comicsView?.tableView.dataSource = self
        comicsView?.tableView.keyboardDismissMode = .onDrag
        comicsView?.searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
    }

    private func fetchAllComics() {
        networkService.fetchComics(parameters: nil) { data, error in
            if let alertMessage = error {
                self.showAlert(message: alertMessage)
            } else if let data = data {
                let comics = data.comics.all
                self.comics = comics
                self.savedComics = comics
                self.comicsView?.tableView.reloadData()
            }
        }
    }

    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Close", style: .cancel)
        alert.addAction(okButton)
        navigationController?.present(alert, animated: true)
    }

    @objc private func searchButtonPressed(sender: UIButton) {
        guard let comicTitle = comicsView?.searchTextField.text, comicTitle != "" else {
            self.comics = savedComics
            self.comicsView?.tableView.reloadData()
            return
        }

        let parameters: [String: String] = [
            "titleStartsWithe": comicTitle,
        ]

        networkService.fetchComics(parameters: parameters) { data, error in
            if let alertMessage = error {
                self.showAlert(message: alertMessage)
            } else if let data = data {
                let comics = data.comics.all
                self.comics = comics
                self.comicsView?.tableView.reloadData()
            }
        }
    }
}

//MARK: - UITableViewDataSource -

extension ComicsController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        comics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = comics[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ComicTableViewCell.identifier) as? ComicTableViewCell else { return UITableViewCell() }
        cell.configure(with: model)
        return cell
    }
}

//MARK: - UITableViewDelegate -

extension ComicsController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        80
    }

    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedComic = comics[indexPath.row]
        return indexPath
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = DetailComicController()
        detailViewController.comic = selectedComic
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
