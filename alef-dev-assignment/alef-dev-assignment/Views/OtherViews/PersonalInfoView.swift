import UIKit

final class PersonalInfoView: UIView {
    // MARK: - Private properties

    private let backgroundView = UIView()
    private let titleLabel = UILabel()
    private let nameTextField = CustomTextFieldView()
    private let ageTextField = CustomTextFieldView()

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
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        for view in [titleLabel, nameTextField, ageTextField] {
            backgroundView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 12),

            nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            nameTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 12),
            nameTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -12),

            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 12),
            ageTextField.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 12),
            ageTextField.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -12),
            ageTextField.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -12)
        ])
    }

    private func setupConfigures() {
        titleLabel.text = "Персональные данные"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 22)
        
        nameTextField.textForTextField(name: "Имя")
        ageTextField.textForTextField(name: "Возраст")
    }
}
