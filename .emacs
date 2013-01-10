;; ===== Set the highlight current line minor mode ===== 


;; ========== Color themes                     ==========
(require 'color-theme)
(color-theme-initialize)
;;(load-file "~/.emacs-themes/color-theme-sunburst.el")
(load-file "~/.emacs-themes/color-theme-tango.el")
;;(load-file "~/.emacs-themes/gentooish.el")
(add-to-list 'load-path "~/.emacs-themes")
;;(color-theme-tm)
(color-theme-tango)
;;(color-theme-gentooish)


;; In every buffer, the line which contains the cursor will be fully
;; highlighted

(global-hl-line-mode 1)


;; Specify default font
;; (set-default-font "Inconsolata 12")

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
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(tool-bar-mode nil)
 '(transient-mark-mode (quote (only . t))))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#111" :foreground "#ddd" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight semi-bold :height 83 :width normal :foundry "adobe" :family "Source Code Pro")))))

;; ===== Matlab Mode =====
(autoload 'matlab-mode "matlab" "Matlab Editing Mode" t)
(add-to-list
  'auto-mode-alist
  '("\\.m$" . matlab-mode))
(setq matlab-indent-function t)
(setq matlab-shell-command "matlab")