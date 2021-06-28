
import UIKit

class HeroTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lbName: UILabel!
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func prepareCell(with hero: Hero) {
        lbName.text = hero.name
    }
    
    
    
}
