//
//  ViewController.swift
//  DataFromTextFile
//
//  Created by AJK on 11/10/16.
//  Copyright © 2016 ajk. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tblView: UITableView!
    var tableData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let path = Bundle.main.path(forResource: "sample", ofType: "txt") {
            do {
                let data = try String(contentsOfFile: path, encoding: .utf8)
                let fileData = data.components(separatedBy: .newlines)
                self.tableData = fileData
                self.tblView.reloadData()

            } catch {
                print(error)
            }
        }
    }
    
    //MARK: - TableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = tableData[indexPath.row]
        return cell
    }
}
