(install_if_missing 'cmake-mode)
(install_if_missing 'cmake-font-lock)





;; cmake major mode
(require 'cmake-mode)
(setq auto-mode-alist
      (append '(("CMakeLists\\.txt\\'" . cmake-mode)
                ("\\.cmake\\'" . cmake-mode))
              auto-mode-alist))

;; add cmake-mode to package list to be installed if not present
(autoload 'cmake-font-lock-activate "cmake-font-lock" nil t)
;; (add-hook 'cmake-mode-hook 'cmake-font-lock-activate)
