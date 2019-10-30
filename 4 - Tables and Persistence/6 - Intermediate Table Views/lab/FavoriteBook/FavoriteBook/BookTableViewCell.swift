//
//  BookTableViewCell.swift
//  FavoriteBooks
//
//  Created by Student User on 9/11/19.
//

import UIKit

class BookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var lengthLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with book: Book){
        titleLabel.text = book.title
        genreLabel.text = book.genre
        authorLabel.text = book.author
        lengthLabel.text = book.length
    }

}
