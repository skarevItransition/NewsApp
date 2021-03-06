//
//  SourcesViewController.swift
//  NewsApp
//
//  Created by skarev on 16.04.2021.
//

import RxSwift

final class SourcesViewController: UIViewController {

    @IBOutlet private weak var maxLabel: UILabel!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var doneButton: UIButton!

    var viewModel: SourcesViewModelProtocol?
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupButtons()
    }
}

// MARK: - Setup UI
private extension SourcesViewController {
    func setupTableView() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")

        viewModel?.fetchSources()
            .observe(on: MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "DefaultCell")) { _, source, cell in
                cell.textLabel?.text = source.name
        }.disposed(by: disposeBag)
    }

    func setupButtons() {
        doneButton.rx.tap.subscribe { [unowned self] _ in
            self.dismiss(animated: true)
        }.disposed(by: disposeBag)
    }
}
