//
//  main.swift
//  Logic1
//
//  Created by MacOne-YJ4KBJ on 4/14/22.
//

import Foundation


// bai 5

var inputKeyboard: String
var arrayInt : [Int]
var min = 0
var max = 0
var vitriMin2: Int = 0
var vitriMax2: Int = 0

func pureInt(string: [String]) -> [Int]{
    var arrayInt : [Int] = []
    for i in string{
        if (Int(i) != nil){
           arrayInt.append(Int(i)!)
        }
    }
    return arrayInt
}

func finMinmax2(array : [Int]){
    for i in 1..<array.count{
        if array[i] > min && array[i] < max{
            vitriMin2 = i
            break
        }
    }
    for i in 1..<array.count{
        if array[i] > min && array[i] < max{
            vitriMax2 = i
        }
    }
}

repeat{
    print("Nhap day so:")
    inputKeyboard = readLine() ?? ""
    arrayInt = pureInt(string: inputKeyboard.components(separatedBy: " "))
} while (arrayInt.count == 0)

var arrayInt1 = arrayInt


arrayInt.sort { (s1, s2) -> Bool in
    s1 < s2
}
min = arrayInt.first!
max = arrayInt.last!

finMinmax2(array: arrayInt)
if vitriMin2 != 0 && vitriMax2 != 0{
    print("so be thu 2 la \(arrayInt[vitriMin2])")
    print("so lon thu 2 la \(arrayInt[vitriMax2])")
}
else{
    print("ko co so be va lon th 2")
}
//-----------------------------------------------------------------------------


//Bai6
print("Nhap so can them x vao sau so lon nhat trong mang:")

var x = Int(readLine() ?? "") ?? 0

var arrayVitriMax : [Int] = []
// tim cac vi tri lon nhat trong mang roi gan vao arrayVitriMax
for i in (0..<arrayInt1.count){
    if arrayInt1[i] == arrayInt.max(){
        arrayVitriMax.append(i)
    }
}
print("Mang ban dau la:")
print(arrayInt1)
// them x vao cuoi mang tuong ung voi bay nhieu lan so lon nhat dc xuat hien
for i in 0..<arrayVitriMax.count{
    arrayInt1.append(x)
    for j in (arrayVitriMax[i]+i+2..<arrayInt1.count).reversed(){
            arrayInt1.swapAt(j, j - 1)
    }
}
print("Mang da them x dang sau la:")
print(arrayInt1)

//-----------------------------------------------------------------------------
// bai 7

var n: Int
var k = 0
print("nhap vao 1 so nguyen :")
n = Int(readLine() ?? "") ?? 0

func ktradoixung(n : Int){
    var z = n
    repeat{
        k = k * 10 + z % 10;
          z = z / 10
    }while z > 0
    if k == n{
        print("So tren doi xung")
    }
    else{
        print("So tren ko doi xung")
    }
}
ktradoixung(n: n)

//-----------------------------------------------------------------------------

//bai 8

var nam = 0
var thang = 0
var ngay = 0
var intDay : [Int] = []
var strDay : String = ""
func nhapDay(){
    print("nhap ngay thang nam theo dinh dang dd/mm/yyyy:")
    strDay = readLine() ?? ""
    pureInt1(string: strDay.components(separatedBy: "/"))
}

func pureInt1(string: [String]){
    var arrayInt : [Int] = []
    for i in string{
        if (Int(i) != nil){
           arrayInt.append(Int(i)!)
        }
    }
    if arrayInt.count != 3{
        nhapDay()
    }
    else{
        checkDay(year: arrayInt[2], month: arrayInt[1], day: arrayInt[0])
    }
}
func checkDay(year: Int, month: Int, day: Int){
    nam = year
    thang = month
    ngay = day
    if year < 1{
        nhapDay()
    }
    else{
        if month < 1 || month > 12{
            nhapDay()
        }
        else{
            switch month {
            case 1,3,5,7,8,10,12:
                if day > 31 || day < 1{
                    nhapDay()
                }
            case 4,6,9,11:
                if day > 30 || day < 1{
                    nhapDay()
                }
            default:
               
                if (year % 4 == 0 && year % 100 != 0) || year % 400 == 0{
                    if day < 1 || day > 29{
                        print(2)
                        nhapDay()
                    }
                }
                else{
                    if day < 1 || day > 28{
                        nhapDay()
                    }
                }
            }
        }
    }
}

nhapDay()
var dayD : String = "\(ngay)/\(thang)/\(nam)"

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd/MM/yyyy"
let nextDate = dateFormatter.date(from: dayD)!.addingTimeInterval(60*60*24)
let prevDate = dateFormatter.date(from: dayD)!.addingTimeInterval(-60*60*24)
print("the previous day: \(dateFormatter.string(from: prevDate))")
print("the next day: \(dateFormatter.string(from: nextDate))")


