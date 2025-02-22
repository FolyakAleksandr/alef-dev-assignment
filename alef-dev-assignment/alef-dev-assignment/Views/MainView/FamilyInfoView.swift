import UIKit

final class FamilyInfoView: UIViewController {
    // MARK: - Private properties

    private let headerView = PersonalInfoView()
    private let headerTableView = HeaderTableView()
    private let childsTableView = UITableView()
    private let removeButton = UIButton()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
        setupConfigures()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        removeButton.layer.cornerRadius = removeButton.frame.size.height / 2
    }

    // MARK: - Setup methods

    private func setupConstraints() {
        view.backgroundColor = .white
        view.addSubview(headerView)
        headerView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(headerTableView)
        headerTableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(childsTableView)
        childsTableView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(removeButton)
        removeButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            headerTableView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 0),
            headerTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            headerTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            headerTableView.heightAnchor.constraint(equalToConstant: 60),

            removeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            removeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            removeButton.heightAnchor.constraint(equalTo: headerTableView.heightAnchor, multiplier: 0.7),
            removeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            childsTableView.topAnchor.constraint(equalTo: headerTableView.bottomAnchor, constant: 6),
            childsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            childsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            childsTableView.bottomAnchor.constraint(equalTo: removeButton.topAnchor, constant: -18),
        ])
    }

    private func setupConfigures() {
        removeButton.setTitle("Очистить", for: .normal)
        removeButton.setTitleColor(.systemRed, for: .normal)
        removeButton.layer.borderColor = UIColor.systemRed.cgColor
        removeButton.layer.borderWidth = 1

        childsTableView.dataSource = self
        childsTableView.delegate = self
        childsTableView.register(ChildCell.self, forCellReuseIdentifier: "ChildCell")
        childsTableView.showsVerticalScrollIndicator = false
    }
}

// MARK: - Extensions

extension FamilyInfoView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChildCell", for: indexPath) as? ChildCell else { return UITableViewCell() }
        return cell
    }
}
