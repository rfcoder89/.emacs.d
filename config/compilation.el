(defun rlf-compilation-mode-keys ()
  "My keys for `compilation-mode'."
  (interactive)
  (local-set-key (kbd "m") 'mocha-compilation-mode)
  (local-set-key (kbd "p") '(lambda ()
                              (interactive)
                              (compilation-previous-error 1)
                              (compilation-display-error)))
                 
  (local-set-key (kbd "n") '(lambda ()
                              (interactive)
                              (compilation-next-error 1)
                              (compilation-display-error))))

(add-hook 'compilation-mode-hook 'rlf-compilation-mode-keys)

(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))

(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
