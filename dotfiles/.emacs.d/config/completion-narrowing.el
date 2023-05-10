(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook (
         (prog-mode . lsp-deferred)
         (lsp-mode . lsp-enable-which-key-integration)
         )
  :commands (lsp lsp-deferred))
(use-package lsp-treemacs :ensure t :commands lsp-treemacs-errors-list)
(use-package dap-mode :ensure t) ;; for debugger
(use-package which-key :ensure t :config (which-key-mode))


;; https://www.reddit.com/r/emacs/comments/qfrxgb/using_emacs_episode_80_vertico_marginalia_consult/
(use-package vertico :ensure t :init (vertico-mode))
(use-package savehist :ensure t :init (savehist-mode))
(use-package emacs
  :init
  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

(use-package consult
  :ensure t
  :bind (("C-c M-x" . consult-mode-command)
         ("M-y"     . consult-yank-pop) ;; maybe use consult-yank-from-kill-ring instead
         ("C-c f"   . consult-recent-file)
         ("C-x C-f" . consult-find)
         ("C-x b"   . consult-buffer)
         ("C-x C-b" . consult-buffer))
  :init (recentf-mode)
  )

(use-package marginalia
  :ensure t
  :bind (("M-A" . marginalia-cycle)
         :map minibuffer-local-map
         ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; (use-package company
;;   :defer 2
;;   :ensure t
;;   :init
;;   (defvar company-idle-delay 0.3)
;;   (defvar company-show-numbers t)
;;   (defvar company-minimum-prefix-length 1)
;;   (defvar company-tooltip-limit 30)
;;   (global-company-mode)
;;   (defvar company-quickhelp-delay 0.1)
;;   ;; Documentation popups for Company
;;   (use-package company-quickhelp :ensure t)
;;   (use-package helm-company :ensure t)
;;   :config
;;   (company-quickhelp-mode)
;;   (progn
;;     (define-key company-mode-map (kbd "C-.") 'company-files)
;;     (define-key company-active-map (kbd "TAB") 'company-complete)
;;     (define-key company-active-map (kbd "C-d") 'company-quickhelp-show)
;;     (define-key company-active-map (kbd "M-d") 'company-show-doc-buffer)
;;     (define-key company-active-map (kbd "C-h") 'helm-company)))

;; (use-package company-lsp)
