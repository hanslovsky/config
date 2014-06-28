(install_if_missing 'google-c-style)

 ;; open *.h in c++ mode instead of c mode
 (add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
 
 ;; google style
 (require 'google-c-style)
 (add-hook 'c-mode-common-hook 'google-set-c-style)


;; add google-c-style to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'google-c-style)


