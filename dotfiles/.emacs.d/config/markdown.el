(use-package
  markdown-mode
  :defer t
  :ensure t
  :mode (("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)
         ("README\\.md\\'" . gfm-mode)))

(use-package
  vmd-mode
  :defer t
  :after markdown-mode
  :ensure t
  :bind (:map markdown-mode-map ("<f9>" . vmd-mode)))
