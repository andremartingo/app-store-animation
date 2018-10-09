import UIKit

final class HomeViewController: UIViewController {

    let cardView = UIView()
    let coverImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "App Store"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        
        cardView.frame = CGRect(x: 20, y: 255, width: UIScreen.main.bounds.width - 40, height: 250)
        cardView.layer.cornerRadius = 14
        cardView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        cardView.layer.shadowOpacity = 1
        cardView.layer.shadowOffset = CGSize(width: 0, height: 10)
        cardView.layer.shadowRadius = 10
        
        coverImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width - 40, height: 250)
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.image = UIImage(named: "Cover")
        coverImageView.clipsToBounds = true
        coverImageView.layer.cornerRadius = 14
        
        cardView.addSubview(coverImageView)

        view.addSubview(cardView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(cardViewTapped))
        cardView.addGestureRecognizer(tap)
        cardView.isUserInteractionEnabled = true
    }
    
    @objc func cardViewTapped(_ sender: UIButton) {
        
        let list = ListViewController()
        list.transitioningDelegate = self
        present(list, animated: true, completion: nil)
    }
}

extension HomeViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(origin: cardView.frame, flow: .presenting)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return AnimationController(origin: cardView.frame, flow: .dismissing)
    }
}
