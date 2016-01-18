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
;; (set-default 'cursor-type 'box) ;; box
(set-default 'cursor-type 'hollow) ;; hollow box

;; set cursor color
;; (set-cursor-color "black")

;; enable left hand side line numbers
(global-linum-mode t)

;; write y instead of yes
(fset 'yes-or-no-p 'y-or-n-p)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
(global-hl-line-mode 1)

;; no startup-screen
(setq inhibit-startup-screen t)

;; show matching paren
(show-paren-mode t)

;; no tabs!
(setq-default indent-tabs-mode nil)

;; blinking cursor
(blink-cursor-mode 1)

;; smart cursor (cursor color equals text color)
(install_if_missing 'smart-cursor-color)
(smart-cursor-color-mode 1)

;; settings for backup files (*~):
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
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

;; auto fill
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; set fill column to 100
(setq-default fill-column 100)

;; set split variables to force horizontal split
;; (setq split-height-threshold nil)
;; (setq split-width-threshold 0)

(install_if_missing 'restart-emacs)

;; get environment variables from shell
(install_if_missing 'exec-path-from-shell)
(when (or (eq system-type 'darwin) (eq system-type 'gnu/linux))
  (exec-path-from-shell-initialize))

(setq user-full-name  "Philipp Hanslovsky")

