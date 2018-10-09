import UIKit

final class ListViewController: UIViewController {
    
    let coverImageView = UIImageView()


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 20, y: 420, width: UIScreen.main.bounds.width - 20, height: 300)
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur diam orci, porta vel lorem sit amet, tempor blandit odio. Quisque dictum egestas diam sed vehicula. Etiam id leo justo. Nam sit amet metus gravida, ornare nulla nec, egestas massa. Phasellus venenatis, odio dignissim eleifend placerat, urna eros ultricies dui, vitae porta leo quam et ex. Curabitur consectetur porta libero, in cursus nibh consequat id. Phasellus malesuada sit amet enim nec molestie. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nam faucibus, purus at tristique tincidunt, risus odio tempus lectus, eu elementum ipsum diam sed dolor.Praesent vitae enim tempus sapien facilisis lacinia. Suspendisse consectetur eleifend risus, lobortis viverra arcu laoreet in. Sed nec enim felis. Cras aliquet maximus cursus. Maecenas sit amet auctor erat, at gravida mauris. Sed ornare eget turpis id maximus. Sed euismod urna sit amet odio porta luctus. Mauris ornare in urna sed ultrices. Ut pellentesque massa ac sapien aliquet lobortis. In orci nisl, accumsan at auctor nec, viverra sed nunc.Cras commodo accumsan congue. Sed lacus turpis, laoreet ac ornare sed, interdum id justo. Curabitur egestas arcu sed justo convallis, in pretium justo rutrum. Nulla facilisi. Curabitur convallis, urna nec dictum congue, ex ligula finibus ligula, bibendum dignissim dui turpis et justo. Sed vehicula augue ante, vitae rhoncus neque facilisis quis. Pellentesque id magna finibus, interdum velit sit amet, tincidunt tellus. Aliquam erat volutpat.Nulla facilisi. Maecenas efficitur molestie interdum. Donec et iaculis ipsum. In nec porta nisi. Mauris venenatis sem non mi aliquet, ultricies gravida tortor cursus. Suspendisse eget magna fringilla augue rutrum blandit. Vivamus quis libero velit. Mauris egestas posuere orci euismod molestie. Nam ut nisi quis felis varius bibendum sit amet vitae sem. Nullam dapibus arcu ex, et pharetra nunc dignissim id. Pellentesque maximus velit non massa mattis sodales. Maecenas aliquet augue lectus, eget ultricies quam mattis in. Etiam tellus risus, hendrerit eu est ornare, suscipit vehicula erat."
        
        label.numberOfLines = 10
        label.textColor = .black

        let button = UIButton()
        button.setImage(UIImage(named: "Close"), for: .normal)
        button.frame = CGRect(x: UIScreen.main.bounds.width - 40, y: 60, width: 28, height: 28)
        button.addTarget(self, action: #selector(close(_:)), for: .touchUpInside)

        view.addSubview(label)
        view.addSubview(button)
        view.addSubview(coverImageView)
        view.sendSubviewToBack(coverImageView)
//        coverImageView.addSubview(button)
        
        coverImageView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 420)
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.image = UIImage(named: "Cover")
        coverImageView.clipsToBounds = true
        coverImageView.layer.cornerRadius = 0
        
    }

    @objc func close(_ sender: UIButton) {
        print("close")
        dismiss(animated: true, completion: nil)
    }
}


