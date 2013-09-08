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
(set-default 'cursor-type '(hbar . 3))

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

;; autocomplete switch buffers on C-x b
;; http://stackoverflow.com/questions/7394289/how-can-i-more-easily-switch-between-buffers-in-emacs
(iswitchb-mode t)
(setq iswitchb-buffer-ignore '("^ " "*Completions*" "Shell Command Output*"
                               "*Messages*" "Async Shell Command"))

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

(global-set-key (kbd "<f8>") 'delete-current-buffer-and-file)

;; set fonts and faces
(custom-set-faces
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 83 :width normal))))
 '(minimap-font-face ((t (:height 50 :family "DejaVu Sans Mono"))) t))
