//
//  HomeViewController.swift
//  CellRepresentable
//
//  Created by Ian Keen on 8/04/2016.
//  Copyright © 2016 Mustard. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet private var tableView: UITableView!
    
    //MARK: - Private Properties
    private var viewModel: HomeViewModel!
    
    //MARK: - Lifecycle
    convenience init(viewModel: HomeViewModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
        self.tableView.estimatedRowHeight = 50
        
        self.addRefreshButton()
        
        self.viewModel.tableItemTypes.forEach { $0.registerCell(self.tableView) }
        self.viewModel.didUpdate = self.refreshUI
        self.viewModel.refreshData()
    }
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.indexPathsForSelectedRows?
            .forEach { self.tableView.deselectRowAtIndexPath($0, animated: true) }
    }
    
    //MARK: - Private
    private func addRefreshButton() {
        let refresh = UIBarButtonItem(title: "Refresh", style: .Plain, target: self, action: "refreshButtonTouchUpInside")
        self.navigationItem.leftBarButtonItem = refresh
    }
    private func refreshUI() {
        self.tableView.reloadData()
    }
    
    //MARK: - Actions
    @IBAction private func refreshButtonTouchUpInside() {
        self.viewModel.refreshData()
    }
}

//MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.tableItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellViewModel = self.viewModel.tableItems[indexPath.row]
        return cellViewModel.cellInstance(tableView, indexPath: indexPath)
    }
}

//MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cellViewModel = self.viewModel.tableItems[indexPath.row]
        cellViewModel.cellSelected()
    }
}
