//
//  SearchViewController.swift
//  TestKlaxit2
//
//  Created by Julien Dos Santos on 21/11/2020.
//

import UIKit
import Alamofire
class SearchViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
    
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var SearchBar: UISearchBar!
    let ApiObject = APIRequest()
    var Datas : [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let data = Datas [indexPath.row]
        cell.textLabel?.text = data
        return cell
    }
    

 
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.setNavigationBarHidden(true, animated: true)
        myTableView.delegate = self
        myTableView.dataSource = self
        SearchBar.delegate=self
        
    }
  

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Enrengistrer adresse
        UserDefaults.standard.setValue(Datas [indexPath.row], forKey: "addr")
        navigationController?.popViewController(animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        ApiObject.ApiRequest(SearchBarText: SearchBar.text!){
            //Alamofire is async. completion allows to wait the end.
            self.mycompletion()
        }
       
        
    }
    func mycompletion() {
        self.Datas = ApiObject.GetJsonResults();
        myTableView.reloadData();
    }
}
    

    
    
