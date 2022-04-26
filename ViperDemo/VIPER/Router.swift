//
//  Router.swift
//  ViperDemo
//
//  Created by Rathakrishnan Ramasamy on 25/04/22.
//

import Foundation

// Router is a Object
// Router is a entry point of the architecture

import UIKit


typealias EntryPoint = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    static func start() -> AnyRouter
}


class UserRouter: AnyRouter {
    
    
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        // Assign VIP
        var view: AnyView = UserViewController()
        var presenter: AnyPresenter = UserPresenter()
        var interactor: AnyInteractor = UserInteractor()
        
        view.presenter = presenter
        
        interactor.presenter = presenter
    
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = view
        
        router.entry = view as? EntryPoint
        return router
    }
}
