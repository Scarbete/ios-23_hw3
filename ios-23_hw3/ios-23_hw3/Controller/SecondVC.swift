import UIKit
import SnapKit


struct Contact {
    var name: String
    var phoneNumber: String
    var image: String
}


class SecondVC: UIViewController {
    
    private let peoplesCellId = "peoplesCellId"
    
    private let peoples: [Contact] = [
        .init(name: "Jane Cooper", phoneNumber: "(270) 555-0117", image: "userImage"),
        .init(name: "Devon Lane", phoneNumber: "(308) 555-0121", image: "userImage"),
        .init(name: "Darrell Steward", phoneNumber: "(684) 555-0102", image: "userImage"),
        .init(name: "Devon Lane", phoneNumber: "(704) 555-0127", image: "userImage"),
        .init(name: "Courtney Henry", phoneNumber: "(505) 555-0125", image: "userImage"),
        .init(name: "Wade Warren", phoneNumber: "(225) 555-0118", image: "userImage"),
        .init(name: "Bessie Cooper", phoneNumber: "(406) 555-0120", image: "userImage"),
        .init(name: "Robert Fox", phoneNumber: "(480) 555-0103", image: "userImage"),
        .init(name: "Jacob Jones", phoneNumber: "(702) 555-0122", image: "userImage"),
        .init(name: "Jenny Wilson", phoneNumber: "(239) 555-0108", image: "userImage")
    ]
    
    private lazy var peoplesTablewView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    private func initUI() {
        view.backgroundColor = .orange
        setupPeoplesTablewView()
        setupNavBar()
    }
    
    private func setupNavBar() {
        let BarButton = UIButton()
        BarButton.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        let leftBarItem = UIBarButtonItem(customView: BarButton)
        
        navigationItem.leftBarButtonItem = leftBarItem
        navigationItem.title = "My Contacts"
        
        BarButton.addTarget(self, action: #selector(barButtonTapped), for: .touchUpInside)
    }
    
    private func setupPeoplesTablewView() {
        view.addSubview(peoplesTablewView)
        
        peoplesTablewView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func barButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}


extension SecondVC: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peoples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: peoplesCellId)
        let item = peoples[indexPath.row]
        
        cell.textLabel?.text = item.name
        cell.imageView?.image = UIImage(named: item.image)
        cell.detailTextLabel?.text = item.phoneNumber
        
        return cell
    }
    
}
