(install_if_missing 'clojure-mode)
(install_if_missing 'cider)
(install_if_missing 'clj-refactor)
(install_if_missing 'cljr-helm)
(install_if_missing 'clojure-cheatsheet)
(install_if_missing 'aggressive-indent)

(add-to-list 'auto-mode-alist '("\\.clj\\'" . clojure-mode))

(defun my-clojure-mode-hook ()
  (clj-refactor-mode 1)
  (yas-minor-mode 1) ; for adding require/use/import statements
  ;; This choice of keybinding leaves cider-macroexpand-1 unbound
  (cljr-add-keybindings-with-prefix "C-c C-m"))

(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)
(add-hook 'clojure-mode-hook #'subword-mode)
;; (add-hook 'clojure-mode-hook #'smartparens-strict-mode)
(add-hook 'clojure-mode-hook #'aggressive-indent-mode)
