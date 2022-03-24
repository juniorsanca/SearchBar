//
//  ViewController.swift
//  SearchBar
//
//  Created by User on 17/03/2022.
//

import UIKit

class ViewController: UIViewController {
  
    let data = ["Damso",
                "Ninho",
                "Freeze",
                "Gazo",
                "Junior"]
    
    //var filteredData: [String]!
    var filteredData = [SearchResult]()

    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let cellNib = UINib
        
        //filteredData = data
        //tableView.delegate = self
        //tableView.delegate = self
        //searchBar.delegate = self
       
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return filteredData.count
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchResultCell", for: indexPath)
        
        //cell.textLabel?.text = filteredData[indexPath.row]
        //return cell
        return UITableViewCell()
    }
}

extension ViewController: UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        
        filteredData = []
        
        if searchText == ""
        {
            filteredData = data
        }
        for word in data {
            if word.uppercased().contains(searchText.uppercased())
            {
                filteredData.append(word)
            }
        }
        self.tableView.reloadData()
    }
}
