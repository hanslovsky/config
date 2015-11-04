(install_if_missing 'auctex)
(install_if_missing 'auctex-latexmk)

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

;; turn on auto fill -> line breaks
(add-hook 'LaTeX-mode-hook 'turn-on-auto-fill)
(add-hook 'latex-mode-hook 'turn-on-auto-fill)

;; enable latexmk support
(add-hook 'LaTeX-mode-hook (lambda()
            (delete-dups
             (push
              '("LatexMK" "latexmk -%(PDF) %s %t" TeX-run-TeX t t
                :help "Use latexmk for compilation")
              TeX-command-list))))

(add-hook 'LaTeX-mode-hook (lambda()
            (delete-dups
             (push
              '("custom" "%`%l%(mode) -shell-escape %' %t" TeX-run-TeX t (latex-mode doctex-mode)
                :help "Run LaTeX")
              TeX-command-list))))

(add-hook 'LaTeX-mode-hook (lambda()
            (delete-dups
             (push
              '("--shell-escape" "%`%l%(mode) -shell-escape %' %t" TeX-run-TeX nil (latex-mode doctex-mode)
                :help "Run LaTeX")
              TeX-command-list))))

(add-hook 'LaTeX-mode-hook (lambda()
            (delete-dups
             (push
              '("XeLaTeX" "xelatex --shell-escape %t" TeX-run-TeX t t
                :help "Run XeLaTeX")
              TeX-command-list))))

;; use LatexMK per default
;; rather use LaTeX!!
(add-hook 'LaTeX-mode-hook (lambda()
                             (when
                                 (and
                                  (eq TeX-engine 'default)
                                  (or TeX-PDF-mode TeX-DVI-via-PDFTeX))
                               (setq TeX-command-default "XeLaTeX"))))
;; create new substition %(-PDF) for TeX-expand-list
;; (push
;;  '("%(-PDF)"
;;    (lambda()
;;      (if (and (not TeX-Omega-mode)
;;               (or TeX-PDF-mode TeX-DVI-via-PDFTeX))
;;          "-pdf"
;;        "")))
;;  TeX-expand-list)

;; enable flyspell for auctex by default
(add-hook 'LaTeX-mode-hook #'turn-on-flyspell)



;; add auctex to package list to be installed if not present
(when (not (boundp 'elpa-packages-list))
  (setq elpa-packages-list '())
  )
(add-to-list 'elpa-packages-list 'auctex)
(add-to-list 'elpa-packages-list 'auctex-latexmk)



