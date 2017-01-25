//
//  ViewController.swift
//  WeightMax
//
//  Created by Siavash on 26/1/17.
//  Copyright © 2017 sichi. All rights reserved.
//

import SnapKit

struct CellData {
    let name: String
    var maxWeight: String
}
extension CellData {
    init?(data: Data) {
        if let coding = NSKeyedUnarchiver.unarchiveObject(with: data) as? Encoding {
            name = coding.name as String
            maxWeight = coding.maxWeight! as String
        } else {
            return nil
        }
    }
    
    func encode() -> Data {
        return NSKeyedArchiver.archivedData(withRootObject: Encoding(self))
    }
    
    private class Encoding: NSObject, NSCoding {
        let name : String
        let maxWeight : String?
        
        init(_ cellData: CellData) {
            name = cellData.name
            maxWeight = cellData.maxWeight
        }
        
        @objc required init?(coder aDecoder: NSCoder) {
            if let name = aDecoder.decodeObject(forKey: "name") as? String {
                self.name = name
            } else {
                return nil
            }
            maxWeight = aDecoder.decodeObject(forKey: "maxWeight") as? String
        }
        
        @objc func encode(with aCoder: NSCoder) {
            aCoder.encode(name, forKey: "name")
            aCoder.encode(maxWeight, forKey: "maxWeight")
        }
        
    }
}
struct Constant {
    static let data: String = "data"
}
var dataSource: [CellData] = []
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate let identifier: String = "CustomCell"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        if let dataArray = UserDefaults.standard.value(forKey: Constant.data) as? [Data] {
            dataSource = dataArray.map({CellData.init(data: $0)!})
        } else {
            var data = CellData.init(name: "Bent-over dumbell row", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "wide grip standing dubmell", maxWeight: "10")
            dataSource.append(data)
            
            data = CellData.init(name: "alternate dumbell curl", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "Barbell incline bench press", maxWeight: "2.5")
            dataSource.append(data)
            
            data = CellData.init(name: "Incline dumbell fly", maxWeight: "6")
            dataSource.append(data)
            
            data = CellData.init(name: "dumbell shoulder press", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "Lying triceps press", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "Barbell squat", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "Dumbell lunge", maxWeight: "6")
            dataSource.append(data)
            
            data = CellData.init(name: "Lying leg curl", maxWeight: "15")
            dataSource.append(data)
            
            data = CellData.init(name: "Stiff legged barbell deadLift", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Standing Calf raise", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Incline dumbell fly", maxWeight: "6")
            dataSource.append(data)
            
            data = CellData.init(name: "Concentration curl", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "preacher curl", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "Butterfly", maxWeight: "7.5")
            dataSource.append(data)
            
            data = CellData.init(name: "Side lateral raise", maxWeight: "4")
            dataSource.append(data)
            
            data = CellData.init(name: "Triceps push down", maxWeight: "10")
            dataSource.append(data)
            
            data = CellData.init(name: "Legs press", maxWeight: "15")
            dataSource.append(data)
            
            data = CellData.init(name: "leg extenstion", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Stiffed leg dumbell dead lift", maxWeight: "10")
            dataSource.append(data)
            
            data = CellData.init(name: "Seated leg curl", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "AB crunch machine", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "One arm dumbell row", maxWeight: "8")
            dataSource.append(data)
            
            data = CellData.init(name: "Underhand cable pull down", maxWeight: "10")
            dataSource.append(data)
            
            data = CellData.init(name: "Barbell dead Lift", maxWeight: "2.5")
            dataSource.append(data)
            
            data = CellData.init(name: "Barbell bench press", maxWeight: "1.5")
            dataSource.append(data)
            
            data = CellData.init(name: "Seated bent-over rear delt", maxWeight: "5")
            dataSource.append(data)
            
            data = CellData.init(name: "Dumbell bench press", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Dumbell fly", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "seated barbell military press", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Bent-over barbell row", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Standing dumbell triceps extension", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Bent-over barbell row", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Alternate hammer curl", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Machine shoulder press", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Smith machine overhead shoulder press", maxWeight: "0")
            dataSource.append(data)
            
            data = CellData.init(name: "Barbell shoulder press", maxWeight: "0")
            dataSource.append(data)
            
            let encoded = dataSource.map({$0.encode()})
            UserDefaults.standard.setValue(encoded, forKey: Constant.data)
            UserDefaults.standard.synchronize()
        }

        tableView.dataSource = self
        tableView.delegate = self
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyaboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    func dismissKeyboard() {
        view.endEditing(true)
    }
    func keyboardWillShow() {
        tableView.snp.remakeConstraints { (make) in
            make.bottom.equalTo(-270)
            make.left.equalTo(self.view)
            make.right.equalTo(self.view)
            make.height.equalTo(self.view)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    func keyaboardWillHide() {
        tableView.snp.remakeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: CustomCell?
        if (tableView.dequeueReusableCell(withIdentifier: identifier) != nil) {
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomCell
        } else {
            cell = CustomCell()
        }
        cell?.config(with: dataSource[indexPath.row], indexPath: indexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
final class CustomCell: UITableViewCell, UITextFieldDelegate {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var maxField: UITextField!
    var index: IndexPath!
    func config(with data: CellData, indexPath: IndexPath) {
        titleLabel.text = data.name
        maxField.text = data.maxWeight
        maxField.keyboardType = .numbersAndPunctuation
        maxField.autocorrectionType = .no
        maxField.returnKeyType = .done
        maxField.delegate = self
        index = indexPath
        maxField.tag = indexPath.row
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        dataSource[textField.tag].maxWeight = textField.text ?? ""
        let encoded = dataSource.map({$0.encode()})
        UserDefaults.standard.setValue(encoded, forKey: Constant.data)
        UserDefaults.standard.synchronize()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}
