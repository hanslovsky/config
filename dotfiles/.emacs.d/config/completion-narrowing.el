(use-package eglot
  :ensure t
  :hook ((python-mode . eglot-ensure)
         (rust-mode-hook . eglot-ensure)))


;; https://www.reddit.com/r/emacs/comments/qfrxgb/using_emacs_episode_80_vertico_marginalia_consult/
(use-package vertico
  :ensure t
  :init (vertico-mode)
  :custom
  (vertico-count 30)
  (vertico-resize nil)
  (vertico-cycle t)
  :bind (:map vertico-map
              ;; cycle through candidate groups, e.g. buffers vs files in consult-buffer
              ("C-M-n" . vertico-next-group)
              ("C-M-p" . vertico-previous-group)))
(use-package vertico-quick
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("M-q"   . vertico-quick-insert)
              ("C-q"   . vertico-quick-exit)))
(use-package vertico-prescient
  :ensure t
  :after vertico
  :hook (vertico-mode . vertico-prescient-mode))

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
         ("C-x M-f" . consult-find)
         ("C-x b"   . consult-buffer)
         ("C-x C-b" . consult-buffer))
  :init (recentf-mode)
  )

(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package all-the-icons :ensure t :if (display-graphic-p))
(use-package all-the-icons-completion
  :ensure t
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))

(use-package company
  :ensure t
  :init
  :bind (("C-." . company-files)
         ("C-<tab>" . company-complete))
  :config
  (setq company-idle-delay 0.3)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 30)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t))

(use-package company-quickhelp
  :ensure t
  :config
  (setq company-quickhelp-delay 0.1)
  :bind (:map company-active-map
              ("C-c h". company-quickhelp-manual-begin))
  :hook (company-mode . company-quickhelp-mode))
