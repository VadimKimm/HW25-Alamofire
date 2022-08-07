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

    private let url = "https://gateway.marvel.com/v1/public/comics"
    private let timeStamp = "10"
    private let marvelPublicKey = "906046b905010b1bbace45bd564eb16f"
    private let marvelPrivateKey = "f61464d42bcf93c72fbee37931962574fefb2147"

    lazy var mdFiveHash: String = {
        let stringToMd = timeStamp + marvelPrivateKey + marvelPublicKey
        let mdFiveHash = stringToMd.getMdFive()
        return mdFiveHash
    }()

    private var comicsView: ComicsView? {
        guard isViewLoaded else { return nil }
        return view as? ComicsView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        super.loadView()
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
            "titleStartsWith": comicTitle,
            "ts": timeStamp,
            "apikey": marvelPublicKey,
            "hash": mdFiveHash
        ]

        fetchComics(parameters: parameters) { data in
            let comics = data.comics.all
            self.comics = comics
            self.comicsView?.tableView.reloadData()
        }
    }
}

//MARK: - Alamofire -

extension ComicsController {
    private func fetchComics(parameters: [String: String]?, completion: @escaping (MarvelResponse) -> Void) {

        AF.request(url, parameters: parameters)
            .validate()
            .responseDecodable(of: MarvelResponse.self) { (response) in
                if let error = response.error {
                    self.showAlert(message: error.localizedDescription)
                }

                if let statusCode = response.response?.statusCode, statusCode == 200 {
                    print("Marvel Api Server status -  \(statusCode)")
                } else if let statusCode = response.response?.statusCode {
                    self.showAlert(message: "Marvel Api Server status -  \(statusCode)")
                    return
                }

                guard let data = response.value else {
                    self.showAlert(message: "No data")
                    return
                }

                completion(data)
            }
    }

    private func fetchAllComics() {
        let parameters: [String: String] = [
            "ts": timeStamp,
            "apikey": marvelPublicKey,
            "hash": mdFiveHash
        ]

        fetchComics(parameters: parameters) { data in
            let comics = data.comics.all
            self.comics = comics
            self.savedComics = comics
            self.comicsView?.tableView.reloadData()
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
