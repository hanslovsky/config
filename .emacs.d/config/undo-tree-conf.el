(install_if_missing 'undo-tree)

;; add undo-tree to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'undo-tree)

(require 'undo-tree)
(global-undo-tree-mode)
