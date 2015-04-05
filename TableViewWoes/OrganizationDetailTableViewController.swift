//
//  OrganizationDetailTableViewController.swift
//  magnet-ios
//
//  Created by Michiel Boertjes on 24/03/15.
//  Copyright (c) 2015 Noodlewerk Apps. All rights reserved.
//

import UIKit

struct Organization {
    let headerImage: UIImage = UIImage(named: "noodlewerk-banner")!
    let logoImage: UIImage = UIImage(named: "noodlewerk-logo")!
    let name: String = "Noodlewerk Apps But Longer"
    let industry: String = "App Development"
    let employees: String = "4 employees"
    let city: String = "The lovely city of The Hague in The Netherlands"
    let aboutCards: [AboutCard] =
    [
        AboutCard(headerImage: UIImage(named: "noodlewerk-banner"), title: "Can you help us figure this one out?", message: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam nisl ex, varius et justo ut, gravida tempor augue. Sed venenatis felis sit amet lacinia pellentesque. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Proin et lobortis magna, pellentesque auctor lorem. Aenean ornare pretium auctor. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Ut quis odio vel dui eleifend faucibus. Integer quis accumsan massa, in dapibus eros. Aliquam in magna ac justo molestie tincidunt cursus ut dolor. Sed dictum commodo leo a imperdiet. Mauris quis elementum quam. Sed lacinia ligula nec felis lobortis, sagittis suscipit nisi sodales. Nam tristique turpis sed nunc efficitur porttitor. Sed volutpat iaculis mattis."),
        AboutCard(headerImage: nil, title: "This resizing is a huge problem!", message: "Ut diam ipsum, finibus vitae consectetur rutrum, venenatis quis diam. Sed at maximus velit. Fusce accumsan libero non ex lacinia, non gravida neque vehicula. Sed et mauris ante. Vestibulum at nibh pretium, vehicula metus et, auctor ante. Vestibulum neque mi, porta vel lectus eu, porttitor volutpat nunc. Maecenas vitae lorem varius, accumsan sem et, suscipit lorem. Mauris in sem augue. Praesent ultrices odio velit, dignissim volutpat sapien consequat quis. Duis porta eleifend lorem, ac rhoncus velit accumsan sit amet. In dignissim vitae nisi id pharetra. Donec sollicitudin ornare purus quis pretium. Fusce lobortis nulla ante, sit amet euismod massa finibus a. Aliquam mollis purus quis augue egestas fringilla."),
        AboutCard(headerImage: UIImage(named: "noodlewerk-banner"), title: "Go to Stack Overflow!", message: "Ut tempor neque ut euismod consectetur. Integer eros ligula, posuere nec lacus ut, tempor vestibulum sem. Etiam tincidunt ipsum a aliquam bibendum. Integer ac tellus urna. Vestibulum eu odio a nunc porta tempor. Nunc fringilla non erat a vehicula. Duis posuere diam nunc, quis tincidunt odio ultrices a.")
    ]
}

struct AboutCard {
    var headerImage: UIImage?
    var title: String!
    var message: String!
}

class OrganizationDetailTableViewController: UITableViewController, OrganizationDetailButtonsDelegate {
    
    let organization = Organization()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Helpers
    
    private func headerCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> OrganizationDetailCell
    {
        var cell: OrganizationDetailCell!
        switch indexPath.row {
        case 0:
            cell = tableView.dequeueReusableCellWithIdentifier("headerImage", forIndexPath: indexPath) as OrganizationDetailCell
        case 1:
            cell = tableView.dequeueReusableCellWithIdentifier("companyInfo", forIndexPath: indexPath) as OrganizationDetailCell
        case 2:
            cell = tableView.dequeueReusableCellWithIdentifier("buttons", forIndexPath: indexPath) as OrganizationDetailCell
        default:
            cell = tableView.dequeueReusableCellWithIdentifier("headerImage", forIndexPath: indexPath) as OrganizationDetailCell
        }
        return cell!
    }
    
    private func aboutCardCellForTableView(tableView: UITableView, indexPath: NSIndexPath) -> OrganizationDetailCell
    {
        return tableView.dequeueReusableCellWithIdentifier("aboutCard", forIndexPath: indexPath) as OrganizationDetailCell
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int
    {
        return 1 + organization.aboutCards.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if section == 0 {
            return 3
        }
        else {
            return 1
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell: OrganizationDetailCell!
        switch indexPath.section {
        case 0:
            cell = headerCellForTableView(tableView, indexPath: indexPath)
            if indexPath.row == 2 {
                // For the buttons, set this as the delegate to receive tap messages.
                (cell as OrganizationDetailButtonsCell).delegate = self
            }
        default:
            cell = aboutCardCellForTableView(tableView, indexPath: indexPath)
        }
        cell.configureWithOrganization(organization, indexPath: indexPath)
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
    {
        if section == 0 {
            return 1.0
        }
        else if section == 1 {
            return 45.0
        }
        else {
            return 10.0
        }
    }
    
//    private var expandedIndexPaths: [NSIndexPath] = []
//    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
//    {
//        let section = indexPath.section
//        let row = indexPath.row
//        if section == 0 {
//            if row == 0 {
//                let height = round(self.view.bounds.size.width / (958*354))
//                return height
//            }
//            else if row == 1 {
//                return heightForInfoCell()
//            }
//            else {
//                return 69.0
//            }
//        }
//        else {
//            return 200.0
//        }
//    }
    
    override func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat
    {
        return 1.0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        if section == 1 {
            var rect = CGRectMake(0, 0, self.view.bounds.size.width, self.tableView(tableView, heightForHeaderInSection: section))
            let view = UIView(frame: rect)
            view.backgroundColor = UIColor.clearColor()
            
            let xMargin : CGFloat = 20.0
            rect.size.width -= 2 * xMargin // text margin
            rect.origin.x = xMargin
            let label = UILabel(frame: rect)
            label.text = NSLocalizedString("About this company", comment: "")
            
            view.addSubview(label)
            return view
        }
        else {
            return nil
        }
    }
    
    // MARK: - OrganizationDetailButtonsDelegate
    
    func respondButtonTapped()
    {
        println("Requests tapped")
        self.tableView.reloadSections(NSIndexSet(index: 0), withRowAnimation: UITableViewRowAnimation.None)
    }
    func opportunitiesButtonTapped()
    {
        println("Opportunities tapped")
        self.tableView.reloadRowsAtIndexPaths([NSIndexPath(forRow: 2, inSection: 0)], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    // MARK: - About Card TapGestureRecognizer
    
    @IBAction func tapped(sender: UITapGestureRecognizer)
    {
        if let view = sender.view?.superview as? OrganizationDetailAboutCardCell {
            tableView.beginUpdates()
            view.toggleReadMore()
            tableView.endUpdates()
        }
    }
}
