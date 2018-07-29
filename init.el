;; personal info
(setq user-full-name "Richard Flood")
(setq user-mail-address "rfcoder89@gmail.com")

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
