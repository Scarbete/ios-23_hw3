import UIKit
import SnapKit



class ViewController: UIViewController {
    
    private lazy var loginLabel: UILabel = MakerView.chared.createLabel(text: "Login", fontSize: 18, fontWeight: .bold)
    
    private lazy var personImage: UIImageView = MakerView.chared.createImage(image: UIImage(systemName: "person"))
    
    private lazy var loginDescLabel: UILabel = MakerView.chared.createLabel(text: "Welcome back , Rohit thakur", textColor: UIColor(hex: "5B5B5B"))
    
    private lazy var mainImage: UIImageView = MakerView.chared.createImage(image: UIImage(named: "mainImage"))
    
    private lazy var mainTitle: UILabel = MakerView.chared.createLabel(
        text: "Enter Your Mobile Number", textColor: UIColor(hex: "F2796B"), fontSize: 17, fontWeight: .bold
    )
    
    private lazy var numberTF: UITextField = MakerView.chared.createTF(
        textColor: UIColor(hex: "545151"), placeholder: "Enter Number", placeholderColor: UIColor(hex: "#545151"), backgroundColor: .white,
        cornerRadius: 10, borderWidth: 1, leftView: true, rightView: true
    )
    
    private lazy var changeNumberLabel: UILabel = MakerView.chared.createLabel(text: "Change Number ?", fontSize: 12)
    
    private lazy var loginButton: UIButton = MakerView.chared.createButton(
        text: "Login", textColor: .white, fontSize: 15, fontWeight: .bold, cornerRadius: 10,backgroundColor: UIColor(hex: "F2796B")
    )
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {
        view.backgroundColor = UIColor(hex: "#F6F6F6")
        setupLoginLabel()
        setupPersonImage()
        setupLoginDescLabel()
        setupMainImage()
        setupMainTitle()
        setupNumberTF()
        setupChangeNumberLabel()
        setupLoginButton()
    }
    
    
    
    private func setupLoginLabel() {
        view.addSubview(loginLabel)
        
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalToSuperview().offset(24)
        }
    }
    
    private func setupPersonImage() {
        view.addSubview(personImage)

        personImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.leading.equalTo(loginLabel.snp.trailing).offset(4)
            make.width.height.equalTo(20)
        }
    }

    private func setupLoginDescLabel() {
        view.addSubview(loginDescLabel)

        loginDescLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(loginLabel.snp.bottom).offset(3)
        }
    }
    
    private func setupMainImage() {
        view.addSubview(mainImage)

        mainImage.snp.makeConstraints { make in
            make.top.equalTo(loginDescLabel.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(296)
            make.height.equalTo(231)
        }
    }
    
    private func setupMainTitle() {
        view.addSubview(mainTitle)

        mainTitle.snp.makeConstraints { make in
            make.top.equalTo(mainImage.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
        }
    }
    
    private func setupNumberTF() {
        view.addSubview(numberTF)

        numberTF.snp.makeConstraints { make in
            make.top.equalTo(mainTitle.snp.bottom).offset(31)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(43)
        }
        
        numberTF.delegate = self
        numberTF.keyboardType = .numberPad
    }
    
    private func setupChangeNumberLabel() {
        view.addSubview(changeNumberLabel)

        changeNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(numberTF.snp.bottom).offset(11)
            make.trailing.equalToSuperview().offset(-41)
        }
    }
    
    private func setupLoginButton() {
        view.addSubview(loginButton)

        loginButton.snp.makeConstraints { make in
            make.top.equalTo(changeNumberLabel.snp.bottom).offset(35)
            make.horizontalEdges.equalToSuperview().inset(24)
            make.height.equalTo(43)
        }
        
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
    }
    
//    private func setup LoginLabel() {
//        view.addSubview(loginLabel)
//
//        loginLabel.snp.makeConstraints { make in
//            make
//        }
//    }
    
    private func editTf(tf: UITextField, devastate: Bool, placeholder: String, borderColor: UIColor, placeholderColor: UIColor) {
        if devastate == true {
            tf.text = ""
        }
        numberTF.layer.borderColor = borderColor.cgColor
        numberTF.attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: placeholderColor]
        )
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        let vc = SecondVC()
        
        if numberTF.hasText, let text = numberTF.text {
            if text.hasPrefix("996") && text.count == 12 {
                editTf(tf: numberTF, devastate: true, placeholder: "Enter Number", borderColor: .clear, placeholderColor: UIColor(hex: "545151"))
                navigationController?.pushViewController(vc, animated: true)
            }
            else {
                editTf(tf: numberTF, devastate: true, placeholder: "Enter 996 and 9 symbols", borderColor: .red, placeholderColor: .red)
            }
        }
        else {
            editTf(tf: numberTF, devastate: false, placeholder: "Fill the phone number", borderColor: .red, placeholderColor: .red)
        }
    }

}



extension ViewController: UITextFieldDelegate {
    
    func textField(_ sender: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        return allowedCharacters.isSuperset(of: characterSet)
    }
    
}
