//
//  ViewController.swift
//  ImageViewer
//
//  Created by tambanco 🥳 on 09.11.2021.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {
    
    let urlOfPhotos = "https://jsonplaceholder.typicode.com/photos"
    private var photoJSON = [PhotoJSON]()
    
    private var imageUrls: [String] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPhotoInfo(url: urlOfPhotos)
        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func fetchPhotoInfo(url: String) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
        guard let data = data else { return }
            print(data)
            
            do {
                self.photoJSON = try JSONDecoder().decode([PhotoJSON].self, from: data)
                print(self.photoJSON)
            
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
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
        
        guard let url = URL(string: currentImageUrl) else { return cell }
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.sd_setImage(with: url,
                              placeholderImage: UIImage(named: "placeholder-2.png"),
                              options: [.continueInBackground, .progressiveLoad],
                              completed: nil)
        
        let metaDataLabel = UILabel()
        metaDataLabel.translatesAutoresizingMaskIntoConstraints = false
        metaDataLabel.text = "Format of this picture is .jpg"
        
        cell.addSubview(imageView)
        cell.addSubview(metaDataLabel)
        
        let constraints = [
            imageView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: -20),
            imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: -20),
            
            metaDataLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 10),
            metaDataLabel.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
        ]
        
        NSLayoutConstraint.activate(constraints)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showInfoViewController()
    }
    
    func showInfoViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let infoVC = storyboard.instantiateViewController(identifier: "InfoViewController")
        show(infoVC, sender: self)
    }
    
}
