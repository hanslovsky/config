(install_if_missing 'go-mode)
(install_if_missing 'company-go)
(install_if_missing 'flymake-go)
(install_if_missing 'go-eldoc)

;; (load "$GOPATH/src/code.google.com/p/go.tools/cmd/oracle/oracle.el")
(load "$GOPATH/src/golang.org/x/tools/cmd/oracle/oracle.el")

;; uncomment if only go backend should be available for company
;; (add-hook 'go-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))


;; auto format on save
(add-hook 'before-save-hook 'gofmt-before-save)

;; remove unused imports hotkey
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook 
          '(lambda ()
               (set (make-local-variable 'company-backends) '(company-go))
               (company-mode)
               ;; (go-oracle-mode) ;; disable keyboard shortcuts
               (go-eldoc-setup)
               ;; (company-go)
               (local-set-key (kbd "C-c C-k") 'godoc)
               (local-set-key (kbd "C-c C-f") 'gofmt)
               (local-set-key (kbd "C-c C-g") 'go-goto-imports)
               (local-set-key (kbd "C-c C-r") 'go-remove-unused-imports)))
