//
//  OnboardingScreenVC.swift
//  GreetingApp
//
//  Created by Atul Khandekar on 26/05/23.
//

import UIKit

class OnboardingScreenVC: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak private var onboardingCollectionView: UICollectionView!
    @IBOutlet weak private var pageControl: UIPageControl!
    @IBOutlet weak private var stackView: UIStackView!
    
    //MARK: - Variables
    private var onboardingScreenData = OnboardingScreenData.getOnboardingScreenData()
    weak var coordinator: MainCoordinator?
    
    //MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - UICollectionViewDataSource
extension OnboardingScreenVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        stackView.isHidden = onboardingScreenData.count == AppConstants.onboardingPage
        return onboardingScreenData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppConstants.onboardingScreenCell, for: indexPath) as? OnboardingScreenCell else {
            return UICollectionViewCell()
        }
        cell.configureCell(onboardingScreenData[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension OnboardingScreenVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

//MARK: - UIScrollViewDelegate
extension OnboardingScreenVC: UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}

//MARK: - setupView
extension OnboardingScreenVC {
    private func setupView() {
        onboardingCollectionView.dataSource = self
        onboardingCollectionView.delegate = self
        pageControl.numberOfPages = onboardingScreenData.count
        onboardingCollectionView.register(UINib(nibName: AppConstants.onboardingScreenCell, bundle: nil), forCellWithReuseIdentifier: AppConstants.onboardingScreenCell)
    }
}

//MARK: - Actions
extension OnboardingScreenVC {
    @IBAction private func pageControl(_ sender: UIPageControl) {
        let pageNumber = sender.currentPage
        changePage(pageNumber: pageNumber)
    }
    
    @IBAction private func btnOnClickNextPage(_ sender: UIButton) {
        pageControl.currentPage += AppConstants.onboardingPage
        changePage(pageNumber: pageControl.currentPage)
    }
    
    @IBAction private func btnOnClickSkipToLastPage(_ sender: UIButton) {
        pageControl.currentPage = onboardingScreenData.count - AppConstants.onboardingPage
        changePage(pageNumber: pageControl.currentPage)
    }
}

//MARK: - changePage
extension OnboardingScreenVC {
    private func changePage(pageNumber: Int) {
        var frame = onboardingCollectionView.frame
        frame.origin.x = frame.size.width * CGFloat(pageNumber)
        frame.origin.y = .zero
        onboardingCollectionView.scrollRectToVisible(frame, animated: true)
    }
}
