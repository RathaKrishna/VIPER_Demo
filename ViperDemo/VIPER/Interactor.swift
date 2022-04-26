//
//  Interactor.swift
//  ViperDemo
//
//  Created by Rathakrishnan Ramasamy on 25/04/22.
//

import Foundation

// Object
// requires Protocol
// it's ref to presenter
// get data from api

protocol AnyInteractor {
    var presenter: AnyPresenter? {get set}
    
    func getUsers()
}

class UserInteractor: AnyInteractor {
    var presenter: AnyPresenter?
    
    func getUsers() {
        guard let url = URL(string: "http://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) {[weak self] data, response, error in
            guard let data = data , error == nil else {
                self?.presenter?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let result = try JSONDecoder().decode([User].self, from: data)
                print(result)
                self?.presenter?.interactorDidFetchUsers(with: .success(result))
            }
            catch {
                print(error.localizedDescription)
                self?.presenter?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}
