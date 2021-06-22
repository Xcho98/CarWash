//
//  HomeController.swift
//  Exam 4
//
//  Created by XchoBeglaryan on 26.05.21.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var viewProfil: UIView!
    @IBOutlet weak var logoProfile: UIImageView!
    @IBOutlet weak var textProfile: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates()
        register()
        setup()
        }
    
    func delegates() {
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func register() {
        
        tableView.register(UINib(nibName: "VulkanizationCell", bundle: .main), forCellReuseIdentifier: "VulkanizationCell")
        tableView.register(UINib(nibName: "CarWash", bundle: .main), forCellReuseIdentifier: "CarWash")
        tableView.register(UINib(nibName: "HomeTableCellForCollection", bundle: nil), forCellReuseIdentifier: "HomeTableCellForCollection")
    }
    
    func setup() {
        
        self.logoProfile.layer.cornerRadius = logoProfile.frame.width / 2
    }
    

}
extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell = tableView.dequeueReusableCell(withIdentifier: "CarWash") as! CarWash
            return cell
            
        case 1:
           cell = tableView.dequeueReusableCell(withIdentifier: "VulkanizationCell") as! VulkanizationCell
            return cell
            
        case 2:
            cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableCellForCollection", for: indexPath) as! HomeTableCellForCollection
            return cell
            
        default:
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 15
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "CarWash"
        case 1:
            return "Vulkanization"
        case 2:
            return "Offers that might interest you"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        
        case 1:
          return  60
        default:
            return 130
        }
    }
}
