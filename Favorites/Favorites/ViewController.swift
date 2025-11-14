//
//  ViewController.swift
//  MusicPlayer
//
//  Created by Macbook Air on 30.10.2025.
//

import UIKit

struct CellItem {
    let image: UIImage
    let title: String
    let subtitle: String
    let review: String
}

struct Section{
    let sectionName: String
    let items: [CellItem]
}

class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    let sections : [Section] = [
        Section(sectionName: "Movies", items: [
            CellItem(image: UIImage(named: "Sherlock")!, title: "Sherlock Holmes 2009", subtitle: "Detective Sherlock Holmes and his stalwart partner Watson engage in a battle of wits and brawn with a nemesis whose plot is a threat to all of England.", review: "★★★★★"),
            CellItem(image: UIImage(named: "TheGentlemen")!, title: "The Gentlemen", subtitle: "An American expat tries to sell off his highly profitable marijuana empire in London, triggering plots, schemes, bribery and blackmail in an attempt to steal his domain out from under him.", review: "★★★★★"),
            CellItem(image: UIImage(named: "MonteCristo")!, title: "The Count of Monte Cristo", subtitle: "After escaping from an island prison where he spent 14 years for being wrongly accused of state treason, Edmond Dantès returns as the Count of Monte Cristo to exact revenge on the men who betrayed him.", review: "★★★★★"),
            CellItem(image: UIImage(named: "Oppenheimer")!, title: "Oppenheimer", subtitle: "A dramatization of the life story of J. Robert Oppenheimer, the physicist who had a large hand in the development of the atomic bombs that brought an end to World War II.", review: "★★★★★"),
            CellItem(image: UIImage(named: "Barbie")!, title: "Barbie", subtitle: "Barbie and Ken are having the time of their lives in the seemingly perfect world of Barbie Land. However, when they get a chance to go to the outside world, they soon discover the joys and perils of living among regular humans.", review: "★★★★★")
        
        ]),
        Section(sectionName: "Music", items: [
            CellItem(image: UIImage(named: "Sonne")!, title: "Sonne", subtitle: "Sonne is a song by German metal band Rammstein. It was released in 2001, as the first single from their album Mutter. ", review: "★★★★★"),
            CellItem(image: UIImage(named: "Shtiel")!, title: "Shtiel", subtitle: "Shtiel is a compilation album by the band Aria from 2002, released before the announcement of the new lineup, and after the official breakup of the old one.", review: "★★★★★"),
            CellItem(image: UIImage(named: "TravaUDoma")!, title: "Trava u Doma", subtitle: "Grass at Home is a song by Vladimir Migulya with lyrics by Anatoly Poperechny. It was most famously performed by the band Zemlyane.", review: "★★★★★"),
            CellItem(image: UIImage(named: "WonderfulWorld")!, title: "What a wonderful world", subtitle: "What a Wonderful World is a jazz song written by Bob Thiele and George David Weiss. It was first recorded by Louis Armstrong and released in 1967 as a single. Armstrong's recording was inducted in the Grammy Hall of Fame in 1999.", review: "★★★★★"),
            CellItem(image: UIImage(named: "UnaMattina")!, title: "Una Mattina", subtitle: "Una mattina is a 2004 music album by Italian pianist Ludovico Einaudi. Una mattina. Studio album by. Ludovico Einaudi. Released, 6 September 2004. ", review: "★★★★★")
            
        ]),
        Section(sectionName: "Books", items: [
            CellItem(image: UIImage(named: "Igrok")!, title: "Player", subtitle: "The novel's theme is an all-consuming passion for gambling. Suslova is considered the prototype for the novel's heroine, Polina Alexandrovna. The protagonist's tormented relationship with Polina mirrors Dostoevsky's difficult relationship with Suslova.", review: "★★★★★"),
            CellItem(image: UIImage(named: "BoyAtTheTop")!, title: "The Boy at the Top of the Mountain", subtitle: "TWhen Pierrot becomes an orphan, he must leave his home in Paris for a new life with his Aunt Beatrix, a servant in a wealthy household at the top of the German mountains. But this is no ordinary time, for it is 1935 and the Second World War is fast approaching; and this is no ordinary house, for this is the Berghof, the home of Adolf Hitler.", review: "★★★★★"),
            CellItem(image: UIImage(named: "Littleprince")!, title: "The little Prince", subtitle: "The Little Prince is a philosophical tale about the search for the meaning of life, friendship, and love, where symbols of childish spontaneity and purity are contrasted with the pragmatic and limited world of adults.", review: "★★★★★")
        ]),
        Section(sectionName: "Courses", items: [
            CellItem(image: UIImage(named: "VFX")!, title: "VFX and 3D modeling", subtitle: "Learn how to make special effects in maya!", review: "★★★★★"),
            CellItem(image: UIImage(named: "IOS")!, title: "IOS development", subtitle: "Introduction to swift and xcode. Learn how to make apps for iPhone!", review: "★★★★★"),
            CellItem(image: UIImage(named: "OOP")!, title: "Object Oriented Programming", subtitle: "Basic principles of programming, much needed for the future carrier. Also you will learn Java.", review: "★★★★★"),
            CellItem(image: UIImage(named: "physics")!, title: "Physics 1", subtitle: "Good old school physcis. Revisit school physics programm", review: "★★★★★"),
            CellItem(image: UIImage(named: "Web")!, title: "Web development", subtitle: "HTML, CSS, javaScript and frameworks. Learn how to become web developer!", review: "★★★★★")
        ])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("indexPath: \(indexPath.section) | \(indexPath.row)")
    }
}

extension ViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TableCellViewController
        let item = sections[indexPath.section].items[indexPath.row]
        cell.configure(item: item)
        return cell
        
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
            return sections[section].sectionName
    }
    
    
}

