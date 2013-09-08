;; open *.h in c++ mode instead of c mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; google style
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
