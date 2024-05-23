//
//  TabBarController.swift
//  WordWideWeb
//
//  Created by 박준영 on 5/17/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
//import SDWebImage

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setTabBar()
        //        setDefaultTabBarImages()
        //setupTabBar()
        setupTabBarItems()
        NotificationCenter.default.addObserver(self, selector: #selector(showPage(_:)), name: NSNotification.Name("showPage"), object: nil)
    }
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()

            // Adjust the height of the tab bar
            var tabFrame = self.tabBar.frame
            tabFrame.size.height = 90 // 원하는 높이로 설정
            tabFrame.origin.y = self.view.frame.size.height - 90 // 탭바가 화면 하단에 위치하도록 조정
            self.tabBar.frame = tabFrame
        }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("showPage"), object: nil)
    }
    
    @objc func showPage(_ notification:Notification) {
        guard let userInfo = notification.userInfo, let wordbook = userInfo["wordbook"] as? Wordbook else { return }
        
        let testIntroViewController = TestIntroViewController()
        testIntroViewController.modalPresentationStyle = .fullScreen
        print("showPage///wordbook!!!!!!!!!\(wordbook)")
        testIntroViewController.testWordBook = wordbook
        self.present(testIntroViewController, animated: true)
        
    }
    
    //    func setTabBar() {
    //
    //        let appearance = UITabBarAppearance()
    //        appearance.configureWithOpaqueBackground()
    //        tabBar.standardAppearance = appearance
    //        //tabBar.tintColor = .black
    //        tabBar.backgroundColor = .white
    //        tabBar.layer.cornerRadius = 30
    //        tabBar.items?.forEach {
    //            $0.imageInsets = UIEdgeInsets(top: 50, left: 0, bottom: -50, right: 0)
    //        }
    //        tabBar.tintColor = .mainBtn
    //        tabBar.unselectedItemTintColor = .lightGray
    //        self.selectedIndex = 0
    //
    //        // 탭바 높이 설정
    //        let customHeight: CGFloat = 90
    //        var tabFrame = tabBar.frame
    //        tabFrame.size.height = customHeight
    //        tabFrame.origin.y = view.frame.size.height - customHeight
    //        tabBar.frame = tabFrame
    //    }
    //
    //    func setDefaultTabBarImages() {
    //        updateTabBarImages()
    //    }
    //
    //    fileprivate func updateTabBarImages() {
    //        viewControllers = [
    //            createNavController(for: MyPageVC(), image: UIImage(systemName: "house.circle.fill")!),
    //            createNavController(for: PlayingListVC(), image: UIImage(systemName: "magnifyingglass.circle")!),
    //            createNavController(for: DictionaryVC(), image: UIImage(systemName: "plus.circle")!),
    //            createNavController(for: InvitingVC(), image: UIImage(systemName: "envelope.circle")!),
    //            createNavController(for: MyInfoVC(), image: UIImage(systemName: "person.crop.circle")!)
    //        ]
    //    }
    //
    //    fileprivate func createNavController(for rootViewController: UIViewController, image: UIImage) -> UIViewController {
    //        let navController = UINavigationController(rootViewController: rootViewController)
    //        navController.navigationBar.isTranslucent = false
    //        navController.navigationBar.backgroundColor = UIColor(named: "bgColor")
    //        navController.tabBarItem.image = image.withRenderingMode(.alwaysOriginal) // 이미지 크기 유지
    //        navController.interactivePopGestureRecognizer?.delegate = nil // 스와이프 제스처 enable true
    //        return navController
    //    }
    
    
    //
    //    private func configureInvitationViewController(_ viewController: TestViewController, wordbook: Wordbook) {
    //
    //        //viewController.taskname = "new"
    //        viewController.modalPresentationStyle = .fullScreen
    //        viewController.hidesBottomBarWhenPushed = true
    //        viewController.view.isOpaque = false
    //    }
    

    
    private func setupTabBarItems() {
        let mypageVC = MyPageVC()
        mypageVC.tabBarItem.image = UIImage(systemName: "house.circle")
        //mypageVC.tabBarItem.selectedImage = UIImage(named: "globe.fill")
        mypageVC.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: 20, bottom: 10, right: -20)
        
        let playingListVC = PlayingListVC()
        playingListVC.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        playingListVC.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: 20, bottom: 10, right: -20)
        
        let dictionaryVC = DictionaryVC()
        dictionaryVC.tabBarItem.image = UIImage(systemName: "plus.circle")
        dictionaryVC.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: 0, bottom: 10, right: 0)
        
        let invitingVC = InvitingVC()
        invitingVC.tabBarItem.image = UIImage(systemName: "envelope.circle")
        invitingVC.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: -20, bottom: 10, right: 20)
        
        let myInfoVC = MyInfoVC()
        myInfoVC.tabBarItem.image = UIImage(systemName: "person.crop.circle")
        myInfoVC.tabBarItem.imageInsets = UIEdgeInsets(top: -10, left: -20, bottom: 10, right: 20)
        
        self.tabBar.items?.forEach {
            $0.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        }
        
        self.viewControllers = [mypageVC, playingListVC, dictionaryVC, invitingVC, myInfoVC]
        self.tabBar.items?.forEach({ $0.title = nil })
        self.tabBar.backgroundColor = .white
        tabBar.tintColor = .mainBtn
        tabBar.unselectedItemTintColor = .lightGray
        tabBar.layer.cornerRadius = 34
        tabBar.itemPositioning = .centered
        self.selectedIndex = 0
    }
    
}

//extension UIImage {
//    func resizeImage(to size: CGSize) -> UIImage? {
//        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
//        defer { UIGraphicsEndImageContext() }
//        draw(in: CGRect(origin: .zero, size: size))
//        return UIGraphicsGetImageFromCurrentImageContext()
//    }
//}
