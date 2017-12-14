(define tax_rate 0.065)

(define (start)
    (print "Scheme Point-of-Sale")
    (print "Start transaction (exit with 0):\n")
    (getValue 0.0)
)

(define (getValue total)
    (print "Enter Value:")
    (let ((num (convertFloat (format "~a" (read)))))
        (cond ((equal? num 0) (quitProgram total))
        (else (getValue (+ total num)))
        )
    )
)

(define (convertFloat input)
    (string->number (substring input 1 (string-length input)))
)

(define (quitProgram total)
    (print "\nSubtotal: $" total)
    (let ((tax (calculateTax total)))
        (print "Tax: $" tax)
        (print "Total: $" (+ total tax))
    )
)

(define (calculateTax total)
    (* total tax_rate)
)

