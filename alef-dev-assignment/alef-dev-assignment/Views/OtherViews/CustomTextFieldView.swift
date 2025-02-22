import UIKit

final class CustomTextFieldView: UIView {
    // MARK: - Private properties

    private let borderView = UIView()
    private let nameLabel = UILabel()
    private let textField = UITextField()
    
    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupConfigures()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup methods
    
    private func setupConstraints() {
        addSubview(borderView)
        borderView.translatesAutoresizingMaskIntoConstraints = false
        
        for view in [nameLabel, textField] {
            borderView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            borderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            nameLabel.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 12),
            nameLabel.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 20),
            
            textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 6),
            textField.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -20),
            textField.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -12),
        ])
    }
    
    private func setupConfigures() {
        borderView.layer.borderColor = UIColor.systemGray5.cgColor
        borderView.layer.borderWidth = 1
        borderView.layer.cornerRadius = 7
        
        nameLabel.textColor = .gray
        nameLabel.textAlignment = .left
        nameLabel.font = .systemFont(ofSize: 16)
        
        textField.font = .systemFont(ofSize: 18)
        textField.textColor = .black
        
    }
    
    func textForTextField(name: String) {
        nameLabel.text = name
    }
}
