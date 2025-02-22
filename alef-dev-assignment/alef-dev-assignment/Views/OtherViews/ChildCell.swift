import UIKit

final class ChildCell: UITableViewCell {
    // MARK: - Private properties

    private let mainView = UIView()
    private let nameTextField = CustomTextFieldView()
    private let ageTextField = CustomTextFieldView()
    private let deleteButton = UIButton()

    // MARK: - Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
        setupConfigures()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup methods

    private func setupConstraints() {
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false

        for view in [nameTextField, ageTextField, deleteButton] {
            mainView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),

            nameTextField.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 12),
            nameTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
            nameTextField.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5),

            ageTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 18),
            ageTextField.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 12),
            ageTextField.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 0.5),
            ageTextField.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -12),

            deleteButton.centerYAnchor.constraint(equalTo: nameTextField.centerYAnchor),
            deleteButton.leadingAnchor.constraint(equalTo: nameTextField.trailingAnchor, constant: 18)
        ])
    }

    private func setupConfigures() {
        nameTextField.textForTextField(name: "Имя")
        ageTextField.textForTextField(name: "Возраст")

        deleteButton.setTitle("Удалить", for: .normal)
        deleteButton.setTitleColor(.systemBlue, for: .normal)
        deleteButton.layer.borderWidth = 0
        deleteButton.titleLabel?.font = .systemFont(ofSize: 16)
    }
}
