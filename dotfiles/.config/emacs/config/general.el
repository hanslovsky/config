;;; general-conf.el  -*- lexical-binding: t; -*-

;; provide general config

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

;; No scroll bar
(scroll-bar-mode -1)

;; No menu bar
(menu-bar-mode -1)

;; No tool bar
(tool-bar-mode -1)

;; set default cursor
;; (set-default 'cursor-type '(hbar . 100)) ;; bar, [0-100%]
(set-default 'cursor-type 'box) ;; box
;; (set-default 'cursor-type 'hollow) ;; hollow box

;; enable left hand side line numbers
(global-display-line-numbers-mode)

;; write y instead of yes
(fset 'yes-or-no-p 'y-or-n-p)

;; smart cursor (cursor color equals text color)
(use-package smart-cursor-color :ensure t)
(smart-cursor-color-mode 1)
;; smart cursor color does not work with global hl line mode
(global-hl-line-mode -1)

;; no startup-screen
(setq inhibit-startup-screen t)

;; show matching paren
(show-paren-mode t)

;; no tabs!
(setq-default indent-tabs-mode nil)

;; blinking cursor
(blink-cursor-mode 1)

;; settings for backup files (*~):
(setq backup-directory-alist '(("." . "~/.config/emacs/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )

;; display time in tray
(display-time-mode 1)

;; enabling disabled commands
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; delete file and associated buffer
(defun delete-current-buffer-and-file ()
  "Removes file connected to current buffer and kills buffer."
  (interactive)
  (let ((filename (buffer-file-name))
        (buffer (current-buffer))
        (name (buffer-name)))
    (if (not (and filename (file-exists-p filename)))
        (error "Buffer '%s' is not visiting a file!" name)
      (when (yes-or-no-p "Are you sure you want to remove this file? ")
        (delete-file filename)
        (kill-buffer buffer)
        (message "File '%s' successfully removed" filename)))))

;; used to be f8, but use a keybinding less prone to be hit by accident
;; for this fatal command
(global-set-key (kbd "M-<f12>") 'delete-current-buffer-and-file)

;; set fonts and faces
;; (custom-set-faces                                                     
;;  '(default ((t (:family "Source Code Pro" :foundry "unknown" :slant normal :weight normal :height 83 :width normal))))
;;  '(minimap-font-face ((t (:height 50 :family "DejaVu Sans Mono"))) t))

;; while emacs fucks up, comment this:
;; (custom-set-faces
;;  '(default ((t (:family "Source Code Pro" :foundry "unknown" :slant normal :weight normal :height 113 :width normal))))
;;  '(minimap-font-face ((t (:height 50 :family "Source Code Pro"))) t))

;; monofur ;; ++
;; Souce Code Pro ;; ++
;; and comment this while emacs fucks up:
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro"))
;; (set-face-attribute 'default t :font  "Source Code Pro")

;; use this instead
;; this is here because emacs doesn't know oxygen font and fucks up
(add-to-list 'initial-frame-alist '(font . "Source Code Pro-10"))
(add-to-list 'default-frame-alist '(font . "Source Code Pro-10"))

;; make buffers referring to files with the same name more distinguishable
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(use-package visual-fill-column :ensure t)
(global-visual-line-mode)
;; set fill column to 100
(setq-default fill-column 100)

(use-package visible-mark :ensure t)
(global-visible-mark-mode 1)

(use-package visual-regexp :ensure t)
(use-package visual-regexp-steroids
  :ensure t
  :after visual-regexp
  :bind ((:map global-map
               ("C-c r" . vr/replace)
               ("C-c q" . vr/query-replace))
         (:map esc-map
               ("C-r" . vr/isearch-backward)
               ("C-s" . vr/isearch-forward))))

(use-package restart-emacs :ensure t)

;;; NOTE!! We don't need this when starting emacs via command line, which is what I always do anyways
;; get environment variables from shell
;; TODO this is very slow. Will need to re-work ~/.zshrc into ~/.zshenv so I can use non-interactive shell
;; (use-package exec-path-from-shell :ensure t)
;; (when (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
;;   (exec-path-from-shell-initialize))

(setq user-full-name  "Philipp Hanslovsky")

;; math stuff
(use-package math-symbol-lists :ensure t)
(use-package math-symbols :ensure t)

