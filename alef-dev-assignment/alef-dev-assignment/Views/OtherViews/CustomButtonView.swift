import UIKit

final class CustomButtonView: UIView {
    // MARK: - Private properties

    private let backgroundView = UIView()
    private let stack = UIStackView()
    private let plusImageView = UIImageView()
    private let addChildLabel = UILabel()

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
        setupConfigures()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.layer.cornerRadius = backgroundView.frame.size.height / 2
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup methods

    private func setupConstraints() {
        addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false

        backgroundView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            stack.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 12),
            stack.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 18),
            stack.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -18),
            stack.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -12),
        ])
    }

    private func setupConfigures() {
        backgroundView.layer.borderColor = UIColor.systemBlue.cgColor
        backgroundView.layer.borderWidth = 1

        for view in [plusImageView, addChildLabel] {
            stack.addArrangedSubview(view)
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .fill
            stack.spacing = 5
        }

        plusImageView.image = UIImage(systemName: "plus")

        addChildLabel.text = "Добавить ребенка"
        addChildLabel.textColor = .systemBlue
    }
}
