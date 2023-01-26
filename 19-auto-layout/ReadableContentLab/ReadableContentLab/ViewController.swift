//
//  ViewController.swift
//  ReadableContentLab
//
//  Created by Mehmet Tarhan on 07/12/2022.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }

    private func setupViews() {
//        let myView = UIView()
//        myView.translatesAutoresizingMaskIntoConstraints = false
//        myView.backgroundColor = .systemPurple
//
//        view.addSubview(myView)
//
//        NSLayoutConstraint.activate([
//            myView.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
//            myView.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
//            myView.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
//            myView.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
//        ])

        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: view.readableContentGuide.topAnchor),
            label.bottomAnchor.constraint(equalTo: view.readableContentGuide.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: view.readableContentGuide.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: view.readableContentGuide.trailingAnchor),
        ])
    }

    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = """
        Sigmund Freud, (born May 6, 1856, Freiberg, Moravia, Austrian Empire [now Příbor, Czech Republic]—died September 23, 1939, London, England), Austrian neurologist and the founder of psychoanalysis. Freud’s article on psychoanalysis appeared in the 13th edition of the Encyclopædia Britannica.

        Freud may justly be called the most influential intellectual legislator of his age. His creation of psychoanalysis was at once a theory of the human psyche, a therapy for the relief of its ills, and an optic for the interpretation of culture and society. Despite repeated criticisms, attempted refutations, and qualifications of Freud’s work, its spell remained powerful well after his death and in fields far removed from psychology as it is narrowly defined. If, as the American sociologist Philip Rieff once contended, “psychological man” replaced such earlier notions as political, religious, or economic man as the 20th century’s dominant self-image, it is in no small measure due to the power of Freud’s vision and the seeming inexhaustibility of the intellectual legacy he left behind.
        Early life and training

        Freud’s father, Jakob, was a Jewish wool merchant who had been married once before he wed the boy’s mother, Amalie Nathansohn. The father, 40 years old at Freud’s birth, seems to have been a relatively remote and authoritarian figure, while his mother appears to have been more nurturant and emotionally available. Although Freud had two older half-brothers, his strongest if also most ambivalent attachment seems to have been to a nephew, John, one year his senior, who provided the model of intimate friend and hated rival that Freud reproduced often at later stages of his life.

        In 1859 the Freud family was compelled for economic reasons to move to Leipzig and then a year after to Vienna, where Freud remained until the Nazi annexation of Austria 78 years later. Despite Freud’s dislike of the imperial city, in part because of its citizens’ frequent anti-Semitism, psychoanalysis reflected in significant ways the cultural and political context out of which it emerged. For example, Freud’s sensitivity to the vulnerability of paternal authority within the psyche may well have been stimulated by the decline in power suffered by his father’s generation, often liberal rationalists, in the Habsburg empire. So too his interest in the theme of the seduction of daughters was rooted in complicated ways in the context of Viennese attitudes toward female sexuality.

        """
        label.numberOfLines = 0

        return label
    }()
}
