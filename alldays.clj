;Nathaniel Morrow
;Day 1

(defn big [str n] (> (count str) n))

(big "asdf" 12)
(big "cat" 1)

;return :vector format, fix if time
(defn collection-type [col] (class col))

(collection-type {1 2})
(collection-type [1 2])
(collection-type '(1 2))

;(defn collection-type [col] (keyword col))
;(collection-type [1 2])
;(defn collection-type [col] (keyword? (class col)))
;(collection-type [1 2])
;(defn collection-type [col] (keyword? col))
;(collection-type [1 2])
;(defn collection-type [col] (class col))
;(collection-type [1 2])
;(defn collection-type [col] (name (class col)))
;(collection-type [1 2])
;(defn collection-type [col] (str (class col)))
;(collection-type [1 2])


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END DAY 1
;Day 2


;unless with else
(defmacro unless [test body else]
 (list 'if (list 'not test) body else))

(macroexpand '(unless condition body else))


(unless false (println "Greetings!") (println "Salutations!"))

(unless true (println "Greetings!") (println "Salutations!"))


;a type using defrecord implementing a protocol

(defprotocol Vehicle
  (run [c]))


(defrecord Car [sound]
  Vehicle
  (run[car]
    (println (str "I'm fast! " sound))))

(defrecord Bike [sound]
  Vehicle
  (run[bike]
    (println (str "I'm healthy! " sound))))

(def myCar (Car. "Beep beep."))
(def myBike (Bike. "Bike sounds."))

(run myCar)
(run myBike)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; END DAY 2
;Day 3


;use refs to create a vector of accounts in memory create debit and credit functionss to change the balance of an account


(def cardAccounts (ref [300 268 17 0 96 42]))

(deref cardAccounts)
((deref cardAccounts) 4)

(defn credit [index num] 
  (def newAccounts (assoc (deref cardAccounts) index (+ num ((deref cardAccounts) index))))
  (dosync (ref-set cardAccounts newAccounts)))

(defn debit [index num] 
  (def newAccounts (assoc (deref cardAccounts) index (- ((deref cardAccounts) index) num )))
  (dosync (ref-set cardAccounts newAccounts)))

(credit 4 60)
(@cardAccounts 4)
(credit 4 20)
(@cardAccounts 4)
(debit 4 40)
(@cardAccounts 4)
