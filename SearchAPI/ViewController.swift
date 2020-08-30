//
//  ViewController.swift
//  SearchAPI
//
//  Created by Sose Yeritsyan on 7/11/20.
//  Copyright © 2020 Sose Yeritsyan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var iTunesLink: String = ""
    var link = ""
    
    var songs: [Song] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        iTunesLink = "https://itunes.apple.com/search?term="
        let nibCell = UINib(nibName: "TableViewCell", bundle: nil)
        tableView.register(nibCell, forCellReuseIdentifier: "TableCell")

    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell", for: indexPath) as! TableViewCell
        cell.configure(song: songs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 165
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SharedInstanceClass.sharedInstance.getSongs(requestURL: link) { (Bool, result: [Song]?) in
            if let s = result?[indexPath.row] {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "PlaySongViewController") as! PlaySongViewController
                vc.song = s
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        }
    }
}
    
    

extension ViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        songs = []
        if searchBar.text != nil {
            link = iTunesLink + searchBar.text!
            SharedInstanceClass.sharedInstance.getSongs(requestURL: link) { (Bool, result: [Song]?) in
                if let obj = result {
                    self.songs = obj
                    self.tableView.reloadData()
                }

            }
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.songs = []
            self.tableView.reloadData()
            
            }
        }
    
    
}
    
