//
//  PlanningViewController.swift
//  Me and Mine
//
//  Created by Amaya Finklea on 3/19/20.
//  Copyright © 2020 Logan. All rights reserved.
//


import Foundation
import UIKit
import SwiftUI
import SafariServices



// UI
// Network Request
// Tap a cell to see info about the movie
// Custom cell


//get rid of UItextfeild delegate
class PlanningViewController: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    
    // Create a root reference
<<<<<<< HEAD:Me and Mine/Controllers/PlanningViewController.swift
  //  let storageRef = storage.reference()
=======
   // let storageRef = storage.reference()
>>>>>>> master:MeandMine/Controllers/PlanningViewController.swift
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!

    var websites = [Websites]()

    override func viewDidLoad() {
        super.viewDidLoad()
        table.register(WebsitesTableViewCell.nib(), forCellReuseIdentifier: WebsitesTableViewCell.identifier)
        table.delegate = self
        table.dataSource = self
        field.delegate = self
    }

    // Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchWebsites()
        return true
    }

    func searchWebsites() {
        field.resignFirstResponder()

        guard let text = field.text, !text.isEmpty else {
            return
        }

        let query = text.replacingOccurrences(of: " ", with: "%20")

        websites.removeAll()

        URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?apikey=3aea79ac&s=\(query)&type=movie")!,
                                   completionHandler: { data, response, error in

                                    guard let data = data, error == nil else {
                                        return
                                    }

                                    // Convert
                                    var result: WebResult?
                                    do {
                                        result = try JSONDecoder().decode(WebResult.self, from: data)
                                    }
                                    catch {
                                        print("error")
                                    }

                                    guard let finalResult = result else {
                                        return
                                    }

                                    // Update our movies array
                                    let newWebsites = finalResult.Search
                                    self.websites.append(contentsOf: newWebsites)

                                    // Refresh our table
                                    DispatchQueue.main.async {
                                        self.table.reloadData()
                                    }

        }).resume()

    }

    // Table

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return websites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WebsitesTableViewCell.identifier, for: indexPath) as! WebsitesTableViewCell
        cell.configure(with: websites[indexPath.row])
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        // Show movie details
        let url = "https://www.imdb.com/title/\(websites[indexPath.row].imdbID)/"
        let vc = SFSafariViewController(url: URL(string: url)!)
        present(vc, animated: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}

struct WebResult: Codable {
    let Search: [Websites]
}

struct Websites: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String

    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster
    }
}


// Copy the video I found but get rid of the search bar
//https://www.youtube.com/watch?v=mT3OFcui97k


// Copy this video for the personal page
//https://www.youtube.com/watch?v=5xvvfHNdB5c
