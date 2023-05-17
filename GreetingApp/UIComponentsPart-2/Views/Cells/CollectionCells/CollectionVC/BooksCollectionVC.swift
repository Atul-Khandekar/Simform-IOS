
import UIKit

class BooksCollectionVC: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var booksCollection: UICollectionView!
    
    //MARK: - Variables
    private var booksAndEmails = BooksAndEmails.getBooksAndEmails()
    private var coverOfBooks = BooksAndEmails.getBooks()
    private var refreshControl = UIRefreshControl()
    
    //MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - UICollectionViewDataSource
extension BooksCollectionVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return booksAndEmails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksAndEmails[section].rows.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.section == BooksAndEmailsSections.emails.rawValue {
            
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.EmailCell, for: indexPath) as? EmailCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(data: booksAndEmails[indexPath.section].rows[indexPath.row])
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.BooksCollectionCell, for: indexPath) as? BooksCollectionCell else {
            return UICollectionViewCell()
        }
        
        cell.configureCell(data: booksAndEmails[indexPath.section].rows[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if kind == UICollectionView.elementKindSectionFooter {
            guard let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AppConstants.FooterCell, for: indexPath) as? FooterCell else {
                return UICollectionReusableView()
            }
            footer.configureCell()
            return footer
        }
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppConstants.HeaderCell, for: indexPath) as? HeaderCell else {
            return UICollectionReusableView()
        }
        
        header.configureCell()
        return header
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension BooksCollectionVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.section == BooksAndEmailsSections.emails.rawValue {
            
            guard let item = booksAndEmails[indexPath.section].rows[indexPath.row] as? String else {
                return CGSize(width: 0, height: 0)
            }
            
            let itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: AppConstants.FontSizeForEmail)
            ])
            
            return itemSize
        }
        
        return CGSize(width: self.view.frame.width/4 , height: self.view.frame.height/6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 100)
    }
    
}

//MARK: - setupView
extension BooksCollectionVC {
    
    private func setupView() {
        booksCollection.dataSource = self
        booksCollection.delegate = self
        booksCollection.register(UINib(nibName: AppConstants.BooksCollectionCell, bundle: nil), forCellWithReuseIdentifier: AppConstants.BooksCollectionCell)
        booksCollection.register(UINib(nibName: AppConstants.HeaderCell, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppConstants.HeaderCell)
        booksCollection.register(UINib(nibName: AppConstants.FooterCell, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: AppConstants.FooterCell)
        booksCollection.register(UINib(nibName: AppConstants.EmailCell, bundle: nil), forCellWithReuseIdentifier: AppConstants.EmailCell)
        booksCollection.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        
    }
}

//MARK: - @objc Methods
extension BooksCollectionVC {
    @objc
    func handleRefresh() {
        booksAndEmails[BooksAndEmailsSections.books.rawValue].rows.append(UIImage(imageLiteralResourceName: UIImage.WingsOfFires))
        refreshControl.endRefreshing()
        booksCollection.reloadData()
    }
}
