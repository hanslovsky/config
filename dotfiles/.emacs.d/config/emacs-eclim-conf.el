;; An interface to the Eclipse IDE
;; check http://www.skybert.net/emacs/java/
(install_if_missing 'emacs-eclim)

(defun my-java-mode-hook ()
  (auto-fill-mode)
  ;(flyspell-prog-mode)
  ;(flymake-mode)
  (subword-mode)
  ;(smartscan-mode)

  (define-key java-mode-map (kbd "<f2>") 'eclim-problems)

  ;; mimic IDEA
  (define-key java-mode-map (kbd "C-M-g")  'eclim-java-find-declaration)
  (define-key java-mode-map (kbd "C-M-o")  'eclim-java-import-organize)
  (define-key java-mode-map (kbd "C-q")    'eclim-java-show-documentation-for-current-element)
  (define-key java-mode-map (kbd "M-i")    'eclim-java-implement)
  (define-key java-mode-map (kbd "M-RET")  'eclim-problems-correct)
  (define-key java-mode-map (kbd "<M-f7>") 'eclim-java-find-references)
  (define-key java-mode-map (kbd "<S-f6>") 'eclim-java-refactor-rename-symbol-at-point)
  )



(add-hook 'java-mode-hook 'my-java-mode-hook)



(setq eclim-auto-save t
      eclim-executable "~/local/eclipse/eclim"
      eclimd-executable "~/local/eclipse/eclimd"
      eclim-wait-for-process nil
      eclim-default-workspace "~/workspace"
      eclim-use-yasnippet nil
      help-at-pt-display-when-idle t
      help-at-pt-timer-delay 0.1
      )


(help-at-pt-set-timer)

;; (require 'auto-complete-config)
;; (ac-config-default)
(require 'ac-emacs-eclim-source)
(ac-emacs-eclim-config)
