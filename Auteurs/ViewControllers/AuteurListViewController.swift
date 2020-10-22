
import UIKit

class AuteurListViewController: UIViewController {
  let auteurs = Auteur.auteursFromBundle()
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 34, weight: .bold) ]
    navigationItem.largeTitleDisplayMode = .automatic
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 600
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destination = segue.destination as? AuteurDetailViewController,
      let indexPath = tableView.indexPathForSelectedRow {
      destination.selectedAuteur = auteurs[indexPath.row]
    }
  }
}

extension AuteurListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return auteurs.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(
      withIdentifier: "Cell",
      for: indexPath) as! AuteurTableViewCell
    let auteur = auteurs[indexPath.row]
    cell.bioLabel.text = auteur.bio
    cell.auteurImageView.image = UIImage(named: auteur.image)
    cell.nameLabel.text = auteur.name
    cell.source.text = auteur.source
    cell.bioLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
    cell.nameLabel.textColor = .white
    cell.bioLabel.textColor = UIColor(red:0.75, green:0.75, blue:0.75, alpha:1.0)
    cell.source.textColor = UIColor(red:0.74, green:0.74, blue:0.74, alpha:1.0)
    cell.source.font = UIFont.italicSystemFont(ofSize: cell.source.font.pointSize)
    cell.nameLabel.textAlignment = .center
    cell.selectionStyle = .none
    cell.auteurImageView.layer.cornerRadius = cell.auteurImageView.frame.size.width / 2
    return cell
  }
}
