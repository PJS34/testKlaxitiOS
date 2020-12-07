//
//  ViewController.swift
//  TestKlaxit2
//
//  Created by Julien Dos Santos on 20/11/2020.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var PhoneNumberLabel: UILabel!
    @IBOutlet weak var EnterpriseLabel: UILabel!
    @IBOutlet weak var JobLabel: UILabel!
    @IBOutlet weak var AdressLabel: UILabel!
    @IBOutlet weak var FirstNameLabel: UILabel!
    @IBOutlet weak var LastNameLabel: UILabel!
    @IBOutlet weak var profilePic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let data = DataLoader().userData
        print(data)
        FillLabels(data: data!)
        
        //Onclick AdressLabel -> func GoToSeachBar
        let GoToSearchTapGesture = UITapGestureRecognizer(target: self, action: #selector(GoToSearchBar))
        AdressLabel.addGestureRecognizer(GoToSearchTapGesture)
    }
    
    func FillLabels(data : UserData){
        PhoneNumberLabel.text = data.phone_number
        FirstNameLabel.text = data.first_name
        LastNameLabel.text = data.last_name
        JobLabel.text = data.job_position
        EnterpriseLabel.text = data.company
        SetProfilePic(url: data.picture_url)
       
        AdressLabel.text = UserDefaults.standard.object(forKey: "addr") as? String ?? "label"
        UserDefaults.standard.removeObject(forKey: "addr")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AdressLabel.text = UserDefaults.standard.object(forKey: "addr") as? String ?? "label"
    }

    func SetProfilePic(url : String){
        self.profilePic.layer.cornerRadius = self.profilePic.frame.height/2
        self.profilePic.layer.cornerRadius = self.profilePic.frame.width/2
        guard let imageURL = URL(string: url) else { return }
        DispatchQueue.main.async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            let image = UIImage(data: imageData)
            self.profilePic.image = image
        }
    }
    @objc func GoToSearchBar(){
        let SearchStoryBoard: UIStoryboard = UIStoryboard(name: "Search", bundle: nil)
        let SearchViewController = SearchStoryBoard.instantiateViewController(withIdentifier: "SearchViewControllerID") as! SearchViewController
        self.navigationController?.pushViewController(SearchViewController, animated: true)
    }

    
    
}

