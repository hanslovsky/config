;; ===== Set the highlight cpurrent line minor mode =====
(message (getenv "PATH"))

;; ========== Color themes                     ==========
;;(require 'color-theme)
;;(color-theme-initialize)
;;(load-file "~/.emacs-themes/color-theme-sunburst.el")
;;(load-file "~/.emacs-themes/color-theme-tango.el")
;;(load-file "~/.emacs-themes/gentooish.el")
;;(add-to-list 'load-path "~/.emacs-themes")
;;(color-theme-tm)
;;(color-theme-tango)
;;(color-theme-gentooish)

;; (setq custom-theme-path "~/.emacs-themes/")
(add-to-list 'custom-theme-load-path "~/.emacs-themes")
;; do not load colortheme if started in terminal
(if window-system
    (load-theme 'solarized-dark t)
  (load-theme 'manoj-dark t))

;; In every buffer, the line which contains the cursor will be fully
;; highlighted
; (if window-system
;    (global-hl-line-mode 1))
(global-hl-line-mode 1)


;; Specify default font
;; (set-default-font "Inconsolata 12")

;; open *.h in c++ mode instead of c mode
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; ========== Enable Line and Column Numbering ==========

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
(set-default 'cursor-type '(hbar . 1))

;; enable left hand side line numbers
(global-linum-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-safe-themes (quote ("fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" default)))
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 83 :width normal)))))

;; ===== Matlab Mode =====
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")

;; minor fold mode
;; (hs-minor-mode t)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

;; no tabs!
(setq-default indent-tabs-mode nil)

;; magit
;; (require 'magit)

;; blinking cursor
(load-file "~/.emacs.d/blink-cursor-colors.el")


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


;; add license text as file heading
(defun add-license-heading (license_dir license_type)
  "Adds license in front of file"
  (interactive
   (list (read-directory-name "Directory in which to look for license file: " (get_default_license_dir) (get_default_license_dir))
         (read-string "License to be used: " (get_default_license_type))
         ))
  (message "%s %s" license_dir license_type)
  (if (file-exists-p license_dir)
      ; (let filepath (concat license_dir "/" license_type)
      (if (file-exists-p (concat license_dir "/" license_type))
          (progn
            (beginning-of-buffer)
            (insert-file (concat license_dir "/" license_type))
            (pop-global-mark)
            (message "Added license %s at the beginning of the buffer." (concat license_dir "/" license_type)))
        (message "File %s does not exist!" (concat license_dir "/" license_type)))
    (message "Directory %s does not exist!" license_dir))
  )


(defun get_default_license_dir ()
  (interactive)
  (when (not (boundp 'default_license_dir))
    (setq default_license_dir "~/.emacs.d/license"))
  (setq default_license_dir default_license_dir))


(defun get_default_license_type ()
  (interactive)
  (when (not (boundp 'default_license_type))
    (setq default_license_type "GPL"))
  (setq default_license_type default_license_type))

  
    



;; settings for backup files (*~):
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )


;; cedet
;; (load-file "~/.emacs.d/cedet_config.el")

;; ede
;; (load-file "~/.emacs.d/ede_config.el")


;; tramp
(require 'tramp)



