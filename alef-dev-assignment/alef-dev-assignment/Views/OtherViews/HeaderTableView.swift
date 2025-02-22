import UIKit

final class HeaderTableView: UIView {
    // MARK: - Private properties

    private let backgroundView = UIView()
    private let titleLabel = UILabel()
    private let addButton = CustomButtonView()

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

        for view in [titleLabel, addButton] {
            backgroundView.addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            titleLabel.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 12),
            titleLabel.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),

            addButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -12),
            addButton.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor)
        ])
    }

    private func setupConfigures() {
        titleLabel.text = "Дети (макс. 5)"
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 20)
    }
}
