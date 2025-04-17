//
//  SingleImageViewController.swift
//  ImageFeed
//
//  Created by Валерий on 01.04.2025.
//

import UIKit

final class SingleImageViewController: UIViewController {
    var image: UIImage? {
        didSet {
            guard isViewLoaded else { return }
            imageView.image = image
            if let image {
                imageView.frame.size = image.size
                rescaleAndCenterImageInScrollView(image: image)
            }
        }
    }
    
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.minimumZoomScale = 0.1
        scrollView.maximumZoomScale = 1.25
        
        imageView.image = image
        if let image {
            imageView.frame.size = image.size
            rescaleAndCenterImageInScrollView(image: image)
        }
    }
    
    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func didTapShareButton(_ sender: Any) {
        guard let image else { return }
        let share = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        present(share, animated: true, completion: nil)
    }
    
    private func rescaleAndCenterImageInScrollView(image: UIImage) {
        let minZoomScale = scrollView.minimumZoomScale
        let maxZoomScale = scrollView.maximumZoomScale
        view.layoutIfNeeded()
        let visibleRectSize = scrollView.bounds.size
        let imageSize = image.size
        let hScale = visibleRectSize.width / imageSize.width
        let vScale = visibleRectSize.height / imageSize.height
        let scale = min(maxZoomScale, max(minZoomScale, min(hScale, vScale)))
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
        let newContentSize = scrollView.contentSize
        let x = (newContentSize.width - visibleRectSize.width) / 2
        let y = (newContentSize.height - visibleRectSize.height) / 2
        scrollView.setContentOffset(CGPoint(x: x, y: y), animated: false)
    }
    
    private func rescaleAndCenterImageInScrollView(scale: CGFloat) {
        let scale = min(scrollView.maximumZoomScale, max(scrollView.minimumZoomScale, scale))
        scrollView.setZoomScale(scale, animated: false)
        scrollView.layoutIfNeeded()
        let newContentSize = scrollView.contentSize
        scrollView.contentInset.top = (scrollView.bounds.size.height - newContentSize.height) / 2
        scrollView.contentInset.left = (scrollView.bounds.size.width - newContentSize.width) / 2
    }
}

extension SingleImageViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        rescaleAndCenterImageInScrollView(scale: scale)
    }
}
