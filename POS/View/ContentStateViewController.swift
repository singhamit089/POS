//
//  ContentStateViewController.swift
//  POS
//
//  Created by Amit  Singh on 9/16/18.
//  Copyright © 2018 singhamit089. All rights reserved.
//

import UIKit

class ContentStateViewController: UIViewController {
    private var state: State?
    private var shownViewController: UIViewController?

    func transition(to newState: State) {
        shownViewController?.remove()
        let vc = viewController(for: newState)
        add(vc)
        shownViewController = vc
        state = newState
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if state == nil {
            transition(to: .loading)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ContentStateViewController {
    enum State {
        case loading
        case failed(Error)
        case render(UIViewController)
    }
}

private extension ContentStateViewController {
    func viewController(for state: State) -> UIViewController {
        switch state {
        case .loading:
            return LoadingViewController()
        case let .failed(error):
            return ErrorViewController(error: error)
        case let .render(viewController):
            return viewController
        }
    }
}
