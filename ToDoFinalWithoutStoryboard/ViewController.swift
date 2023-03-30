//
//  ViewController.swift
//  ToDoFinalWithoutStoryboard
//
//  Created by Yogesh Tekwani on 3/29/23.
//

import UIKit

class ViewController: UIViewController {

    var mainStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    var horizontalStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.spacing = 20
        return stack
    }()
    
    var titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }()
    
    var addButton: UIButton = {
       let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50, weight: .semibold)
        return button
    }()
    
    var tableView: UITableView = {
       let table = UITableView()
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        // Do any additional setup after loading the view.
        horizontalStackView.addArrangedSubview(titleLabel)
        horizontalStackView.addArrangedSubview(addButton)
        mainStackView.addArrangedSubview(horizontalStackView)
        mainStackView.addArrangedSubview(tableView)
        
        titleLabel.text = "To Do"
        addButton.setTitle("+  ", for: .normal)
        addButton.setTitleColor(.blue, for: .normal)
        
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        tableView.delegate = self
        tableView.dataSource = self
        
        // register the custom cell
        
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        
        // Add mainstack to main view
        self.view.addSubview(mainStackView)
        
        
        // set constraints for the stack
        
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // create safe area
        
        let safeArea = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: safeArea.topAnchor ),
            mainStackView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor ),
            mainStackView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: 10 ),
            mainStackView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10 ),
            
        ])
        
    }

    @objc func addButtonAction(sender: UIButton){
        
    }
    
}

extension ViewController: UITableViewDelegate {}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell else {return UITableViewCell()}
        
        cell.label.text = "Hello World"
        return cell
    }
}

