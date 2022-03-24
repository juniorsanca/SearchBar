//
//  ViewController.swift
//  SearchBar
//
//  Created by User on 17/03/2022.
//

import UIKit

class SearchViewController: UIViewController {
  

    var filteredData = [SearchResult]()

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cellNib = UINib(nibName: "SearchResultCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "SearchResultCell")
  
    }
    
    func searchUrl(searchText: String)->URL {
        let urlString = String(format: "https://itunes.apple.com/search?term=%@", searchText)
        let url = URL(string: urlString)
        return url!
    }
    
    func performRequest(url: URL) -> Data? {
        do{
            return try Data (contentsOf: url)
        } catch {
            print("error: \(error)")
            return nil
        }
        //Data(contentsOf: url)
    }

}

extension SearchViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        if !searchBar.text! .isEmpty {
            searchBar.resignFirstResponder()
            
            let url = searchUrl(searchText: searchBar.text)
            print("URL: \(url)")
            if let data = performRequest(url: url) {
                print("data: \(data)")
                //persing
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return filteredData.count
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPeth: IndexPath)-> CGFloat {
        return 80
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated:true)
    }
}
