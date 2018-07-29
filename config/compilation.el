(defun rlf-compilation-mode-keys ()
  "My keys for `compilation-mode'."
  (interactive)
  (local-set-key (kbd "p") 'previous-error)
  (local-set-key (kbd "n") 'next-error))

(add-hook 'compilation-mode-hook 'rlf-compilation-mode-keys)
