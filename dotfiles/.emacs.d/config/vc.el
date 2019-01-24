(use-package magit
  :defer 2
  :ensure t
  :bind (("C-x g" . magit-status)))

(setq vc-ignore-dir-regexp (format "\\(%s\\)\\|\\(%s\\)\\|\\(%s\\)|\\(%s\\)"
                                     vc-ignore-dir-regexp
                                     tramp-file-name-regexp
                                     "/nrs/.*"
                                     "/ssh:.+:/nrs/.*"))
