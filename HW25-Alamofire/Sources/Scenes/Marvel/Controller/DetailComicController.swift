//
//  DetailComicController.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 06.08.2022.
//

import UIKit

class DetailComicController: UIViewController {

    //MARK: - Properties -

    var comics: ComicDisplayable?

    private var detailMtgView: DetailComicView? {
        guard isViewLoaded else { return nil }
        return view as? DetailComicView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        super.loadView()
        view = DetailComicView()
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      commonInit()
    }

    //MARK: - Private functions -

    private func commonInit() {
        detailMtgView?.configure(with: comics)
    }
}
