(use-package yasnippet
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/templates/snippets"))
  (yas-global-mode 1)
  (yas-reload-all))
  
(use-package ivy-yasnippet
  :ensure t
  :after ivy yasnippet
  :config
  :bind
  ("C-M-y" . ivy-yasnippet))

