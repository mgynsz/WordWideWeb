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
    private var wordTerms: [Word] = []
    
    var wordBooks: [Wordbook] = [ ]
    
    // MARK: - lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view = self.playlistView
        setData()
        setBtn()
        setUI()
        setDataForTrending()
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
    
    func setDataForTrending(){
        Task {
            do {
                self.wordBooks = try await FirestoreManager.shared.fetchAllWordbooks()
                self.wordBooks.sort { $0.createdAt.dateValue() > $1.createdAt.dateValue() } // 생성 날짜로 정렬
                self.playlistView.resultView.reloadData()
            } catch {
                print("Error fetching wordbooks: \(error.localizedDescription)")
            }
        }
    }
    
    func setDataForSearchWord(keyword: String){
        Task {
            do {
                self.wordBooks = try await FirestoreManager.shared.fetchWordbooksByTitle(for: keyword)
                self.wordBooks.sort { $0.createdAt.dateValue() > $1.createdAt.dateValue() } // 생성 날짜로 정렬
                self.playlistView.resultView.reloadData()
            } catch {
                print("Error fetching wordbooks: \(error.localizedDescription)")
            }
        }
    }
    
    func setUI(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func setBtn(){
        let popUpButtonClosure = { [self] (action: UIAction) in
            if action.title == "생성순" {
                print("생성순")
                wordBooks.sort { book1, book2 in
                    let date1 = convertTimestampToString(timestamp: book1.createdAt)
                    let date2 = convertTimestampToString(timestamp: book2.createdAt)
                    return date1 < date2
                }
            } else {
                print("마감순")
                wordBooks.sort { book1, book2 in
                    let date1 = convertTimestampToString(timestamp: book1.dueDate)
                    let date2 = convertTimestampToString(timestamp: book2.dueDate)
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
                UIAction(title: "생성순", handler: popUpButtonClosure),
                UIAction(title: "마감순", handler: popUpButtonClosure),]
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
    
    @objc func joinBtnDidTapped(_ sender: UIButton){
        guard let cell = sender.superview?.superview as? PlayingListViewCell,
              let indexPath = playlistView.resultView.indexPath(for: cell) else {
            return
        }
        
        let wordbookId = wordBooks[indexPath.row].id
        joinWordBook(for: wordbookId)
    }
    
    func joinWordBook(for wordbookId: String){
        guard let user = Auth.auth().currentUser else {
            print("No authenticated user found.")
            return
        }
        
        Task {
            do {
                let isAdded = try await FirestoreManager.shared.addAttendee(to: wordbookId, attendee: user.uid)
                if isAdded {
                    showAlert(message: "단어장 목록에 추가되었습니다.")
                } else {
                    showAlert(message: "이미 참여중인 단어장입니다.")
                }
            } catch {
                print("Failed to add word: \(error.localizedDescription)")
            }
        }
    }
    
    private func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        playlistView.resultView.reloadData()
        present(alert, animated: true, completion: nil)
    }
    
}

extension PlayingListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("사용자가 입력한 텍스트: \(searchText)")
        searchWord = searchText
        if searchWord == "" {
            setDataForTrending()
        } else {
            setDataForSearchWord(keyword: searchWord)
        }
        
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("사용자가 엔터 키를 눌렀습니다.")
        searchBar.resignFirstResponder()
        
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
    
    func getWords(for wordbookId: String) async throws -> [Word] {
        do {
            let words = try await FirestoreManager.shared.fetchWords(for: wordbookId)
            return words
        } catch {
            print("Error fetching words: \(error.localizedDescription)")
            throw error // 에러를 다시 던져서 호출자에게 전달
        }
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
        let owner =  wordBooks[indexPath.row].ownerId
        cell.listview.bind(imageData: Data(), title: title, date: date)
        cell.joinButton.addTarget(self, action: #selector(joinBtnDidTapped), for: .touchUpInside)
        
        let wordbookId = wordBooks[indexPath.row].id
        Task {
            do {
                let words = try await getWords(for: wordbookId)
                //self.wordBooks[indexPath.row].words = words
                
                DispatchQueue.main.async {
                    self.wordBooks[indexPath.row].words = words
                    cell.wordList = self.wordBooks[indexPath.row].words.map { $0.term }
                    cell.wordbookId = wordbookId
                    
                    cell.nowPplNum = self.wordBooks[indexPath.row].attendees.count
                    //cell.pplNum = self.wordBooks[indexPath.row].attendees.count
                    
                    // 이미지를 로드하여 셀에 설정
                    self.fetchImageAndSetImage(for: owner, imageView: cell.listview.imageLabel)
                }
            } catch {
                print("Error fetching words: \(error.localizedDescription)")
            }
        }
        
        return cell
    }
    
    //    func fetchWordFromWordbook(){
    //        Task {
    //            do {
    //                let words = try await getWords(for: wordBooks[indexPath.row].id)
    //                wordTerms = words //.map { $0.term }
    //                print(wordTerms)
    //                cell.wordList = wordTerms
    //                cell.wordbookId = localWordBooks[indexPath.row].id
    //                cell.nowPplNum = localWordBooks[indexPath.row].sharedWith?.count ?? 0
    //                cell.pplNum = localWordBooks[indexPath.row].attendees.count
    //                // 이미지를 비동기적으로 로드하여 셀에 설정
    //                await fetchImageAndSetImage(for: owner, imageView: cell.listview.imageLabel)
    //            } catch {
    //                print("Error fetching words: \(error.localizedDescription)")
    //            }
    //        }
    //    }
    
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayingListViewCell", for: indexPath) as? PlayingListViewCell else {
    //            return UITableViewCell()
    //        }
    //
    //        let title = wordBooks[indexPath.row].title
    //        let date = convertTimestampToString(timestamp: wordBooks[indexPath.row].dueDate)
    //        let owner =  wordBooks[indexPath.row].ownerId
    //        cell.listview.bind(imageData: Data() ,title: title, date: date)
    //
    //        let terms = wordBooks[indexPath.row].words.map { $0.term }
    //        cell.wordList = getWords(for: wordBooks[indexPath.row].id).map { $0.term }
    //        cell.wordbookId = wordBooks[indexPath.row].id
    //        cell.nowPplNum = 0
    //        if let num = wordBooks[indexPath.row].sharedWith?.count {
    //            cell.nowPplNum = num
    //        }
    //        cell.pplNum = wordBooks[indexPath.row].attendees.count
    //
    //        // 이미지를 비동기적으로 로드하여 셀에 설정
    //        fetchImageAndSetImage(for: owner, imageView: cell.listview.imageLabel)
    //
    //        return cell
    //    }
    
    
    func fetchImageAndSetImage(for id: String, imageView: UIImageView) {
        Task {
            do {
                if let url = try await fetchImage(id: id) {
                    imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(systemName: "person.crop.circle"))
                    
                } else {
                    imageView.image = UIImage(systemName: "person.crop.circle")
                }
            } catch {
                print("Error fetching image: \(error.localizedDescription)")
                imageView.image = UIImage(systemName: "person.crop.circle")
            }
        }
    }
    
    func fetchImage(id: String) async throws -> String? {
        do {
            let user = try await FirestoreManager.shared.fetchUser(uid: id)
            return user?.photoURL
        } catch {
            print("Error fetching image: \(error.localizedDescription)")
            throw error
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let selectedIndexPath = tableView.indexPathForSelectedRow, selectedIndexPath == indexPath {
            if wordBooks[indexPath.row].words.count == 0 {
                return 110
            } else {
                return 160
            }
        } else {
            return 80
        }
    }
    
}



