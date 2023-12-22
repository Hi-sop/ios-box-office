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
    var tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    
        initScreen()

        

    }
    
    private func fetchData(day: String) {
        let target: [QueryItemName: String] = [.targetDt: "20231215"]
        
        APIClient().fetchData(serviceType: .dailyBoxOffice, queryItem: target)
        { (result: Result<BoxOffice, Error>) in
            switch result {
            case .success(let boxOffice):
                self.boxOfficeData = boxOffice
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func initScreen() {
        let yesterday = Date().yesterday
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        self.view.backgroundColor = .white
        self.navigationItem.title = formatter.string(from: yesterday)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension BoxOfficeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //당일 데이터의 개수
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomCell else {
            print("응 실패")
            return UITableViewCell()
        }
        
        cell.textLabel?.text = "test"
        return cell
    }
}

extension BoxOfficeViewController: UITableViewDelegate {
}
