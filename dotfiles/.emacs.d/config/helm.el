(use-package helm
  :defer 1
  :ensure t
  :config (recentf-mode 1)
  :bind (("M-x"     . 'helm-M-x)
         ("M-y"     . 'helm-show-kill-ring)
         ("C-c f"   . 'helm-recentf)
         ("C-x C-f" . 'helm-find-files)
         ("C-x b"   . 'helm-buffers-list)
         ; overwrite C-x C-b as well
         ("C-x C-b" . 'helm-buffers-list)))

;; probably put should put this in git config instead
(use-package helm-ls-git :defer t)
