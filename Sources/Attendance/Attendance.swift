// The Swift Programming Language
// https://docs.swift.org/swift-book
import UIKit

public class AttendanceViewController: UIViewController {

    public let clockInButton = UIButton()
    private let coordinator: AttendanceCoordinator
    public var isClockedIn: Bool = false {
         didSet {
             // Update button title based on the value of isClockedIn
             let title = isClockedIn ? "Clock Out" : "Clock In"
             clockInButton.setTitle(title, for: .normal)
         }
     }
    public init(coordinator: AttendanceCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "ClockIN"
        configureClockInButton()
    }
    
  
    
    private func configureClockInButton() {
        view.addSubview(clockInButton)
        clockInButton.translatesAutoresizingMaskIntoConstraints = false
        clockInButton.setTitle("ClockIn", for: .normal)
        clockInButton.setTitleColor(.black, for: .normal)
        clockInButton.configuration = UIButton.Configuration.filled()
        
        clockInButton.addAction(UIAction(handler: { [weak self] action in
                    // Toggle isClockedIn when button is tapped
                    self?.isClockedIn.toggle()
                    // Perform appropriate action based on the current state of isClockedIn
                    if self?.isClockedIn == true {
                        self?.showAlert(title: "Clocked In Successfully")
                    } else {
                        self?.showAlert(title: "Clocked Out Successfully")
                    }
                }), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            clockInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            clockInButton.topAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func showAlert(title: String) {
           let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(alert, animated: true, completion: nil)
       }
    
}
