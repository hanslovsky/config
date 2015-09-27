(install_if_missing 'company)
(install_if_missing 'company-auctex)
(install_if_missing 'company-c-headers)
(install_if_missing 'company-irony)
(install_if_missing 'company-irony-c-headers)
(install_if_missing 'company-quickhelp)
(install_if_missing 'helm-company)

(setq company-idle-delay 0.3)
(setq company-show-numbers t)
(setq company-minimum-prefix-length 1) ;; default is 3
(setq company-tooltip-limit 30)

;; syntax-ppss is inside string
(defun my/inside-string()
  "Returns non-nil if cursor is inside string (major mode dependend)."
  (interactive)
  (let ((result (nth 3 (syntax-ppss))))
    result))

(defun my/company-complete()
  (interactive)
    (if (my/inside-string)
        (company-files)
      (company-complete)))

(add-hook 'after-init-hook 'global-company-mode)

;; Load with `irony-mode` as a grouped backend
(eval-after-load 'company
  '(add-to-list
    'company-backends '(company-c-headers company-irony-c-headers company-irony)))

(eval-after-load 'company
  '(progn
     (define-key company-mode-map (kbd "C-.") 'company-files)
     (define-key company-mode-map (kbd "C-:") 'company-complete)
     (define-key company-active-map (kbd "tab") 'company-complete)
     (define-key company-active-map (kbd "C-n") 'company-select-next)
     (define-key company-active-map (kbd "C-p") 'company-select-previous)
     (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
     ))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(company-auctex-init)

;; quickhelp
(company-quickhelp-mode 1)
(setq company-quickhelp-delay 0.1) ;; default: 0.5, nil -> only upon request


