//
//  ItemDetailViewController.swift
//  OneKyatCodingTest
//
//  Created by saw pyaehtun on 28/01/2022.
//

import UIKit
import SnapKit

class ItemDetailViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var topConstraintTableView: NSLayoutConstraint!
    @IBOutlet weak var btnFavourite: UIButton!
    @IBOutlet weak var btnMessage: UIButton!
    @IBOutlet weak var btnSend: UIButton!
    @IBOutlet weak var tfMessage: UITextField!
    @IBOutlet weak var btnCall: UIButton!
    @IBOutlet weak var lblFavCount: UILabel!
    
    var statusBarFrame: CGRect!
    var statusBarView: UIView!
    var offset: CGFloat!
    var headerImgView : UIImageView = UIImageView()
    var tableHeaderView : UIView = UIView()
    let heightTableViewHeader : CGFloat = UIScreen.main.bounds.width * 0.7
    var presenter : ItemDetailPresentation?
    var item : ItemVO!
    let phoneNumber : String = "09420000002"
    
    private enum CellType : Int {
        case itemNameAndPrice = 0
        case sellerInfo = 1
        case itemInfo = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func setupUI() {
        super.setupUI()
        setupTableView()
        lblFavCount.font = .Inter.Medium.font(size: 14)
        tfMessage.font = .Inter.Medium.font(size: 14)
    }
    
    override func setNavigationColor() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        statusBarFrame = UIApplication.shared.windows[0].windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        if is_iPhone12Mini() {
            statusBarFrame.size.height = statusBarFrame.size.height + 10
        }
        
        statusBarView = UIView(frame: statusBarFrame)
        statusBarView.isOpaque = false
        statusBarView.backgroundColor = .clear
        view.addSubview(statusBarView)
    }
    
    private func setupTableView(){
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.bounces = false
        
        tableView.registerForCells(cells: ItemNameAndPriceTableViewCell.self,
                                   SellerInfoTableViewCell.self,
                                   ItemInfoTableViewCell.self)
        
        setupTableHeaderView()
        
        tableView.reloadData()
    }
    
    private func setupTableHeaderView(){
        setupHeaderImgView()
        setupGradiantViewForTableHeader()
        tableView.tableHeaderView = tableHeaderView
    }
    
    private func setupHeaderImgView(){
        // preparing for header image
        headerImgView.image = UIImage(named: "car")
        headerImgView.contentMode = .scaleAspectFill
        
        // adding header img view to tableView header
        tableHeaderView.addSubview(headerImgView)
        tableHeaderView.clipsToBounds = true
        
        // make constraint headerImgView
        headerImgView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        
    }
    
    private func setupGradiantViewForTableHeader(){
        /* we need gradiant view for the white color image */
        
        // setup gradiantView
        let gradiantView = LDGradientView()
        gradiantView.startColor = UIColor.black.withAlphaComponent(0.5)
        gradiantView.endColor = UIColor.clear
        
        // adding gradiantView
        tableHeaderView.addSubview(gradiantView)
        
        // make constraint gradiantView
        gradiantView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        if let headerView = tableView.tableHeaderView {
            
            var headerFrame = headerView.frame
            
            //Comparison necessary to avoid infinite loop
            if heightTableViewHeader != headerFrame.size.height {
                headerFrame.size.height = heightTableViewHeader
                headerView.frame = headerFrame
                tableView.tableHeaderView = headerView
            }
        }
    }
    
    override func bindData() {
        super.bindData()
        btnCall.rx.tap.bind{ [unowned self] in
            phoneNumber.makeACall()
        }.disposed(by: disposableBag)
    }
    
}

// MARK: - tableView delegate and dataSource
extension ItemDetailViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = CellType.init(rawValue: indexPath.row)
        switch cellType {
        case .itemNameAndPrice:
            return itemNameAndPriceCell(indexPath: indexPath)
        case .sellerInfo:
            return sellerInfoCell(indexPath: indexPath)
//            return soeCell(indexPath: indexPath)
        case .itemInfo:
            return itemInfoCell(indexPath: indexPath)
        default:
            return UITableViewCell()
        }
    }
    
}

// MARK: - Cells for tableView
extension ItemDetailViewController {
    
    private func itemNameAndPriceCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: ItemNameAndPriceTableViewCell.self, indexPath: indexPath)
        cell.setupCell(name: item.name ?? "", price: item.price ?? 0)
        return cell
    }
    
    private func sellerInfoCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: SellerInfoTableViewCell.self, indexPath: indexPath)
        if let seller = item.seller {
            cell.setupCell(seller: seller)
        }
        return cell
    }
    
    private func itemInfoCell(indexPath : IndexPath) -> UITableViewCell {
        let cell = tableView.dequeReuseCell(type: ItemInfoTableViewCell.self, indexPath: indexPath)
        cell.setupCell(info: item.desc ?? "")
        return cell
    }
        
}

// MARK: - scroll delegate
extension ItemDetailViewController {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
                        
        if navigationController == nil { return }
        //Mark the end of the offset
        let targetHeight = tableHeaderView.bounds.height - (navigationController?.navigationBar.bounds.height)! - statusBarFrame.height
        
        //calculate how much has been scrolled relative to the targetHeight
        offset = scrollView.contentOffset.y / targetHeight
        
        
        //cap offset to 1 to conform to UIColor alpha parameter
        if offset > 1 {offset = 1}
        
        tableView.contentInsetAdjustmentBehavior = offset >= 1 ? .automatic : .never
        
        let clearToWhite = UIColor.primary_green.withAlphaComponent(offset)
        
        navigationController?.navigationBar.backgroundColor = clearToWhite
        
        statusBarView!.backgroundColor = clearToWhite
        
    }

}

// MARK: -  View
extension ItemDetailViewController : ItemDetailView {
    
}
