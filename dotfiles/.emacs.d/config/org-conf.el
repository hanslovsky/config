;; org
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(let ((dir "~/.org"))
  (message dir)
  (unless (file-exists-p dir)
    (make-directory dir))
  (setq org-agenda-files (list "~/.org")))
(when (not (boundp 'org-latex-packages-alist))
  (setq org-latex-packages-alist '())
  )
;; (add-to-list 'org-latex-packages-alist 'tabularx)
;; (add-to-list 'org-latex-packages-alist 'tabu)

(install_if_missing 'org)
(install_if_missing 'org-bullets)
(install_if_missing 'org-gcal)
(install_if_missing 'org-autolist)
(install_if_missing 'org-beautify-theme)
(install_if_missing 'org-present)
