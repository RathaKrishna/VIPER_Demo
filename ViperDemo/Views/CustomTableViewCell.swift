//
//  CustomTableViewCell.swift
//  ViperDemo
//
//  Created by Rathakrishnan Ramasamy on 26/04/22.
//

import UIKit
import SnapKit

class CustomTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
   
    private let bgImgView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "card_bg")
        imgView.layer.cornerRadius = 10
        imgView.clipsToBounds = true
        return imgView
    }()
    private let nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 20, weight: .heavy)
        return lbl
    }()
    
    private let companyNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 16, weight: .semibold)
        return lbl
    }()
    
    private let phoneLable: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    private let mailLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    private let webLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = .systemFont(ofSize: 14, weight: .medium)
        return lbl
    }()
    
    private let callIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "phone")
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let mailIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "envelope")
        imgView.clipsToBounds = true
        return imgView
    }()
    
    private let webIcon: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "globe")
        imgView.clipsToBounds = true
        return imgView
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.addSubview(bgImgView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(companyNameLabel)
        contentView.addSubview(callIcon)
        contentView.addSubview(mailIcon)
        contentView.addSubview(webIcon)
        contentView.addSubview(phoneLable)
        contentView.addSubview(mailLabel)
        contentView.addSubview(webLabel)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bgImgView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(10)
            make.right.bottom.equalToSuperview().offset(-10)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.top.equalTo(20)
            make.width.equalTo(bgImgView.snp.width)
        }
        companyNameLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.width.equalTo(bgImgView.snp.width)
        }
        
        callIcon.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(companyNameLabel.snp.bottom).offset(30)
            make.width.height.equalTo(20)
        }
        phoneLable.snp.makeConstraints { make in
            make.left.equalTo(callIcon.snp.right).offset(10)
            make.top.equalTo(callIcon.snp.top)
            make.height.equalTo(callIcon.snp.height)
        }
        mailIcon.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(callIcon.snp.bottom).offset(10)
            make.width.height.equalTo(20)
        }
        mailLabel.snp.makeConstraints { make in
            make.left.equalTo(mailIcon.snp.right).offset(10)
            make.top.equalTo(mailIcon.snp.top)
            make.height.equalTo(callIcon.snp.height)
        }
        webIcon.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.top.equalTo(mailIcon.snp.bottom).offset(10)
            make.width.height.equalTo(20)
        }
        webLabel.snp.makeConstraints { make in
            make.left.equalTo(webIcon.snp.right).offset(10)
            make.top.equalTo(webIcon.snp.top)
            make.height.equalTo(callIcon.snp.height)
        }
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with model: User) {
        nameLabel.text = model.name
        companyNameLabel.text = model.company.name
        phoneLable.text = model.phone
        mailLabel.text = model.email
        webLabel.text = model.website
    }
    
}
