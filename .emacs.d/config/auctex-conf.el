;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
(require 'tex-site)

;; use a more sophisticated algorithm to find master file; prompt on failure
(setq-default TeX-master nil)

;; enable parsing for autocompletion
(setq TeX-auto-save t)
(setq TeX-parse-self t)

;; auto indent after auto linebreak
;; seems to interfere with preview -> disable until solution is found!
;; (add-hook 'LaTeX-mode-hook 'turn-on-auto-fill-mode)

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

;; spell check
;; need to figure out how to enable dict first
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode) 

;; `-key will put symbol based on key
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;; setup ghostscript
;; needs -dNOSAFER instead of -dSAFER 
(setq preview-gs-options (quote ("-q" "-dNOSAFER" "-dNOPAUSE" "-DNOPLATFONTS" "-dPrinted" "-dTextAlphaBits=4" "-dGraphicsAlphaBits=4")))

;; setup okular as the default pdf viewer
(setq TeX-view-p-list '(("Okular" "okular –unique %o#src:%n%b")))
(setq TeX-view-program-selection '((output-pdf "Okular")))
