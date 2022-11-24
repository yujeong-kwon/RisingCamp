//
//  MovieTableViewCell.swift
//  RC_week6
//
//  Created by 권유정 on 2022/10/23.
//

import UIKit

protocol starImageChangeDelegate{
    func updateTableViewUI(newValue: Movie, index: Int)
    func updateData(newValue:Movie, index: Int)
}

class MovieTableViewCell: UITableViewCell {
    private var  movie: Movie!
    private var isFavorite: Bool = false
    private var dataModel: SettingMovie = SettingMovie.shared
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var director: UILabel!
    @IBOutlet weak var actor: UILabel!
    @IBOutlet weak var userRating: UILabel!
    @IBOutlet weak var Mimage: UIImageView!
    @IBOutlet weak var starBtn: UIButton!
    
    var starImageChangeDelegate: starImageChangeDelegate?
    var Index: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        //contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20))
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public func getList(data: Movie){
        self.movie = data
        self.isFavorite = data.star
        updateUI(data: data)
        
        //title.text = data.title
        //director.text = data.director
        //actor.text = data.actor
        //userRating.text = data.userRating
        //let url = URL(string: data.image)
        //Mimage.load(url: url!)
        //if(data.star == true){
        //    starBtn.setImage(UIImage(named: "starSelected.png"), for: .normal)
            
        //}else{
       //     starBtn.setImage(UIImage(named: "star.png"), for: .normal)
        //}
        
    }
    public func updateUI(data: Movie){
        title.text = data.title
        director.text = data.director
        actor.text = data.actor
        userRating.text = data.userRating
        let url = URL(string: data.image)
        Mimage.load(url: url!)
        if(isFavorite){
            starBtn.setImage(UIImage(named: "starSelected.png"), for: .normal)
        }else{
            starBtn.setImage(UIImage(named: "star.png"), for: .normal)
        }
    }
    
    @IBAction func starButtonDidTap(_ sender: UIButton) {
        if(self.movie.star==true){
            self.movie.star = false
        }else if(self.movie.star==false){
            self.movie.star = true
        }
        //dataModel.update(newValue: movie, index: Index)
        
        self.starImageChangeDelegate?.updateData(newValue: movie, index: Index)
        self.starImageChangeDelegate?.updateTableViewUI(newValue: movie, index: Index)
        /*
        if starBtn.image(for: .normal) == UIImage(named: "star.png"){
            starBtn.setImage(UIImage(named: "starSelected.png"), for: .normal)
            self.imageDelegate?.imageChange(index: Index, star: true)
            
        }else if starBtn.image(for: .normal) == UIImage(named: "starSelected.png"){
            starBtn.setImage(UIImage(named: "star.png"), for: .normal)
            self.imageDelegate?.imageChange(index: Index, star: false)
            
        }
         */
    }
    
}
//url로 이미지 불러오기
extension UIImageView{
    func load(url: URL){
        DispatchQueue.global().async{
            [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async{
                        self?.image = image
                    }
                }
            }
        }
    }
}
