//
//  SettingViewController.swift
//  SMSCount
//
//  Created by Eddie on 2015/8/9.
//  Copyright (c) 2015年 Wen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var screenMask: UIView!

    @IBOutlet var enterDateLabel: UILabel!
    @IBOutlet var serviceDaysLabel: UILabel!
    @IBOutlet var discountDaysLabel: UILabel!

    @IBOutlet var datepickerView: UIView!
    @IBOutlet var datepickerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var datepickerElement: UIDatePicker!

    @IBOutlet var serviceDaysPickerView: UIView!
    @IBOutlet var serviceDaysPickerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var serviceDaysPickerElement: UIPickerView!
    var serviceDaysPickerDataSource = [ "一年", "一年十五天" ]

    @IBOutlet var discountDaysPickerView: UIView!
    @IBOutlet var discountDaysPickerViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet var discountDaysPickerElement: UIPickerView!
    var discountDaysPickerDataSource = [ "0 天", "1 天", "2 天", "3 天", "4 天", "5 天", "6 天", "7 天", "8 天", "9 天", "10 天",  "11 天", "12 天", "13 天", "14 天", "15 天", "16 天", "17 天", "18 天", "19 天", "20 天", "21 天", "22 天", "23 天", "24 天", "25 天", "26 天", "27 天", "28 天", "29 天", "30 天" ]


    @IBOutlet var autoWeekendSwitch: UISwitch!

    let dateFormatter = NSDateFormatter()
    let userPreference = NSUserDefaults( suiteName: "group.EddieWen.SMSCount" )!


    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        dateFormatter.dateFormat = "yyyy / MM / dd"
        dateFormatter.timeZone = NSTimeZone.localTimeZone()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        datepickerElement.datePickerMode = UIDatePickerMode.Date
        serviceDaysPickerElement.dataSource = self
        serviceDaysPickerElement.delegate = self
        discountDaysPickerElement.dataSource = self
        discountDaysPickerElement.delegate = self

        let pressOnScreenMask = UITapGestureRecognizer( target: self, action: "dismissScreenMask" )
        screenMask.addGestureRecognizer( pressOnScreenMask )

        if let userEnterDate = self.userPreference.stringForKey("enterDate") {
            enterDateLabel.text = userEnterDate
        }
        if let userServiceDays = self.userPreference.stringForKey("serviceDays") {
            serviceDaysLabel.text = userServiceDays == "1y" ? "一年" : "一年十五天"
        }
        if let userDiscountDays = self.userPreference.stringForKey("discountDays") {
            discountDaysLabel.text = userDiscountDays
        }
        self.autoWeekendSwitch.transform = CGAffineTransformMakeScale(0.8, 0.8)
        self.autoWeekendSwitch.addTarget(self, action: "switchClick:", forControlEvents: .ValueChanged)
        if self.userPreference.boolForKey("autoWeekendFixed") {
            self.autoWeekendSwitch.setOn(true, animated: false)
        }
    }

    override func viewDidAppear(animated: Bool) {

        if discountDaysLabel.text == "" {
            if let userDiscountDays = userPreference.stringForKey("discountDays") {
                discountDaysLabel.text = userDiscountDays
            }
        }

    }

    @IBAction func editEnterDate(sender: AnyObject) {

        self.serviceDaysPickerViewBottomConstraint.constant = -250
        self.discountDaysPickerViewBottomConstraint.constant = -250
        self.datepickerViewBottomConstraint.constant = -50

        self.showPickerView()

        if let userEnterDate = userPreference.stringForKey("enterDate") {
            datepickerElement.setDate( dateFormatter.dateFromString(userEnterDate)!, animated: false )
        }

    }

    @IBAction func editServiceDays(sender: AnyObject) {
        
        self.datepickerViewBottomConstraint.constant = -250
        self.discountDaysPickerViewBottomConstraint.constant = -250
        self.serviceDaysPickerViewBottomConstraint.constant = -50

        self.showPickerView()

        if let userServiceDays = userPreference.stringForKey("serviceDays") {
            var selectedRow = userServiceDays == "1y" ? 0 : 1
            serviceDaysPickerElement.selectRow( selectedRow, inComponent: 0, animated: false )
        }

    }

    @IBAction func editDiscountDays(sender: AnyObject) {

        self.datepickerViewBottomConstraint.constant = -250
        self.serviceDaysPickerViewBottomConstraint.constant = -250
        self.discountDaysPickerViewBottomConstraint.constant = -50

        self.showPickerView()

        if let selectedRow = userPreference.stringForKey("discountDays") {
            discountDaysPickerElement.selectRow( selectedRow.toInt()!, inComponent: 0, animated: false )
        }

    }

    func showPickerView() {

        self.screenMask.hidden = false
        UIView.animateWithDuration( 0.4, animations: {
            self.screenMask.alpha = 0.6
            // show PickerView
            self.view.layoutIfNeeded()
            // hide Tabbar
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height
        })

    }

    @IBAction func dateDoneIsPressed(sender: AnyObject) {
        
        let newSelectDate = dateFormatter.stringFromDate(datepickerElement.date)

        enterDateLabel.text = newSelectDate
        userPreference.setObject( newSelectDate, forKey: "enterDate" )

        dismissScreenMask()

    }

    @IBAction func serviceDaysDoneIsPressed(sender: AnyObject) {

        if userPreference.stringForKey("serviceDays") == nil {
            userPreference.setObject( "1y", forKey: "serviceDays" )
        }

        serviceDaysLabel.text = userPreference.stringForKey("serviceDays") == "1y" ? "一年" : "一年十五天"

        dismissScreenMask()

    }

    @IBAction func discountDaysDoneIsPressed(sender: AnyObject) {

        if userPreference.stringForKey("discountDays") == nil {
            userPreference.setObject( "0", forKey: "discountDays" )
        }

        discountDaysLabel.text = userPreference.stringForKey("discountDays")

        dismissScreenMask()

    }

    func dismissScreenMask() {
        self.datepickerViewBottomConstraint.constant = -250
        self.serviceDaysPickerViewBottomConstraint.constant = -250
        self.discountDaysPickerViewBottomConstraint.constant = -250
        UIView.animateWithDuration(0.4, delay: 0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.view.layoutIfNeeded()
            self.screenMask.alpha = 0
            // show Tabbar
            self.tabBarController?.tabBar.frame.origin.y = self.view.frame.height-50
        }, completion: { finish in
            self.screenMask.hidden = true;
        })

        if serviceDaysLabel.text != "" {
            var serviceDay = serviceDaysLabel.text == "一年" ? "1y" : "1y15d"
            userPreference.setObject( serviceDay, forKey: "serviceDays" )
        } else {
            userPreference.removeObjectForKey( "serviceDays" )
        }
        if discountDaysLabel.text != "" {
            userPreference.setObject( discountDaysLabel.text, forKey: "discountDays" )
        } else {
            userPreference.removeObjectForKey( "discountDays" )
        }
    }

    func switchClick( mySwitch: UISwitch ) {
        self.userPreference.setBool( mySwitch.on ? true : false, forKey: "autoWeekendFixed" )
    }

    // MARK: These are the functions for UIPickerView
    func numberOfComponentsInPickerView(pickerView : UIPickerView) -> Int {
        return 1
    }

    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ( pickerView == serviceDaysPickerElement ) ? serviceDaysPickerDataSource.count : discountDaysPickerDataSource.count
    }

    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return ( pickerView == serviceDaysPickerElement ) ? serviceDaysPickerDataSource[row] : discountDaysPickerDataSource[row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == serviceDaysPickerElement {
            var days: String = row == 0 ? "1y" : "1y15d"
            userPreference.setObject( days, forKey: "serviceDays" )
        } else if pickerView == discountDaysPickerElement {
            userPreference.setObject( row, forKey: "discountDays" )
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
