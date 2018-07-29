(use-package dired
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
			  ("f" . dired-mark-files-regexp)
			  ("M-o" . dired-omit-mode)
			  ("C-M-n" . dired-find-file)
			  ("C-M-p" . dired-up-directory)
			  ("C-M-y" . skeletor-create-project-at)
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
