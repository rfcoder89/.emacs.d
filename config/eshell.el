(defun rlf-eshell-here ()
  (interactive)
  (let ((dir default-directory))
    (eshell)
    (eshell-return-to-prompt)
    (insert (format "cd %s" dir))
    (eshell-send-input)
    (eshell/clear)))

(defun rlf-eshell-keys ()
  "My keys for `compilation-mode'."
  (interactive)
  (defun eshell/clear ()      
    (let ((eshell-buffer-maximum-lines 0)) (eshell-truncate-buffer)))
  (local-set-key (kbd "C-=") 'popwin:one-window))

(add-hook 'eshell-mode-hook 'rlf-eshell-keys)
