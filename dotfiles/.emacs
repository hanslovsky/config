;;; package -- Summary
;;; Commentary:
;; This is my Emacs file.  It has grown over time and will certainly do so in future
;; To put some structure in my config I decided to split it up into smaller config files

;; this has to go before any packae is loaded that has been installed using elpa
;; see: http://stackoverflow.com/questions/17598801/emacs-sometimes-cant-open-load-file

;; emacs determines file modes in this order:
;; 1. file variables, e.g. first non-empty line ; -*-Lisp-*-
;; 2. Shebang
;; 3. magic-mode-alist looking at the text of the buffer
;; 4. auto-mode-alist looking at the filename (prefer to use this)
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Choosing-Modes.html

;; elpa
(load-file "~/.emacs.d/config/elpa-conf.el")

;; use-package
(install_if_missing 'use-package)

;; volatile highlights mode
(use-package volatile-highlights
  :defer 2
  :ensure t
  :bind ("<f8>" . volatile-highlights-mode))

;; markdown
(load-file "~/.emacs.d/config/markdown.el")

;; auctex
(load-file "~/.emacs.d/config/latex.el")

;; company
(load-file "~/.emacs.d/config/company-conf.el")

;; general config
(load-file "~/.emacs.d/config/general-conf.el")

;; helm
(load-file "~/.emacs.d/config/helm-conf.el")

;; iedit
(load-file "~/.emacs.d/config/iedit-conf.el")

;; tramp
(load-file "~/.emacs.d/config/tramp-conf.el")

;; minimap
;; http://elpa.gnu.org/packages/minimap.html
(use-package minimap
  :defer 2
  :ensure t
  :init
  (setq minimap-always-recenter t)
  (setq minimap-dedicated-window t)
  (setq minimap-minimum-width 20)
  (setq minimum-recreate-window t)
  (setq minimap-automatically-delete-window t)
  (setq minimap-update-delay 0.03)
  :bind ("<f7>" . minimap-mode))

;; json
(load-file "~/.emacs.d/config/json-conf.el")

;; theme related settings
(load-file "~/.emacs.d/config/themes-conf.el")

;; matlab
(load-file "~/.emacs.d/config/matlab-conf.el")

;; cmake
(load-file "~/.emacs.d/config/cmake-conf.el")

;; calendar
(load-file "~/.emacs.d/config/calendar-conf.el")

;; org
(load-file "~/.emacs.d/config/org-conf.el")

;; speedbar - deactivate now due to a bug with emacsclient
;; (load-file "~/.emacs.d/config/speedbar-conf.el")

;; undo tree
(load-file "~/.emacs.d/config/undo-tree-conf.el")

;; magit
(load-file "~/.emacs.d/config/magit-conf.el")

;; flymake
(load-file "~/.emacs.d/config/flymake-conf.el")

;; yasnippet
(load-file "~/.emacs.d/config/yasnippet-conf.el")

;; python-mode
(load-file "~/.emacs.d/config/python-conf.el")

;; jedi
(load-file "~/.emacs.d/config/jedi-conf.el")

;; gnuplot
(load-file "~/.emacs.d/config/gnuplot-conf.el")

;; c-mode-common
(load-file "~/.emacs.d/config/c-mode-common-conf.el")

;; functions
;; kill
(load-file "~/.emacs.d/functions/kill.el")

;; utility
(load-file "~/.emacs.d/functions/utility.el")

;; write to file and keep buffer
(load-file "~/.emacs.d/functions/write-file-and-keep-buffer.el")

;; show color for color representations
(load-file "~/.emacs.d/config/rainbow-conf.el")

;; parantheses highlighting and completion
(load-file "~/.emacs.d/config/parens-conf.el")

;; google
(load-file "~/.emacs.d/config/google-conf.el")

;; nyan cat
(load-file "~/.emacs.d/config/nyan-conf.el")

;; perspective
(use-package perspective :ensure t :defer 1 :config (persp-mode 1))

;; projectile
(load-file "~/.emacs.d/config/projectile-conf.el" )

(my/global-company-mode)

;; do not store settings made through customize in ~/.emacs
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file 'noerror)


