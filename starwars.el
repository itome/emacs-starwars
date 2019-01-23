(defun starwars ()
  (interactive)
  (switch-to-buffer (get-buffer-create "starwars"))
  (erase-buffer)
  (sit-for 0)
  (let* ((index -1)
         (sit-time 0)
         (lines (starwars--read-lines "./sw1.txt")))
    (cl-loop for line in lines
             do
             (incf index)
             (cond
              ((= (% index 14) 0)
               (sit-for sit-time)
               (setf sit-time (/ (string-to-number (concat line ".0")) 15))
               (erase-buffer))
              (t (insert line) (newline))))))

(defun starwars--read-lines (filePath)
  "Return a list of lines of a file at filePath."
  (with-temp-buffer
    (insert-file-contents filePath)
    (split-string (buffer-string) "\n" nil nil)))
