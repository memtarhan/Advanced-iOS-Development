//
//  ChatViewController.swift
//  Connect
//
//  Created by Mehmet Tarhan on 24/02/2022.
//  Copyright © 2022 Mehmet Tarhan. All rights reserved.
//

import MultipeerConnectivity
import UIKit

class ChatViewController: UIViewController {
    @IBOutlet var hostButton: UIButton!
    @IBOutlet var guestButton: UIButton!
    @IBOutlet var sendButton: UIButton!
    @IBOutlet var chatTextView: UITextView!
    @IBOutlet var messageTextField: UITextField!

    var peerID: MCPeerID!
    var mcSession: MCSession!
    var mcAdvertiserAssistant: MCNearbyServiceAdvertiser!

    var chat = ""
    var username = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        chatTextView.isEditable = false

        username = UserDefaults.standard.string(forKey: "username") ?? "None"

        peerID = MCPeerID(displayName: username)
        mcSession = MCSession(peer: peerID, securityIdentity: nil, encryptionPreference: .required)
        mcSession.delegate = self

        sendButton.isEnabled = false

        chat += "No room!\n"
        chatTextView.text = chat
    }

    @IBAction func didTapBack(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func didTapHost(_ sender: Any) {
        startHosting()

        chat += "Started hosing!\n"
        chatTextView.text = chat

        hostButton.isEnabled = false
        guestButton.isEnabled = true
    }

    @IBAction func didTapGuest(_ sender: Any) {
        joingRoom()
    }

    @IBAction func didTapSend(_ sender: Any) {
        if let message = messageTextField.text {
            send(message: message)
            chat += "\(message)\n"
            chatTextView.text = chat
        }
    }

    private func send(message: String) {
        guard !mcSession.connectedPeers.isEmpty else {
            return
        }

        if let data = message.data(using: .utf8) {
            do {
                try mcSession.send(data, toPeers: mcSession.connectedPeers, with: .reliable)

            } catch {
                print("Error while sending message: \(error)")
                chat += "Error while sending message: \(error)"
            }
        }
    }

    private func startHosting() {
        mcAdvertiserAssistant = MCNearbyServiceAdvertiser(peer: peerID, discoveryInfo: nil, serviceType: "mp-chat")
        mcAdvertiserAssistant.delegate = self
        mcAdvertiserAssistant.startAdvertisingPeer()
    }

    private func joingRoom() {
        let mcBrowserViewController = MCBrowserViewController(serviceType: "mp-chat", session: mcSession)
        mcBrowserViewController.delegate = self
        present(mcBrowserViewController, animated: true, completion: nil)
    }
}

// MARK: - MCSessionDelegate, MCBrowserViewControllerDelegate, MCNearbyServiceAdvertiserDelegate

extension ChatViewController: MCSessionDelegate, MCBrowserViewControllerDelegate, MCNearbyServiceAdvertiserDelegate {
    func session(_ session: MCSession, peer peerID: MCPeerID, didChange state: MCSessionState) {
        switch state {
        case .notConnected:
            chat += "Not Connected: \(peerID.displayName)"
            DispatchQueue.main.async {
                self.chatTextView.text = self.chat
                self.sendButton.isEnabled = false
            }
        case .connecting:
            chat += "Connecting: \(peerID.displayName)"
            DispatchQueue.main.async {
                self.chatTextView.text = self.chat
                self.sendButton.isEnabled = true
            }
        case .connected:
            chat += "Connected: \(peerID.displayName)"
            DispatchQueue.main.async {
                self.chatTextView.text = self.chat
                self.sendButton.isEnabled = true
            }
        @unknown default:
            fatalError()
        }
    }

    func session(_ session: MCSession, didReceive data: Data, fromPeer peerID: MCPeerID) {
        if let text = String(data: data, encoding: .utf8) {
            chat += text
            DispatchQueue.main.async {
                self.chatTextView.text = self.chat
            }
        }
    }

    func session(_ session: MCSession, didReceive stream: InputStream, withName streamName: String, fromPeer peerID: MCPeerID) {
    }

    func session(_ session: MCSession, didStartReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, with progress: Progress) {
    }

    func session(_ session: MCSession, didFinishReceivingResourceWithName resourceName: String, fromPeer peerID: MCPeerID, at localURL: URL?, withError error: Error?) {
    }

    func browserViewControllerDidFinish(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }

    func browserViewControllerWasCancelled(_ browserViewController: MCBrowserViewController) {
        dismiss(animated: true)
    }

    func advertiser(_ advertiser: MCNearbyServiceAdvertiser, didReceiveInvitationFromPeer peerID: MCPeerID, withContext context: Data?, invitationHandler: @escaping (Bool, MCSession?) -> Void) {
        // Accept invitation
        invitationHandler(true, mcSession)
    }
}
