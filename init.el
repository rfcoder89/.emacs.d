;; personal info
(setq user-full-name "Richard Flood")
(setq user-mail-address "rfcoder89@gmail.com")

(server-start)
(toggle-frame-fullscreen)

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; setup use-package
(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      (append package-archives
              '(("melpa" . "http://melpa.org/packages/")
                ("gnu" . "http://elpa.gnu.org/packages/"))))

(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile (require 'use-package))

(let ((lisp '("mouse"))
      (config '("visual")))
  (mapcar (lambda (val) (load-file (format "~/.emacs.d/lisp/%s.el" val))) lisp)
  (mapcar (lambda (val) (load-file (format "~/.emacs.d/config/%s.el" val))) config))
		   
			
			
