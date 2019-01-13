(use-package createany
  :load-path (lambda () (path-join rlf-modules "createany")))

(defun dired-create-file ()
  (interactive)
  (let ((filename (read-file-name "Create file: " default-directory)))
    (if (file-exists-p filename)
      (message "File already exists!")
      (progn
        (shell-command (concat "touch \"" filename "\""))
        (message (concat "File created: " filename))))))

(use-package dired
  :after createany
  :config
  (require 'dired-x)

  (setq-default dired-omit-files-p t)
  (setq dired-isearch-filenames t)
  (setq dired-omit-files
        (concat dired-omit-files
                "\\|^\\..*$"
                "\\|CMakeFiles"
                "\\|cmake_install.cmake"
                "\\|CMakeCache.txt"
                "\\|NTUSER*"))

  :bind
  ("C-x C-d" . dired-jump)

  (:map dired-mode-map
        ("M-+" . dired-create-file)
			  ("f" . dired-mark-files-regexp)
			  ("e" . (lambda () (interactive) (dired "~/.emacs.d")))
			  ("h" . (lambda () (interactive) (dired "~")))
        ("r" . (lambda () (interactive) (dired "~/development")))
        ("l" . (lambda () (interactive) (dired "~/development/lfm")))
			  ("M-o" . dired-omit-mode)
			  ("C-M-n" . dired-find-file)
			  ("C-M-p" . dired-up-directory)
			  ("C-M-y" . createany)
        ("C-M-=" . (lambda () (interactive) (shell-command "du -h")))
			  ("M-p" . (lambda () (interactive) (dired-prev-dirline 1)))
			  ("M-n" . (lambda () (interactive) (dired-next-dirline 1)))
			  ("~" . (lambda () (interactive) (dired "~")))

			  ("<SPC>" .
         (lambda ()
           (interactive)
           (when (file-directory-p (dired-filename-at-point))
             (dired-subtree-toggle))))

			  ("M->" .
         (lambda ()
           (interactive)
           (end-of-buffer)
           (dired-previous-line 1)))

			  ("M-<" .
         (lambda ()
           (interactive)
           (beginning-of-buffer)
           (dired-next-line 2)))))
