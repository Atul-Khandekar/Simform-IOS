//
//  SearchBarVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 12/05/23.
//

import UIKit

class SearchBarVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak private var tblFruits: UITableView!
    @IBOutlet weak private var searchBar: UISearchBar!
    
    //MARK: - Variables
    private let fruits = Fruits.getData()
    private var filteredData: [String]!
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - SetupView
extension SearchBarVC {
    
    private func setupView() {
        tblFruits.dataSource = self
        tblFruits.delegate = self
        searchBar.delegate = self
        tblFruits.register(UINib(nibName: AppConstants.searchBarCell, bundle: nil), forCellReuseIdentifier: AppConstants.searchBarCell)
        filteredData = getFilteredData(filterString: FruitsScopeTitles.winter.rawValue)
        searchBar.placeholder = AppConstants.searchBarPlaceholder
        searchBar.prompt = AppConstants.searchBarPrompt
        searchBar.showsCancelButton = true
        searchBar.searchTextField.clearButtonMode = .never
        searchBar.showsScopeBar  = true
        searchBar.scopeButtonTitles = [FruitsScopeTitles.winter.rawValue, FruitsScopeTitles.summer.rawValue]
        searchBar.selectedScopeButtonIndex = FruitsScopeIndex.winter.rawValue
        tblFruits.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
    }
}

//MARK: - UITableViewDataSource
extension SearchBarVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.searchBarCell, for: indexPath) as? SearchBarCell else {
            return UITableViewCell()
        }
        cell.configureCell(data: filteredData[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension SearchBarVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/8
    }
}

//MARK: - UISearchBarDelegate
extension SearchBarVC: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        switch searchBar.selectedScopeButtonIndex {
        case FruitsScopeIndex.winter.rawValue :
            filteredData = getFilteredData(text: searchText, filterString: FruitsScopeTitles.winter.rawValue)
        case FruitsScopeIndex.summer.rawValue :
            filteredData = getFilteredData(text: searchText, filterString: FruitsScopeTitles.summer.rawValue)
        default:
            break
        }
        
        tblFruits.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.searchTextField.text = AppConstants.emptyString
        filteredData = fruits
        tblFruits.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        switch selectedScope {
        case FruitsScopeIndex.winter.rawValue :
            filteredData = getFilteredData(filterString: FruitsScopeTitles.winter.rawValue)
        case FruitsScopeIndex.summer.rawValue :
            filteredData = getFilteredData(filterString: FruitsScopeTitles.summer.rawValue)
        default:
            break
        }
        tblFruits.reloadData()
    }
}

//MARK: - View Method
extension SearchBarVC {
    private func getFilteredData( text: String? = nil , filterString: String ) -> [String] {
        
        guard let text else {
            switch filterString  {
            case FruitsScopeTitles.winter.rawValue :
                return fruits.filter{
                    $0.count <= 6
                }
            case FruitsScopeTitles.summer.rawValue :
                return fruits.filter{
                    $0.count > 6
                }
            default:
                break
            }
            return fruits
        }
        
        return fruits.filter {
            $0.lowercased().contains(text.lowercased())
        }
    }
}
