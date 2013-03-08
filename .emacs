;; ===== Set the highlight current line minor mode ===== 


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
(load-theme 'solarized-dark t)

;; In every buffer, the line which contains the cursor will be fully
;; highlighted

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
