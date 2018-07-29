(define-prefix-command 'rlf/prefix/bookmark)
(global-set-key (kbd "C-x B") 'rlf/prefix/bookmark)
(define-key rlf/prefix/bookmark (kbd "B") 'bookmark-set)
(define-key rlf/prefix/bookmark (kbd "N") 'bookmark-delete)
(define-key rlf/prefix/bookmark (kbd "X") 'rlf-bookmarks-clear)

(use-package webmarks
  :after ivy
  :load-path (lambda () (path-join rlf-modules "webmarks"))
  :config
  (setq webmarks-file "~/.emacs.d/webmarks.json")
  (webmarks-reload)
  
  :bind
  ("C-x C-n" . webmarks-list))
