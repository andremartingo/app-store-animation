import UIKit

class AnimationController: NSObject, UIViewControllerAnimatedTransitioning {

    enum Flow {
        case presenting
        case dismissing
    }

    private let origin: CGRect
    private let flow: Flow


    init(origin: CGRect, flow: Flow) {
        self.origin = origin
        self.flow = flow
        super.init()
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

        switch flow {
        case .presenting: present(context: transitionContext)
        case .dismissing: dismiss(context: transitionContext)
        }
    }

    private func present(context transitionContext: UIViewControllerContextTransitioning) {

        guard
            let from = transitionContext.viewController(forKey: .from),
            let to = transitionContext.viewController(forKey: .to),
            let snapshot = to.view.snapshotView(afterScreenUpdates: true)
            else { return }


        let container = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: to)

        snapshot.frame = origin
        snapshot.clipsToBounds = true
        snapshot.backgroundColor = .blue
        to.view.clipsToBounds = true
        to.view.isHidden = true
        container.addSubview(to.view)
        container.addSubview(snapshot)

        let duration = transitionDuration(using: transitionContext)

        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
            snapshot.frame = finalFrame
        }) { finished in
            to.view.frame = finalFrame
            to.view.isHidden = false
            snapshot.removeFromSuperview()
            transitionContext.completeTransition(transitionContext.transitionWasCancelled == false)
        }
    }

    private func dismiss(context transitionContext: UIViewControllerContextTransitioning) {

        guard
            let from = transitionContext.viewController(forKey: .from),
            let to = transitionContext.viewController(forKey: .to),
            let snapshot = from.view.snapshotView(afterScreenUpdates: true)
            else { return }


        let container = transitionContext.containerView
        let finalFrame = transitionContext.finalFrame(for: to)

//        snapshot.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 420)
        snapshot.clipsToBounds = true
        snapshot.backgroundColor = .blue

        container.insertSubview(to.view, at: 0)

        container.addSubview(snapshot)
        from.view.isHidden = true

        let duration = transitionDuration(using: transitionContext)

        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.3, options: [], animations: {
            snapshot.frame = self.origin

        }) { finished in
            to.view.frame = finalFrame
            to.view.isHidden = false
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                snapshot.alpha = 0
            }, completion: { _ in
                snapshot.removeFromSuperview()
                transitionContext.completeTransition(transitionContext.transitionWasCancelled == false)
            })



        }
    }

}

