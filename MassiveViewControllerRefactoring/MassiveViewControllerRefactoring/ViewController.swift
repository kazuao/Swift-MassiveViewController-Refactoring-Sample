//
//  ViewController.swift
//  MassiveViewControllerRefactoring
//
//  Created by Kazunori Aoki on 2021/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView?
    private let webServiceClient = WebServiceClient()
    private let serviceResponseMapper = ServiceResponseMapper()
    
    var tableData: [Person] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        guard let seviceURL = URL(string: "http://localhost:8181") else { return }
        
        webServiceClient.fetchDataFromWebService(url: seviceURL, completion: { responseData, error in
            
            DispatchQueue.main.async {
                
                if let error = error {
                    print("Encountered a service error when fetching the results: \(error.localizedDescription)")
                    return
                }
                    
                guard let responseData = responseData else {
                    print("The data from the service response is nil")
                    return
                }
                
                do {
                    let people = try self.serviceResponseMapper.mapData(from: responseData)
                    self.tableData = PersonUtility.sortPeopleByAge(unsourtedPeople: people)
                    self.tableView?.reloadData()
                } catch {
                    print("Caught an exception: \(error.localizedDescription)")
                }
            }
        })
    }

    private func configureTableView() {
        
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .green
        tableView.separatorStyle = .none
        
        var constraints: [NSLayoutConstraint] = []
        
        view.addSubview(tableView)
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["tableView":tableView])
        constraints += NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["tableView":tableView])
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate(constraints)
        
        tableView.register(PersonCell.self, forCellReuseIdentifier: "Cell")
        self.tableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonCell
        let person = tableData[indexPath.row]
        
        cell.textLabel?.text = "Name: \(person.name) Age: \(person.age)"
        
        return cell
    }
}
