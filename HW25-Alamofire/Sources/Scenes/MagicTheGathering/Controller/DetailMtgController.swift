//
//  DetailMtgController.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import UIKit

class DetailMtgController: UIViewController {

    //MARK: - Properties -

    var card: MtgDisplayable?

    private var detailMtgView: DetailMtgCardView? {
        guard isViewLoaded else { return nil }
        return view as? DetailMtgCardView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        view = DetailMtgCardView()
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      commonInit()
    }

    //MARK: - Private functions -

    private func commonInit() {
        detailMtgView?.configure(with: card)
    }
}
