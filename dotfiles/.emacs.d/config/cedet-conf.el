;; EXPERIMENTAL! http://www.emacswiki.org/emacs/CEDET_Quickstart
;; CHECK THIS OUT: http://www.emacswiki.org/emacs-es/EmacsCodeBrowser
;; AND THIS: http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html <- best one so far

;; cedet & ede (built-in)
;; Semantic
(require 'semantic/ia)
(require 'semantic/bovine/gcc)

(semantic-mode 1)

(global-semantic-idle-scheduler-mode t)
(global-semantic-idle-completions-mode t)
(global-semantic-idle-summary-mode t)
(global-semantic-decoration-mode t)
(global-semantic-highlight-func-mode t)
(global-semantic-show-unmatched-syntax-mode t)
(global-semantic-stickyfunc-mode t)
(global-semantic-idle-local-symbol-highlight-mode 1)
(global-semantic-mru-bookmark-mode t)
(global-semantic-mru-bookmark-mode t)
;; (semantic-complete-analyze-inline t)
;; (global-semantic-tag-folding-mode t) not available in built-in cedet

(global-semanticdb-minor-mode 1)

(global-ede-mode 0)


(semantic-add-system-include "~/local/include" 'c++-mode)
(semantic-add-system-include "~/local/include" 'c-mode)

(defun my-c-mode-cedet-hook ()
  (ede-minor-mode)
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key (kbd "C-c , -") 'senator-fold-tag)
  (local-set-key (kbd "C-c , +") 'senator-unfold-tag))
(add-hook 'c-mode-hook 'my-c-mode-cedet-hook)
(add-hook 'c++-mode-hook 'my-c-mode-cedet-hook)


;; CC-mode
(add-hook 'c-mode-hook '(lambda ()
                          (setq ac-sources (append '(ac-source-semantic) ac-sources))))
;; (semantic-mode t)))
