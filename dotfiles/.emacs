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

(setq gc-cons-threshold 100000000)
;; elpa
(load-file "~/.emacs.d/config/elpa-conf.el")

;; use-package
(install_if_missing 'use-package)

;; auto-complete and narrowing
(load-file "~/.emacs.d/config/completion-narrowing.el")

;; volatile highlights mode
(use-package volatile-highlights
  :defer 2
  :ensure t
  :bind ("<f8>" . volatile-highlights-mode)
  :init (volatile-highlights-mode))

;; markdown
(load-file "~/.emacs.d/config/markdown.el")

;; auctex
(load-file "~/.emacs.d/config/latex.el")

;; general config
(load-file "~/.emacs.d/config/general-conf.el")

;; iedit
(use-package iedit :ensure t :defer 2 :bind (("C-;" . iedit-mode) ("C-x r <return>" . 'iedit-rectangle-mode)))

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
(use-package json-mode :defer t :ensure t :mode "\\.json\\'")

;; theme related settings
(load-file "~/.emacs.d/config/themes-conf.el")

;; speedbar - deactivate now due to a bug with emacsclient
;; (load-file "~/.emacs.d/config/speedbar-conf.el")

;; undo tree
(use-package undo-tree :defer 2 :ensure t :diminish undo-tree-mode :init (global-undo-tree-mode))

;; version control
(load-file "~/.emacs.d/config/vc.el")

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

;; esup
(use-package esup :ensure t :defer 2 :config (setq esup-user-init-file (file-truename "~/.emacs")))

;; perspective
(use-package perspective :ensure t :defer 1 :config (persp-mode 1))

;; do not store settings made through customize in ~/.emacs
(setq custom-file "~/.emacs.d/config/custom.el")
(load custom-file 'noerror)

(use-package doom-themes :defer 2 :ensure t)

;;; modeline
(use-package ghub :ensure t)
(use-package doom-modeline
  :defer 2
  :ensure t
  :config
  (setq doom-modeline-minor-modes t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon nil
        doom-modeline-time-icon nil
        doom-modeline-battery t
        doom-modeline-time t
        doom-modeline-lsp nil
        doom-modeline-enable-word-count t
        doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
        doom-modeline-buffer-encoding nil
        doom-modeline-indent-info nil
        doom-modeline-vcs-max-length 12
        doom-modeline-github nil
        doom-modeline-github-interval (* 30 60))
  :init (doom-modeline-mode 1))
(use-package minions :ensure t :init (minions-mode))
(use-package keycast :ensure t :init (keycast-header-line-mode))

;;; TODO
(use-package eyebrowse :defer 2 :ensure t)

