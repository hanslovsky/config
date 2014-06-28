;; EXPERIMENTAL! http://www.emacswiki.org/emacs/CEDET_Quickstart
;; CHECK THIS OUT: http://www.emacswiki.org/emacs-es/EmacsCodeBrowser
;; AND THIS: http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html <- best one so far


(install_if_missing 'auto-complete)
(install_if_missing 'auto-complete-c-headers)
(install_if_missing 'auto-complete-auctex)

(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'auto-complete)

(require 'auto-complete)
(require 'auto-complete-config)

(setq ac-comphist-file (expand-file-name
                        "~/.emacs.d/ac-comphist.dat"))
(ac-config-default)

;; define include search patterns
(setq achead:include-patterns '("\\.\\(h\\|hpp\\|hh\\|hxx\\)$" "/[a-zA-Z-_]+$") )


(defun my:ac-c-header-init()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  
  ;; add paths from environment (use gcc to find out include search directories)
  (setq my:c++-headers
        (split-string
         (shell-command-to-string
          "echo -e \"$(`gcc -print-prog-name=cc1plus` -v 2>&1&)\" | grep -E '^ [A-Za-z\./]' | grep -v ':' | sed 's/^ //'")
         "\n" t)
        )

  (setq my:c-headers
        (split-string
         (shell-command-to-string
          "echo -e \"$(`gcc -print-prog-name=cc1` -v 2>&1&)\" | grep -E '^ [A-Za-z\./]' | grep -v ':' | sed 's/^ //'")
         "\n" t)
        )

  (dolist (element my:c++-headers)
    (when (file-exists-p element)
      (add-to-list 'achead:include-directories element)
      )
    )
  (dolist (element my:c-headers)
    (when (file-exists-p element)
      (add-to-list 'achead:include-directories element)
      )
    )
  )

(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

