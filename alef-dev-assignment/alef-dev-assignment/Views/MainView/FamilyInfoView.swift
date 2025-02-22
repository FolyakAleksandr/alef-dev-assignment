import UIKit

final class FamilyInfoView: UIViewController {
    // MARK: - Private properties

    private let headerView = PersonalInfoView()
    private let headerTableView = HeaderTableView()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }

    // MARK: - Setup methods

    private func setupConstraints() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(headerTableView)
        headerTableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            headerTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 24),
            headerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
        ])
    }
}
