(use-package python-mode :ensure t)
(use-package jedi :ensure t)
(use-package jedi-core :ensure t)
(use-package company-jedi :ensure t)

(add-hook 'python-mode-hook 'jedi:setup)

(setq jedi:complete-on-dot t)
;; how to display function argument help:
;; '(popup is nicer), nil is also nice
;; (setq jedi:tooltip-method nil)
(setq jedi:tooltip-method '(popup))
;; (setq jedi:tooltip-method '(pos-tip))
;; (setq jedi:tooltip-method '(popup pos-tip))

(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))

(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
 "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
 "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
