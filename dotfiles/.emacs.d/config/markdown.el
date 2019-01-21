(defvar my/markdown-preview nil)
(defun my/update-markdown-preview()
  (when my/markdown-preview (funcall my/markdown-preview)))

(defun my/initialize-markdown (mode)
  (when (not (boundp 'my/markdown-initialized))
    (defvar my/markdown-initialized t)
    ;; (setq my/markdown-preview 'vmd-mode)
    (setq my/markdown-preview 'markdown-preview-mode)
    (install_if_missing 'vmd-mode)
    (install_if_missing 'markdown-mode)
    (install_if_missing 'markdown-mode+)
    (install_if_missing 'markdown-preview-mode)
    (add-hook 'markdown-mode-hook 'my/update-markdown-preview))
  (funcall mode))

(defun my/initialize-markdown-markdown-mode ()
  (my/initialize-markdown 'markdown-mode))

(defun my/initialize-markdown-gfm-mode ()
  (my/initialize-markdown 'gfm-mode))



(add-to-list 'auto-mode-alist '("\\.md\\'" . my/initialize-markdown-markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . my/initialize-markdown-markdown-mode))
(add-to-list 'auto-mode-alist '("README\\.md\\'" . my/initialize-markdown-gfm-mode))
