(install_if_missing 'jabber)

;; jabber for chats such as facebook
(require 'jabber-autoloads)
(setq jabber-account-list '(("Philipp.Tavernello@chat.facebook.com")
                            ("Philipp.Hanslovsky@gmail.com"
                             (:network-server . talk.google.com)
                             (:port . 5223)
                             (:connection-type . ssl))))
(defun jabber ()
  (interactive)
  (jabber-connect-all)
  (switch-to-buffer "*-jabber-roster-*"))


;; add jabber to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'jabber)


