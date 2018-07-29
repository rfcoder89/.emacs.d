(defun path-join (root &rest dirs)
  "Joins a series of directories together."
  (if (not dirs)
      root
    (apply 'path-join
           (expand-file-name (car dirs) root)
           (cdr dirs))))
