;; ===== Set the highlight current line minor mode =====
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
(
 if window-system
    (load-theme 'solarized-dark t)
)

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

;; no tabs!
(setq-default indent-tabs-mode nil)

;; magit
;; (require 'magit)

;; blinking cursor
(load-file "~/.emacs.d/blink-cursor-colors.el")


;; CEDET
;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
;; IMPORTANT: Tou must place this *before* any CEDET component (including
;; EIEIO) gets activated by another package (Gnus, auth-source, ...).
;; (load-file "~/.emacs.d/cedet/cedet-devel-load.el")

;; Add further minor-modes to be enabled by semantic-mode.
;; See doc-string of `semantic-default-submodes' for other things
;; you can use here.
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-summary-mode t)
;; (add-to-list 'semantic-default-submodes 'global-semantic-idle-completions-mode t)
;; (add-to-list 'semantic-default-submodes 'global-cedet-m3-minor-mode t)

;; Enable Semantic
;; (semantic-mode 1)

;; Enable EDE (Project Management) features
;; (global-ede-mode 1)



;; CEDET
;; taken from http://cxwangyi.wordpress.com/2010/08/21/using-cedet-with-emacs/
(load-file "~/.emacs.d/cedet/common/cedet.el")
 
(global-ede-mode 'nil)                  ; do NOT use project manager
 
(semantic-load-enable-excessive-code-helpers)
 
(require 'semantic-ia)          ; names completion and display of tags
(require 'semantic-gcc)         ; auto locate system include files


;; (semantic-add-system-include "~/3rd-party/boost-1.43.0/include/" 'c++-mode)
;; (semantic-add-system-include "~/3rd-party/protobuf-2.3.0/include" 'c++-mode)
(semantic-add-system-include "~/local/include" 'c++-mode)


 
(require 'semanticdb)
(global-semanticdb-minor-mode 1)
 
(defun my-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)
  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  (local-set-key "\C-c+" 'semantic-tag-folding-show-block)
  (local-set-key "\C-c-" 'semantic-tag-folding-fold-block)
  (local-set-key "\C-c\C-c+" 'semantic-tag-folding-show-all)
  (local-set-key "\C-c\C-c-" 'semantic-tag-folding-fold-all)
  )
(add-hook 'c-mode-common-hook 'my-cedet-hook)
 
(global-semantic-tag-folding-mode 1)
 
(require 'eassist)
 
;(concat essist-header-switches ("hh" "cc"))
(defun alexott/c-mode-cedet-hook ()
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)
 
;; gnu global support
(require 'semanticdb-global)
;(error "%s" exec-path)
(semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)
 
;; ctags
;; (require 'semanticdb-ectag)
;; (semantic-load-enable-primary-exuberent-ctags-support)
 
;; (global-semantic-idle-tag-highlight-mode 1)


;; ECB
;; taken from http://cxwangyi.wordpress.com/2010/08/21/using-cedet-with-emacs/

(add-to-list 'load-path "~/.emacs.d/ecb")
(require 'ecb)
(require 'ecb-autoloads)
