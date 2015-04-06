//
//  OrganizationDetailCells.swift
//  magnet-ios
//
//  Created by Bruno Scheele on 25/03/15.
//  Copyright (c) 2015 Noodlewerk Apps. All rights reserved.
//

import UIKit

class OrganizationDetailCell : UITableViewCell
{
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.whiteColor()
        selectionStyle = UITableViewCellSelectionStyle.None
    }
    
    func configureWithOrganization(organization: Organization, indexPath: NSIndexPath)
    {
        println("configureWithOrganization:indexPath: is an abstract method. Please implement it in a subclass.")
    }
}

class OrganizationDetailCompanyHeaderImageCell: OrganizationDetailCell
{
    @IBOutlet weak var headerImageView: UIImageView!
    
    override func configureWithOrganization(organization: Organization, indexPath: NSIndexPath)
    {
        headerImageView.image = organization.headerImage
    }
}

class OrganizationDetailCompanyInformationCell: OrganizationDetailCell
{
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var industryLabel: UILabel!
    @IBOutlet weak var employeesLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    override func configureWithOrganization(organization: Organization, indexPath: NSIndexPath)
    {
        logoView.image = organization.logoImage
        nameLabel.text = organization.name
        industryLabel.text = organization.industry
        employeesLabel.text = organization.employees
        cityLabel.text = organization.city
    }
}


protocol OrganizationDetailButtonsDelegate: NSObjectProtocol
{
    func respondButtonTapped()
    func opportunitiesButtonTapped()
}
class OrganizationDetailButtonsCell: OrganizationDetailCell
{
    @IBOutlet weak var respondButton: RoundedButton!
    @IBOutlet weak var opportunitiesButton: RoundedButton!
    weak var delegate: OrganizationDetailButtonsDelegate?
    
    override func configureWithOrganization(organization: Organization, indexPath: NSIndexPath)
    {
        
    }
    
    @IBAction func respondButtonTapped(sender: AnyObject)
    {
        delegate?.respondButtonTapped()
    }
    @IBAction func opportunitiesButtonTapped(sender: AnyObject)
    {
        delegate?.opportunitiesButtonTapped()
    }
}

class OrganizationDetailAboutCardCell: OrganizationDetailCell
{
    
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var aboutTextLabel: UILabel!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    
    private var aboutTextHeightConstraint: NSLayoutConstraint?
    
    override func configureWithOrganization(organization: Organization, indexPath: NSIndexPath)
    {
        let aboutCard = organization.aboutCards[indexPath.section - 1] as AboutCard
        
        if aboutCard.headerImage == nil {
            imageHeightConstraint.constant = 0
        }
        else {
            let ratio = 354/958.0
            imageHeightConstraint.constant = UIScreen.mainScreen().bounds.size.width * CGFloat(ratio)
        }
        
        headerImageView.image = aboutCard.headerImage
        headerLabel.text = aboutCard.title
        aboutTextLabel.text = aboutCard.message
    }
    
    func expandCard(shouldExpand: Bool)
    {
        println("DEBUG: \(shouldExpand ? 0 : 5)")
        aboutTextLabel.numberOfLines = shouldExpand ? 0 : 5
    }
}


