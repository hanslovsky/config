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
  (add-hook 'LaTeX-mode-hook 'auto-fill-mode)
  (use-package flyspell :ensure t)
  
  ;; setup ghostscript
  ;; needs -dNOSAFER instead of -dSAFER 
  (setq preview-gs-options (quote ("-q" "-dNOSAFER" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))
  ;; setup okular as the default pdf viewer
  (setq TeX-view-p-list '(("Okular" "okular –unique %o#src:%n%b")))
  (setq TeX-view-program-selection '((output-pdf "Okular"))))


