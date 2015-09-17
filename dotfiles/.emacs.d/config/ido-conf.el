(install_if_missing 'ido-ubiquitous)
(install_if_missing 'ido-vertical-mode)

;; autocomplete switch buffers on C-x b
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-ignore-buffers '("^ " "*Completions*" "Shell Command Output*"
                               "*Messages*" "Async Shell Command"))
(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)
(ido-vertical-mode 1)
(setq ido-vertical-define-keys 'C-n-and-C-p-only)
(setq ido-vertical-show-count t)

;; try helm instead of ido?

;; (setq ido-use-faces t)
;; (set-face-attribute 'ido-vertical-first-match-face nil
;;                     :background nil
;;                     :foreground "orange")
;; (set-face-attribute 'ido-vertical-only-match-face nil
;;                     :background nil
;;                     :foreground nil)
;; (set-face-attribute 'ido-vertical-match-face nil
;;                     :foreground nil)
