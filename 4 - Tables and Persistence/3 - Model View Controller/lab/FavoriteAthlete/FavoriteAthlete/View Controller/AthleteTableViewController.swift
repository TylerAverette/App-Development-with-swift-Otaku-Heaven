import UIKit

class AthleteTableViewController: UITableViewController {
    
    struct PropertyKeys {
        static let athleteCell = "AthleteCell"
        static let editAthleteSegue = "EditAthlete"
    }
    
    var athletes: [Athlete] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return athletes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKeys.athleteCell, for: indexPath)
        
        let athlete = athletes[indexPath.row]
        cell.textLabel?.text = athlete.name
        cell.detailTextLabel?.text = athlete.description
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let vc : AthleteFormViewController = segue.destination as! AthleteFormViewController //Yessick Solution ^
        
        if let athleteViewController = segue.destination as? AthleteFormViewController{
            if let indecxPath = tableView.indexPathForSelectedRow, segue.identifier == PropertyKeys.editAthleteSegue{
                athleteViewController.athlete = athletes[indecxPath.row]
            }
        }
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue){
        guard let athleteForm = segue.source as? AthleteFormViewController, let athlete = athleteForm.athlete else{return}
        
        if let indexPath = tableView.indexPathForSelectedRow{
            athletes.remove(at: indexPath.row)
            athletes.insert(athlete, at: indexPath.row)
            tableView.deselectRow(at: indexPath, animated: true)}
            else{ athletes.append(athlete) }
        }
    


    /*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
 */

}
