;; tramp
(require 'tramp)

;; use sudo and ssh in conjunction: C-x C-f /sudo:root@host[#port]:/path/to/file
;; see also: http://www.gnu.org/software/emacs/manual/html_node/tramp/Multi_002dhops.html
;(set-default 'tramp-default-proxies-alist (quote ((nil "\\`root\\'" "/ssh:%h:"))))
