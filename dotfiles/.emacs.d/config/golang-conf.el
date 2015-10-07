(install_if_missing 'go-mode)
(install_if_missing 'company-go)

;; uncomment if only go backend should be available for company
;; (add-hook 'go-mode-hook (lambda ()
;;                           (set (make-local-variable 'company-backends) '(company-go))
;;                           (company-mode)))
