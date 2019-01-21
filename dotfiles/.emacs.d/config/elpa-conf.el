;; set repositories for elpa
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(when (not (boundp 'package--old-archive-priorities))
  (setq package-archive-priorities
        '(("melpa-stable" . 40)
          ("melpa" . 35)
          ("marmalade" . 20)
          ("gnu" . 10)))
  )

;; install packages automatically
(load-file "~/.emacs.d/functions/acquire_packages_if_neccessary.el")
