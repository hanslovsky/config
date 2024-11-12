;;; package -- Summary -*- lexical-binding: t; -*-
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

;; TODO Do I need to fail on emacs version < 26?
(when (version< emacs-version "26.1")
  (error "Detected Emacs %s but only 26.1 and higher is supported"
	 emacs-version))

;; Support for early-init was added in Emacs 27 so in order to properly support
;; Emacs 26, we need to manually load it.
(when (< emacs-major-version 27)
  (load (concat user-emacs-directory "early-init") nil 'nomessage))

(setq use-package-compute-statistics t)

(let ((debug-on-error t)
      (debug-on-quit t)
      ;; Every require/load looks at this, so removing it gets us a small
      ;; performance improvement. However we do want it set after loading
      ;; everything, so we use let so this will return to normal after this
      ;; block.
      (file-name-handler-alist nil))

  (defun my/load-conf (name)
    (load-file (format "~/.emacs.d/config/%s.el" name)))

  (defun my/load-confs (names)
    (mapcar #'my/load-conf names))

  (package-activate-all)

  ;; elpa
  (my/load-conf 'elpa)

  ;; use-package
  (install_if_missing 'use-package)

  ;; benchmark start-up time
  (use-package benchmark-init
    :ensure t
    :config
    ;; To disable collection of benchmark data after init is done.
    (add-hook 'after-init-hook 'benchmark-init/deactivate))

  ;; auto-complete and narrowing
  (my/load-conf 'completion-narrowing)

  ;; volatile highlights mode
  (use-package volatile-highlights
    :defer 2
    :ensure t
    :bind ("<f8>" . volatile-highlights-mode)
    :init (volatile-highlights-mode))

  (my/load-confs '("markdown" "latex" "general"))

  ;; iedit
  (use-package iedit :ensure t :defer 2 :bind (("C-;" . iedit-mode) ("C-x r <return>" . 'iedit-rectangle-mode)))

  ;; json
  (use-package json-mode :defer t :ensure t :mode "\\.json\\'")

  ;; theme related settings
  ;; (my/load-conf 'themes)

  ;; undo tree
  (use-package undo-tree :defer 2 :ensure t :diminish undo-tree-mode :init (global-undo-tree-mode))

  (my/load-confs
   '("vc" "kill" "utility" "write-file-and-keep-buffer" "rainbow" "parens" "google" "nyan"))

  ;; perspective
  (use-package perspective :ensure t :defer 1 :config (persp-mode 1))

  ;; do not store settings made through customize in ~/.emacs
  (setq custom-file "~/.emacs.d/config/custom.el")
  (load custom-file 'noerror)

  ;; (use-package doom-themes :defer 2 :ensure t)

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

  )

