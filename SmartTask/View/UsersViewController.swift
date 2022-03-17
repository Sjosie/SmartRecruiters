//
//  ViewController.swift
//  SmartTask
//
//  Created by Evgeny Protopopov on 16.03.2022.
//

import UIKit

class UsersViewController: BaseViewController {
    
    private let viewModel = UsersViewModel()
    private var tableView = UITableView()
    
    lazy private var labelNoDataFound : PLTitleLabel = {
        let label = PLTitleLabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = StringConstants.emptyUserText
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageSetup()
    }
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowCount = viewModel.numberOfUser()
        labelNoDataFound.isHidden = ((rowCount == 0) ? false : true)
        return rowCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! UsersTableViewCell
        let user = viewModel.getUser(at: indexPath.row)
        cell.setupCell(dataModel: user)
        
        return cell
    }
}

extension UsersViewController {
    
    private func pageSetup() {
        title = StringConstants.usersTitle
        closureSetup()
        setupTableView()
        noDataLabelSetup()
    }
    
    private func closureSetup() {
        // add error handling
        self.viewModel.onErrorHandling = { [weak self] error in
            DispatchQueue.main.async {
                self?.removeActivityIndicator()
                switch error {
                case .custom(let message):
                    self?.showAlert(message: message)
                    break
                default:
                    self?.showAlert(message: error?.localizedDescription)
                    break
                }
            }
        }
        // refresh the screen
        self.viewModel.onRefreshHandling = { [weak self] in
            DispatchQueue.main.async {
                self?.removeActivityIndicator()
                self?.tableView.reloadData()
            }
        }
    }
    
    private func setupTableView() {
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        tableView.register(UsersTableViewCell.self, forCellReuseIdentifier: "cell")
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    private func noDataLabelSetup() {
        
        view.addSubview(labelNoDataFound)
        
        labelNoDataFound.widthAnchor.constraint(equalToConstant: 200).isActive = true
        labelNoDataFound.heightAnchor.constraint(equalToConstant: 200).isActive = true
        labelNoDataFound.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        labelNoDataFound.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
}
