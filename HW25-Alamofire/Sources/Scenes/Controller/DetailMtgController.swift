//
//  DetailMtgController.swift
//  HW25-Alamofire
//
//  Created by Vadim Kim on 04.08.2022.
//

import UIKit

class DetailMtgController: UIViewController {

    //MARK: - Properties -

    var card: Displayable?

    private var detailMtgView: DetailMtgView? {
        guard isViewLoaded else { return nil }
        return view as? DetailMtgView
    }

    //MARK: - Lifecycle -

    override func loadView() {
        super.loadView()
        view = DetailMtgView()
    }

    override func viewDidLoad() {
      super.viewDidLoad()
      commonInit()
    }

    private func commonInit() {
        detailMtgView?.configure(with: card)
    }
}
