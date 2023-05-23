//
//  SecondViewController.swift
//  Exercise2
//
//  Created by 조수민 on 2023/05/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var typeRadioButtons: [UIButton]!
    
    @IBOutlet var sortRadioButtons: [UIButton]!
    
    @IBOutlet weak var shopListTableView: UITableView!
    
    // MARK: - property
    
    private var typeIndex: Int? = 0 {
        didSet {
            setType()
        }
    }
    
    private var sortIndex: Int? = 0 {
        didSet {
            setSort()
        }
    }
    
    let viewModel = SecondViewModel()
    
    private var shopList: [Shop] = [] {
        didSet {
            DispatchQueue.main.async { [weak self] in
                self?.shopListTableView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // tableview
        shopListTableView.delegate = self
        shopListTableView.dataSource = self
        shopListTableView.register(DeliveryListTableViewCell.makeNib(), forCellReuseIdentifier: DeliveryListTableViewCell.identifier)
        
        // set data
        fetchData()
    }
    
    // MARK: - private
    
    private func fetchData() {
        viewModel.fetchSecondData { shopList in
            self.shopList = shopList
        }
    }
    
    private func setType() {
        guard let typeIndex else {
            return
        }
        
        print(typeIndex)
    }
    
    private func setSort() {
        guard let sortIndex else {
            return
        }
        
        print(sortIndex)
    }
    
    // MARK: - IBAction
    
    @IBAction func touchTypeButton(_ sender: UIButton) {
        if typeIndex != nil {
            if !sender.isSelected {
                for index in typeRadioButtons.indices {
                    typeRadioButtons[index].isSelected = false
                }
                
                sender.isSelected = true
                typeIndex = typeRadioButtons.firstIndex(of: sender)
            } else {
                sender.isSelected = false
                typeIndex = nil
            }
        } else {
            sender.isSelected = true
            typeIndex = typeRadioButtons.firstIndex(of: sender)
        }
    }
    
    @IBAction func touchSortButton(_ sender: UIButton) {
        if sortIndex != nil {
            if !sender.isSelected {
                for index in sortRadioButtons.indices {
                    sortRadioButtons[index].isSelected = false
                }
                
                sender.isSelected = true
                sortIndex = sortRadioButtons.firstIndex(of: sender)
            } else {
                sender.isSelected = false
                sortIndex = nil
            }
        } else {
            sender.isSelected = true
            sortIndex = sortRadioButtons.firstIndex(of: sender)
        }
    }
    
}

// MARK: - UITableView

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shopList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: DeliveryListTableViewCell.identifier,
            for: indexPath
        ) as? DeliveryListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.setData(shopList[indexPath.row])
        
        return cell
    }
    
}
