;; EXPERIMENTAL! http://www.emacswiki.org/emacs/CEDET_Quickstart
;; CHECK THIS OUT: http://www.emacswiki.org/emacs-es/EmacsCodeBrowser
;; AND THIS: http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html <- best one so far


(install_if_missing 'auto-complete)

(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'auto-complete)

(require 'auto-complete)
(require 'auto-complete-config)

(setq ac-comphist-file (expand-file-name
                        "~/.emacs.d/ac-comphist.dat"))
(ac-config-default)
