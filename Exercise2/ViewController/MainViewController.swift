//
//  MainViewController.swift
//  Exercise2
//
//  Created by dahye on 2023/05/14.
//

import UIKit

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    
    var groupList = [Group]() {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.makeNib(), forCellReuseIdentifier: MainTableViewCell.identifier)
        
        fetchData()
    }
    
    func fetchData() {
        viewModel.fetchMainData { groupList in
            self.groupList = groupList
        }
    }
    
    
    

}


extension MainViewController {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.groupList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: MainTableViewCell.identifier,
            for: indexPath
        ) as? MainTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(item: groupList[indexPath.row])
        return cell
        
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailViewController = DetailViewController()
//        detailViewController.id = mainList[indexPath.row].id
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
}
