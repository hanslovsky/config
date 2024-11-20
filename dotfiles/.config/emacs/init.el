;;; package -- Summary -*- lexical-binding: t; -*-
;;; Commentary:
;; This is my Emacs file.  It has grown over time and will certainly do so in future
;; To put some structure in my config I decided to split it up into smaller config files

;; this has to go before any packae is loaded that has been installed using elpa
;; see: http://stackoverflow.com/questions/17598801/emacs-sometimes-cant-open-load-file

;; emacs determines file modes in this order:
;; 1. file variables, e.g. first non-empty line ; -*-Lisp-*-
;; 2. Shebang
;; 3. magic-mode-alist looking at the text of the buffer
;; 4. auto-mode-alist looking at the filename (prefer to use this)
;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Choosing-Modes.html

;; TODO Do I need to fail on emacs version < 26?
(when (version< emacs-version "29")
  (error "Emacs version must be at least 29 but found %s"
	 emacs-version))

(setq use-package-compute-statistics t)

;; elpa package archives
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
			 ("gnu" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(let ((debug-on-error t)
      (debug-on-quit t)
      ;; Every require/load looks at this, so removing it gets us a small
      ;; performance improvement. However we do want it set after loading
      ;; everything, so we use let so this will return to normal after this
      ;; block.
      (file-name-handler-alist nil))

  (defun my/load-conf (name)
    (load-file (format "~/.config/emacs/config/%s.el" name)))

  (package-activate-all)

  ;; benchmark start-up time
  (use-package benchmark-init
    :ensure t
    :config
    ;; To disable collection of benchmark data after init is done.
    (add-hook 'after-init-hook 'benchmark-init/deactivate))

  (defvar package-archive-priorities
    '(("melpa-stable" . 20)
      ("melpa" . 10)))

  ;; tree-sitter config (syntax highlighting)
  (require 'treesit)
  (use-package treesit-auto
    :ensure t
    :custom
    (treesit-auto-install 'prompt)
    :config
    (treesit-auto-add-to-auto-mode-alist 'all)
    (global-treesit-auto-mode))

  ;;; rust setup. For now, just rust mode
  (use-package rust-mode :ensure t)

  ;;; language server protocol (LSP) config
  ;; To make this work properly, set up a .envrc file in the directory
  ;; that loads an appropriate interpreter that also has the
  ;; python-lsp-server package installed
  ;;   https://pypi.org/project/python-lsp-server/
  ;; For example:
  ;;  mamba create -n tmp python  # create environment
  ;;  mamba activate tmp  # activate environment
  ;;  python -m pip install python-lsp-server  # install lsp server
  ;;  echo 'hash conda && source activate tmp' >> /some/dir/.envrc  # set up .envrc
  ;;
  ;; Then, after opening a python file within /some/dir (including
  ;; sub-directories), type M-x eglot and select pylsp as language server.
  ;; This should get the right interpreter for you.
  (use-package envrc :ensure t :hook (after-init . envrc-global-mode))
  (use-package eglot
  :ensure t
  :config (​add-to-list​ ​'eglot-server-programs​ '((​rust-mode​) ​.​ (​"​rust-analyzer​"​)))
  :hook ((python-mode . eglot-ensure)
         (rust-mode . eglot-ensure)))
  

  ;; visual undo tree
  ;; How to bind to a good key?
  (use-package vundo :defer 2 :ensure t)

  ;; rainbow mode for parens and delimiters
  (use-package rainbow-mode
    :ensure t
    :config
    (define-globalized-minor-mode global-rainbow-mode rainbow-mode
      (lambda () (rainbow-mode 1)))
    (global-rainbow-mode 1) ;; enable rainbow mode in every buffer (global minor mode)
    )
  ;; TODO do we really want this for delimiters and identifiers?
  (use-package rainbow-delimiters :ensure t :hook (prog-mode . rainbow-delimiters-mode))
  (use-package rainbow-identifiers :ensure t)


  ;; highlight parens
  (use-package highlight-parentheses
  :ensure t
  ;; use electric pair mode to create matching pairs of parens instead of autopair
  :init (global-highlight-parentheses-mode t))
  (electric-pair-mode 1)


  ;; put volatile highlights on undo, yank[-pop], kill-{region,line,...}, delete-region, find-tag and some others
  ;; volatile highlights will be 
  (use-package volatile-highlights
    :defer 2
    :ensure t
    :bind ("<f8>" . volatile-highlights-mode)
    :init
    (volatile-highlights-mode)
    (vhl/define-extension 'undo-tree 'undo-tree-yank 'undo-tree-move)
    (vhl/install-extension 'undo-tree))

  (my/load-conf 'general)

  ;; TODO latex support

  ;; Markdown support. Use github markdown for all markdown files
  (use-package
    markdown-mode
    :defer t
    :ensure t
    :mode (("\\.md\\'" . gfm-mode)))

  ;; iedit: edit multiple occurences at once + rectangle mode
  (use-package iedit :ensure t :defer 2 :bind (("C-;" . iedit-mode)
					       ("C-x r <return>" . 'iedit-rectangle-mode)))

  ;; json
  (use-package json-mode :defer t :ensure t :mode "\\.json\\'")

  ;; theme related settings
  (my/load-conf 'themes)

  ;; control git from emacs via magit
  (use-package magit
  :defer 2
  :ensure t
  :bind (("C-x g" . magit-status)))

  ;; TODO we exclude network file systems and tramp here but that is probably not needed anymore
  (setq vc-ignore-dir-regexp (format "\\(%s\\)\\|\\(%s\\)\\|\\(%s\\)|\\(%s\\)"
                                     vc-ignore-dir-regexp
                                     tramp-file-name-regexp
                                     "/nrs/.*"
                                     "/ssh:.+:/nrs/.*"))

  ;; load narrowing and copmletion packages
  ;; needs a revisit
  (my/load-conf 'completion-narrowing)

  ;; Add function nuke-some-buffers that closes all unmodified buffers and prompts for others
  (my/load-conf 'kill)

  ;; Add save-as function that prompts whether to switch to new file
  (my/load-conf 'save-as)
  
  ;; do not store settings made through customize in ~/.emacs
  (setq custom-file "~/.config/emacs/config/custom.el")
  (load custom-file 'noerror)

  ;; (use-package doom-themes :defer 2 :ensure t)

  ;;; modeline
  (use-package ghub :ensure t)
  (use-package doom-modeline
    :defer 2
    :ensure t
    :config
    (setq doom-modeline-minor-modes t
          doom-modeline-major-mode-color-icon t
          doom-modeline-buffer-state-icon t
          doom-modeline-buffer-modification-icon nil
          doom-modeline-time-icon nil
          doom-modeline-battery t
          doom-modeline-time t
          doom-modeline-lsp nil
          doom-modeline-enable-word-count t
          doom-modeline-continuous-word-count-modes '(markdown-mode gfm-mode org-mode)
          doom-modeline-buffer-encoding nil
          doom-modeline-indent-info nil
          doom-modeline-vcs-max-length 12
          doom-modeline-github nil
          doom-modeline-github-interval (* 30 60))
    :init (doom-modeline-mode 1))
  (use-package minions :ensure t :init (minions-mode))

  ;; show last executed command & key binding
  (use-package keycast :ensure t :init (keycast-header-line-mode))

  ;; google integration
  (use-package google-this :ensure t :defer 2)
  (use-package google-translate :ensure t :defer 2)
  (use-package google-maps :ensure t :defer 2)

  ;; fun with nyan cat
  (use-package nyan-mode
    :ensure t
    :config
    (nyan-mode 1) ;; turn on nyan cat mode
    (nyan-start-animation)  ;; make sure nyan cat is animated
    )
  )



