(use-package ace-jump-mode
  :ensure t
  :bind ("C-." . ace-jump-mode))

(use-package color-moccur
  :ensure t
  :commands (isearch-moccur isearch-all)
  :bind (("M-s O" . moccur)
         :map isearch-mode-map
         ("M-o" . isearch-moccur)
         ("M-O" . isearch-moccur-all))
  :init
  (setq isearch-lazy-highlight t))
