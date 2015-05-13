;; autocomplete switch buffers on C-x b
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)
(setq ido-ignore-buffers '("^ " "*Completions*" "Shell Command Output*"
                               "*Messages*" "Async Shell Command"))
(ido-mode 1)
