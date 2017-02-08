(install_if_missing 'magit)

;; magit status screen
(global-set-key (kbd "C-x g") 'magit-status)

(setq magit-last-seen-setup-instructions "1.4.0")

(setq vc-ignore-dir-regexp (format "\\(%s\\)\\|\\(%s\\)\\|\\(%s\\)|\\(%s\\)"
                                     vc-ignore-dir-regexp
                                     tramp-file-name-regexp
                                     "/nrs/.*"
                                     "/ssh:.+:/nrs/.*"
                                     ))
