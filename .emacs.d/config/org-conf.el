;; org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/.emacs.d/org/basics.org"))
(when (not (boundp 'org-latex-packages-alist))
  (setq org-latex-packages-alist '())
  )
(add-to-list 'org-latex-packages-alist 'tabularx)
(add-to-list 'org-latex-packages-alist 'tabu)

