//
//  ViewController.swift
//  ImageViewer
//
//  Created by tambanco 🥳 on 09.11.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    let imageUrls = ["https://images.unsplash.com/photo-1509803874385-db7c23652552?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1472190649224-495422e1b602?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1507608869274-d3177c8bb4c7?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1514477917009-389c76a86b68?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1501630834273-4b5604d2ee31?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1548268770-66184a21657e?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1528872042734-8f50f9d3c59b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1501630834273-4b5604d2ee31?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ",
                     "https://images.unsplash.com/photo-1504608524841-42fe6f032b4b?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max&ixid=eyJhcHBfaWQiOjg0Mjk0fQ"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        setupTableView()
        
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    }
}


// MARK: - UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        let currentImageUrl = imageUrls[indexPath.row]
        
        let imageView = UIImageView()
//        imageView.backgroundColor = .red
        guard let url = URL(string: currentImageUrl) else { return cell }
        imageView.sd_setImage(with: url, completed: nil)
        cell.addSubview(imageView)
        
        imageView.frame = cell.bounds
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    
}
