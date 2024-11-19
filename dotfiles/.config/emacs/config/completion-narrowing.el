;; vertico for vertical copmletion UI
(use-package vertico
  :ensure t
  :init (vertico-mode)
  :custom
  (vertico-count 20)
  (vertico-resize t)
  (vertico-cycle t)
  :bind (:map vertico-map
              ;; cycle through candidate groups, e.g. buffers vs files in consult-buffer
              ("C-M-n" . vertico-next-group)
              ("C-M-p" . vertico-previous-group)))
(use-package vertico-quick
  :after vertico
  :ensure nil
  :bind (:map vertico-map
              ("M-q"   . vertico-quick-insert)
              ("C-q"   . vertico-quick-exit)))
(use-package vertico-indexed
  :after vertico
  :ensure nil
  :hook (vertico-mode . vertico-indexed-mode)
  :init (vertico-indexed-mode))
  ;; :bind (:map vertico-map
              ;; ("M-q"   . vertico-quick-insert)
              ;; ("C-q"   . vertico-quick-exit)))
(use-package vertico-reverse
  :after vertico
  :ensure nil
  :hook (vertico-mode . vertico-reverse-mode)
  :init (vertico-reverse-mode))
(use-package vertico-grid
  :after vertico
  :ensure nil)
(use-package vertico-multiform
  ;; Temporary toggling between the different display modes is possible.
  ;; The following keys are bound in the `vertico-multiform-map'.
  ;;
  ;;   M-V -> `vertico-multiform-vertical'
  ;;   M-G -> `vertico-multiform-grid'
  ;;   M-F -> `vertico-multiform-flat'
  ;;   M-R -> `vertico-multiform-reverse'
  ;;   M-U -> `vertico-multiform-unobtrusive'
  :after vertico
  :ensure nil
  :init (vertico-multiform-mode))

(use-package vertico-prescient
  :ensure t
  :after vertico
  :hook (vertico-mode . vertico-prescient-mode)
  :init (vertico-prescient-mode))

(use-package emacs
  :init
  ;; Enable recursive minibuffers
  (setq enable-recursive-minibuffers t))

;; consult for complete-read/narrowing/selection buffers
(use-package consult
  :ensure t
  :bind (("C-c M-x" . consult-mode-command)
         ("M-y"     . consult-yank-pop) ;; maybe use consult-yank-from-kill-ring instead
         ("C-c f"   . consult-recent-file)
         ("C-x M-f" . consult-find)
         ("C-x b"   . consult-buffer)
         ("C-x C-b" . consult-buffer))
  :init (recentf-mode)
  )

;; Marginalia enriches consult completion buffer, e.g. with doc string or file information
(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

;; Use appropriate icons for (mostly?) everything,
;; e.g. folders for directories, icons based on file extension, etc
(use-package all-the-icons :ensure t :if (display-graphic-p))
(use-package all-the-icons-completion
  :ensure t
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))

;; in-buffer completion
(use-package corfu :ensure t :init (global-corfu-mode))
;; A few more useful configurations...
(use-package emacs
  :custom
  ;; TAB cycle if there are only few candidates
  ;; (completion-cycle-threshold 3)

  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)

  ;; Emacs 30 and newer: Disable Ispell completion function.
  ;; Try `cape-dict' as an alternative.
  (text-mode-ispell-word-completion nil)

  ;; Hide commands in M-x which do not apply to the current mode.  Corfu
  ;; commands are hidden, since they are not used via M-x. This setting is
  ;; useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p))

