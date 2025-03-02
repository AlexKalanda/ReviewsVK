import UIKit

final class ReviewsView: UIView {
    
    let tableView = UITableView()
    let refreshControl = UIRefreshControl()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        tableView.frame = bounds.inset(by: safeAreaInsets)
    }
    
}

// MARK: - Private

private extension ReviewsView {
    
    func setupView() {
        backgroundColor = .systemBackground
        setupTableView()
        setupRefreshControl()
    }
    
    func setupTableView() {
        addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.allowsSelection = false
        tableView.register(ReviewCell.self, forCellReuseIdentifier: ReviewCellConfig.reuseId)
        tableView.register(LastCell.self, forCellReuseIdentifier: LastCellConfig.reuseId)
    }
    
    func setupRefreshControl() {
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }
    
    @objc private func refreshData() {
        (self.tableView.dataSource as? ReviewsViewModel)?.getReviews()
    }
}

