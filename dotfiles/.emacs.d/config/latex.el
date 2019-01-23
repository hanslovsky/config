;; probably obsolete
(defun my/add-run-latexmk ()
  (when (executable-find "latexmk")
    (delete-dups
     (push '("LatexMK" "latexmk -%(PDF) %s %t" TeX-run-TeX t t :help "Use latexmk for compilation")
           TeX-command-list))))

(defun my/add-run-lualatex (is-default)
  (when (executable-find "lualatex")
    (delete-dups
     (push '("lualatex" "lualatex -%(PDF) %s %t" TeX-run-TeX t t :help "Use lualatex for compilation")
           TeX-command-list))
    ;; for some reason, this does not work but don't wanna spend too much time to work it out:
    (when is-default
        (setq TeX-command-default "lualatex"))))

(use-package tex-site
  :ensure auctex
  :defer t
  :mode ("\\.tex\\'" . LaTeX-mode)
  :config
  ;; use a more sophisticated algorithm to find master file; prompt on failure
  (setq-default TeX-master nil)
  ;; enable parsing for autocompletion
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  ;; customize indent to my likings
  (setq LaTeX-indent-level 4)
  (setq LaTeX-item-indent 2)
  (setq TeX-brace-indent-level 4)
  ;; use pdf mode
  (setq TeX-PDF-mode t)
  ;; automtically add {} after _ and ^
  (setq Tex-electric-sub-and-superscript t)
  ;; operate on visual lines rather than on logical lines
  (add-hook 'LaTeX-mode-hook 'visual-line-mode)
  ;; `-key will put symbol based on key
  (add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
  ;; auctex-latexmk
  (use-package auctex-latexmk :ensure t :config (auctex-latexmk-setup))
  (use-package flyspell :ensure t)
  
  ;; setup ghostscript
  ;; needs -dNOSAFER instead of -dSAFER 
  (setq preview-gs-options (quote ("-q" "-dNOSAFER" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
  ;; setup okular as the default pdf viewer
  (setq TeX-view-p-list '(("Okular" "okular –unique %o#src:%n%b")))
  (setq TeX-view-program-selection '((output-pdf "Okular")))
  ;; add lualatex command
  (my/add-run-lualatex t))


