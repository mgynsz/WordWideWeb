//
//  PlayingListViewController.swift
//  WordWideWeb
//
//  Created by 박준영 on 5/16/24.
//

import UIKit
import Firebase

class PlayingListVC: UIViewController {
    
    // MARK: - properties
    private let playlistView = PlayingListView()
    private var selectedIndexPath: IndexPath?
    private var searchWord: String = ""
    
    var wordBooks: [Wordbook] = [
        Wordbook(
            id: "1",
            ownerId: "owner123",
            title: "Swift Programming Basics",
            isPublic: true,
            dueDate: Timestamp(date: Date().addingTimeInterval(604800)), // 1 week from now
            createdAt: Timestamp(date: Date().addingTimeInterval(-604800)), // 1 week ago
            attendees: ["user1", "user2", "user3"],
            sharedWith: ["user4", "user5"],
            colorCover: "blue",
            wordCount: 2,
            words: [
                Word(id: "w1", term: "Variable", definition: "A storage location paired with an associated symbolic name."),
                Word(id: "w2", term: "Function", definition: "A block of code that performs a specific task.")
            ]
        ),
        Wordbook(
            id: "2",
            ownerId: "owner456",
            title: "Advanced iOS Development",
            isPublic: false,
            dueDate: nil, // No due date
            createdAt: Timestamp(date: Date().addingTimeInterval(-2592000)), // 1 month ago
            attendees: ["user6", "user7"],
            sharedWith: ["user8"],
            colorCover: "red",
            wordCount: 2,
            words: [
                Word(id: "w3", term: "Closure", definition: "A self-contained block of functionality that can be passed around and used in your code."),
                Word(id: "w4", term: "Protocol", definition: "A blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality.")
            ]
        ),
        Wordbook(
            id: "3",
            ownerId: "owner789",
            title: "Introduction to Algorithms",
            isPublic: true,
            dueDate: Timestamp(date: Date().addingTimeInterval(1209600)), // 2 weeks from now
            createdAt: Timestamp(date: Date()), // Now
            attendees: ["user9", "user10", "user11"],
            sharedWith: nil,
            colorCover: "green",
            wordCount: 2,
            words: [
                Word(id: "w5", term: "Algorithm", definition: "A process or set of rules to be followed in calculations or other problem-solving operations."),
                Word(id: "w6", term: "Data Structure", definition: "A particular way of organizing and storing data in a computer so that it can be accessed and modified efficiently.")
            ]
        )
    ]
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = self.playlistView
        setData()
        setBtn()
        setUI()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - method
    func setData(){
        playlistView.resultView.dataSource = self
        playlistView.resultView.delegate = self
        playlistView.resultView.register(PlayingListViewCell.self, forCellReuseIdentifier: "PlayingListViewCell")
        
        playlistView.searchBar.delegate = self
        
    }
    
    func setUI(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setBtn(){
        let popUpButtonClosure = { [self] (action: UIAction) in
            if action.title == "마감순" {
                print("마감순")
                wordBooks.sort { book1, book2 in
                    let date1 = convertTimestampToString(timestamp: book1.dueDate)
                    let date2 = convertTimestampToString(timestamp: book2.dueDate)
                    return date1 < date2
                }
            } else {
                print("생성순")
                wordBooks.sort { book1, book2 in
                    let date1 = convertTimestampToString(timestamp: book1.createdAt)
                    let date2 = convertTimestampToString(timestamp: book2.createdAt)
                    return date1 < date2
                }
            }
            self.playlistView.resultView.reloadData()
        }
        
        playlistView.filterBtn.menu = UIMenu(
            title: "정렬",
            image: UIImage.filter,
            options: .displayInline,
            children: [
                UIAction(title: "마감순", handler: popUpButtonClosure),
                UIAction(title: "생성순", handler: popUpButtonClosure),]
        )
        
        playlistView.filterBtn.showsMenuAsPrimaryAction = true
        playlistView.filterBtn.changesSelectionAsPrimaryAction = true
    }
    
    func convertTimestampToString(timestamp: Timestamp?) -> String {
        guard let timestamp = timestamp else {
            return "No Date" // 타임스탬프가 nil일 경우 처리
        }
        
        let date = timestamp.dateValue() // Timestamp를 Date로 변환
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy.MM.dd HH:mm:ss" // 날짜 형식 설정
        
        return dateFormatter.string(from: date) // Date를 문자열로 변환하여 반환
    }
    
}

extension PlayingListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("사용자가 입력한 텍스트: \(searchText)")
        searchWord = searchText
        if searchWord == "" {
            //모든 단어장 보여주기
        } else {
            //검색결과
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("사용자가 엔터 키를 눌렀습니다.")
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

extension PlayingListVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayingListViewCell", for: indexPath) as? PlayingListViewCell else {
            return UITableViewCell()
        }
        let title = wordBooks[indexPath.row].title
        let date = convertTimestampToString(timestamp: wordBooks[indexPath.row].dueDate)
        let imageData: Data? = UIImage(named: "smileFace")?.pngData()
        cell.listview.bind(imageData: imageData, title: title, date: date)
        cell.nowPplNum = wordBooks[indexPath.row].attendees.count
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let selectedIndexPath = tableView.indexPathForSelectedRow, selectedIndexPath == indexPath {
            return 160
        } else {
            return 80
        }
    }
    
    
}



