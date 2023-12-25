//
//  ViewController.swift
//  BoxOffice
//
//  Created by kjs on 13/01/23.
//

import UIKit

class BoxOfficeViewController: UIViewController {
    //var boxOfficeData: [String: BoxOffice] = [:]
    var boxOfficeData: BoxOffice?
    var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        fetchData(day: "")
        initScreen()

        

    }
    
    private func fetchData(day: String) {
        let target: [QueryItemName: String] = [.targetDt: "20231215"]
        
        APIClient().fetchData(serviceType: .dailyBoxOffice, queryItem: target)
        { (result: Result<BoxOffice, Error>) in
            switch result {
            case .success(let boxOffice):
                print("성공")
                self.boxOfficeData = boxOffice
                //print(self.boxOfficeData)
            case .failure(let error):
                print("실패")
                print(error.localizedDescription)
            }
        }
    }
    
    private func initScreen() {
        let yesterday = Date().yesterday
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        self.navigationItem.title = formatter.string(from: yesterday)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        self.view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension BoxOfficeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            return UICollectionViewCell()
        }
        cell.backgroundColor = .brown
        cell.label?.text = "test"
        
        return cell
    }
}

extension BoxOfficeViewController: UICollectionViewDelegate {
}
