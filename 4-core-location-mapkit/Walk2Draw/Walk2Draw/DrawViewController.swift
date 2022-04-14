//
//  DrawViewController.swift
//  Walk2Draw
//
//  Created by Mehmet Tarhan on 14/04/2022.
//

import CoreLocation
import LogStore
import UIKit

class DrawViewController: UIViewController {
    private var locationProvider: LocationProvider?

    private var locations = [CLLocation]()

    private var contentView: DrawView {
        view as! DrawView
    }

    override func loadView() {
        let contentView = DrawView(frame: .zero)

        contentView.startStopButton.addTarget(self, action: #selector(startStop(_:)), for: .touchUpInside)

        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        /*
         !!! What Does [weak self] Do?

         When objects in a program are not used anymore, the memory they occupy should be made available for new objects. Swift manages this task for us using a concept called Automatic Reference Counting (ARC). The compiler analyzes the code and figures out where memory can be freed again. As the name suggests, this happens automatically at compile time using reference counts.

         In some situations, we need to help the compiler figure out the ownership of objects. This is often the case when we use closures. Look at the code for the closure again. The closure calls self.locations.append(_:). self is the instance of DrawViewController in which this is called. By calling self.locations.append(_:), the closure “captures” self. This increases its reference count.

         This alone is not a problem. But in this case, the locationProvider owns the closure, and self owns the locationProvider. A construct like this is called a reference cycle because ownership is managed internally using references to objects. Because ARC counts only references, it won’t free up memory when the instance of DrawViewController isn’t used anymore.

         To break the cycle, we tell the compiler with [weak self] that the closure shouldn’t increase the reference count of self. This way, the reference from the closure to self doesn’t prevent self from being freed, and the cycle is broken.
         */
        locationProvider = LocationProvider(updateHandler: { [weak self] location in
            guard let self = self else {
                return
            }
            printLog("location: \(location)")
            self.locations.append(location)

            self.contentView.addOverlay(with: self.locations)
        })
    }

    @objc func startStop(_ sender: UIButton) {
        guard let locationProvider = locationProvider else {
            fatalError()
        }

        if locationProvider.updating {
            locationProvider.stop()
            sender.setTitle("Start", for: .normal)

        } else {
            locationProvider.start()
            sender.setTitle("Stop", for: .normal)
        }
    }
}
