;; EXPERIMENTAL! http://www.emacswiki.org/emacs/CEDET_Quickstart
;; cedet & ede (built-in)
;; Semantic
(require 'semantic/ia)

(global-semantic-idle-completions-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
;; (global-semantic-tag-folding-mode t) not available in built-in cedet

(global-semanticdb-minor-mode 1)

(global-ede-mode 'nil)

(semantic-add-system-include "~/local/include" 'c++-mode)


;; CC-mode
(add-hook 'c-mode-hook '(lambda ()
        (setq ac-sources (append '(ac-source-semantic) ac-sources))
        (semantic-mode t)))

;; Autocomplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (expand-file-name
             "~/.emacs.d/elpa/auto-complete-20130724.1750"))
(setq ac-comphist-file (expand-file-name
             "~/.emacs.d/ac-comphist.dat"))
(ac-config-default)
