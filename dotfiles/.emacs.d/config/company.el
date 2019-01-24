(use-package company
  :defer 2
  :ensure t
  :init
  (defvar company-idle-delay 0.3)
  (defvar company-show-numbers t)
  (defvar company-minimum-prefix-length 1)
  (defvar company-tooltip-limit 30)
  (global-company-mode)
  (defvar company-quickhelp-delay 0.1)
  ;; Documentation popups for Company
  (use-package company-quickhelp :ensure t)
  (use-package helm-company :ensure t)
  :config
  (company-quickhelp-mode)
  (progn
    (define-key company-mode-map (kbd "C-.") 'company-files)
    (define-key company-active-map (kbd "TAB") 'company-complete)
    (define-key company-active-map (kbd "C-d") 'company-quickhelp-show)
    (define-key company-active-map (kbd "M-d") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "C-h") 'helm-company)))
