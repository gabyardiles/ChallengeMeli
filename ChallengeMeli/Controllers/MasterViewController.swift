//
//  MasterViewController.swift
//  ChallengeMeli
//
//  Created by Graciela Gabriela Ardiles on 16/12/2020.
//


import UIKit

class MasterViewController: UIViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var searchFooter: SearchView!
    @IBOutlet var searchFooterBottomConstraint: NSLayoutConstraint!
    
    var candies: [Any] = []
    let searchController = UISearchController(searchResultsController: nil)
    var filteredCandies: [Any] = []
    
    override func viewDidLoad() {
      super.viewDidLoad()
      
//      candies = Candy.candies()
      
      // 1
      searchController.searchResultsUpdater = self
      // 2
      searchController.obscuresBackgroundDuringPresentation = false
      // 3
        searchController.searchBar.placeholder = LocalizableUtils.string(withKey: "SearchBarPlaceHolder")
      // 4
      navigationItem.searchController = searchController
      // 5
      definesPresentationContext = true
//
//      searchController.searchBar.scopeButtonTitles = Candy.Category.allCases.map { $0.rawValue }
      searchController.searchBar.delegate = self
      
      let notificationCenter = NotificationCenter.default
      notificationCenter.addObserver(forName: UIResponder.keyboardWillChangeFrameNotification,
                                     object: nil, queue: .main) { (notification) in
                                      self.handleKeyboard(notification: notification) }
      notificationCenter.addObserver(forName: UIResponder.keyboardWillHideNotification,
                                     object: nil, queue: .main) { (notification) in
                                      self.handleKeyboard(notification: notification) }
    }
    
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
      if let indexPath = tableView.indexPathForSelectedRow {
        tableView.deselectRow(at: indexPath, animated: true)
      }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//      guard
//        segue.identifier == "ShowDetailSegue",
//        let indexPath = tableView.indexPathForSelectedRow,
//        let detailViewController = segue.destination as? DetailViewController
//        else {
          return
      }
      
//      let candy: Candy
//      if isFiltering {
//        candy = filteredCandies[indexPath.row]
//      } else {
//        candy = candies[indexPath.row]
//      }
//      detailViewController.candy = candy
//    }
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    var isFiltering: Bool {
      let searchBarScopeIsFiltering = searchController.searchBar.selectedScopeButtonIndex != 0
      return searchController.isActive && (!isSearchBarEmpty || searchBarScopeIsFiltering)
    }
//
//    func filterContentForSearchText(_ searchText: String,
//                                    category: Candy.Category? = nil) {
////      filteredCandies = candies.filter { (candy: Candy) -> Bool in
////        let doesCategoryMatch = category == .all || candy.category == category
////
////        if isSearchBarEmpty {
////          return doesCategoryMatch
////        } else {
////          return doesCategoryMatch && candy.name.lowercased().contains(searchText.lowercased())
////        }
////      }
////
////      tableView.reloadData()
//    }
    
    func handleKeyboard(notification: Notification) {
      // 1
      guard notification.name == UIResponder.keyboardWillChangeFrameNotification else {
        searchFooterBottomConstraint.constant = 0
        view.layoutIfNeeded()
        return
      }
      
      guard
        let info = notification.userInfo,
        let keyboardFrame = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        else {
          return
      }
      
      // 2
      let keyboardHeight = keyboardFrame.cgRectValue.size.height
      UIView.animate(withDuration: 0.1, animations: { () -> Void in
        self.searchFooterBottomConstraint.constant = keyboardHeight
        self.view.layoutIfNeeded()
      })
    }
    
    
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//          let category = Candy.Category(rawValue:
//            searchBar.scopeButtonTitles![selectedScope])
//          filterContentForSearchText(searchBar.text!, category: category)
        }
        
        
    func updateSearchResults(for searchController: UISearchController) {
//          let searchBar = searchController.searchBar
//          let category = Candy.Category(rawValue:
//            searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
//          filterContentForSearchText(searchBar.text!, category: category)
        }
  }

  extension MasterViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
      if isFiltering {
//        searchFooter.setIsFilteringToShow(filteredItemCount:
//          filteredCandies.count, of: candies.count)
        return filteredCandies.count
      }
      
//      searchFooter.setNotFiltering()
      return candies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
//      let candy: Candy
      if isFiltering {
//        candy = filteredCandies[indexPath.row]
//      } else {
//        candy = candies[indexPath.row]
//      }
      cell.textLabel?.text = "prueba"
      cell.detailTextLabel?.text = "hard"
     
      }
        return cell
  }
}
//  extension MasterViewController: UISearchResultsUpdating {
//    func updateSearchResults(for searchController: UISearchController) {
//      let searchBar = searchController.searchBar
//      let category = Candy.Category(rawValue:
//        searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex])
//      filterContentForSearchText(searchBar.text!, category: category)
//    }
//  }

    
//extension MasterViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
//      let category = Candy.Category(rawValue:
//        searchBar.scopeButtonTitles![selectedScope])
//      filterContentForSearchText(searchBar.text!, category: category)
//    }
//}
