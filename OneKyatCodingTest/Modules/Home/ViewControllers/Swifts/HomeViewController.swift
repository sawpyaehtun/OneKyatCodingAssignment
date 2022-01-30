//
//  HomeViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 29/01/2022.
//

import UIKit
import FSPagerView

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pagerView: FSPagerView!
    @IBOutlet weak var pageControl: FSPageControl!
    
    var presenter : HomePresentation?
    let tfSearch : UITextField = UITextField()
    var itemList : [ItemVO] = []
    var sliderImageList : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.getAllItemList()
        presenter?.getSliderImages()
    }
    
    override func setupUI() {
        super.setupUI()
        setupCollectionView()
        setupTextFieldForSearch()
        setupBtnLogout()
        setupPagerView()
        setupPageControl()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNavigationColor()
    }
    
    private func setupPageControl(){
        pageControl.backgroundColor = .background_gray
        
        pageControl.setFillColor(UIColor.primary_green, for: .selected)
        pageControl.setFillColor(.lightGray, for: .normal)
    }
    
    private func setupPagerView(){
        pagerView.dataSource = self
        pagerView.delegate = self
        pagerView.automaticSlidingInterval = 5.0
        pagerView.isInfinite = true
        pagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerForCells(cells: ItemCollectionViewCell.self)
    }
    
    private func setupBtnLogout(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "logout"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapLogout))
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    @objc func didTapLogout(){
        presenter?.didTapLogout()
    }
    
    private func setupTextFieldForSearch() {
        tfSearch.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 36)
        tfSearch.layer.cornerRadius = 5
        tfSearch.bounds.inset(by: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 10))
        tfSearch.backgroundColor = UIColor(white: 1, alpha: 0.4)
        tfSearch.tintColor = .primary_green
        tfSearch.textColor = .primary_green
        tfSearch.placeholder = "Search at OneKyat"
        tfSearch.placeholderColor(color: .primary_green)
        tfSearch.backgroundColor = .white
        tfSearch.font = .Inter.Medium.font(size: 14)
        navigationItem.titleView = tfSearch
        
        tfSearch.leftViewMode = UITextField.ViewMode.always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        let image = UIImage(named: "search")
        imageView.image = image
        tfSearch.leftView = imageView
    }

}

// MARK: - CollectionView delegate and dataSource
extension HomeViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return itemCell(indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.size.width) / 2
        let cellHeight = cellWidth * 1.3
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = itemList[indexPath.row]
        presenter?.didTapItem(item: item)
    }
}

// MARK: - pagerView delegate and dataSource
extension HomeViewController : FSPagerViewDelegate , FSPagerViewDataSource {
    
    // MARK:- FSPagerView DataSource
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return sliderImageList.count
    }
    
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "cell", at: index)
        cell.imageView?.image = UIImage(named: sliderImageList[index])        
        cell.imageView?.contentMode = .scaleAspectFill
        return cell
    }
    
    // MARK:- FSPagerView Delegate
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: true)
        pagerView.scrollToItem(at: index, animated: true)
    }
    
    func pagerViewWillEndDragging(_ pagerView: FSPagerView, targetIndex: Int) {
        pageControl.currentPage = targetIndex
    }
    
    func pagerViewDidEndScrollAnimation(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
    
}

// MARK: - items for collectionView
extension HomeViewController {
    private func itemCell(indexPath : IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeReuseCell(type: ItemCollectionViewCell.self, indexPath: indexPath)
        let item = itemList[indexPath.row]
        cell.setupItem(image: item.image ?? "", name: item.name ?? "", price: item.price ?? 0)
        return cell
    }
}

// MARK: - View
extension HomeViewController : HomeView {
    func showItemList(itemList: [ItemVO]) {
        self.itemList = itemList
        collectionView.reloadData()
    }
    
    func showBannerSlider(imageList: [String]) {
        self.sliderImageList = imageList
        pageControl.numberOfPages = imageList.count
        pagerView.reloadData()
    }
    
    func showLogoutConfirmationAlert() {
        AlertManager.showAlert("Logout", message: "Are you sure want to logout?", confirmTitle: "Log out", confirmAction: {[unowned self] in
            presenter?.didConfirmLogout()
        }, cancelButtonTitle: "Cancel", inViewController: self)
    }
}
