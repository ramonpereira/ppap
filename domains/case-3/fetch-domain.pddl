;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; USE CASE - 3 - Projection for MRP
;;; USE CASE - 3 - This is the robot model (domain)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(define (domain FETCH)

(:requirements :strips :typing)

(:types
location locatable
block bottle can - object
)

(:predicates
(at ?l - location)
(on ?x ?y - block)
(ontable ?x - block)
(clear ?x - block)
(reachable ?x - block)
(holding ?x - block)
(handempty)
(handtucked)
(crouched)
(tower2-formed ?x - block)
(tower3-formed ?x - block)
)

(:action form2tower
:parameters (?b1 ?b2 - block)
:precondition
(and
(on ?b1 ?b2)
(ontable ?b2)
(clear ?b1)
)
:effect
(and
(tower2-formed ?b1)
)
)

(:action form3tower
:parameters (?b1 ?b2 ?b3 - block)
:precondition
(and
(on ?b1 ?b2)
(on ?b2 ?b3)
(ontable ?b3)
(clear ?b1)
)
:effect
(and
(tower3-formed ?b1)
)
)

(:action pick-up
:parameters (?x - block)
:precondition
(and
(reachable ?x)
(clear ?x)
(ontable ?x)
(handempty)
)
:effect
(and
(not (ontable ?x))
(not (clear ?x))
(not (handempty))
(holding ?x)
)
)

(:action put-down
:parameters (?x - block)
:precondition
(and
(holding ?x)
)
:effect
(and
(not (holding ?x))
(reachable ?x)
(clear ?x)
(handempty)
(ontable ?x)
)
)

(:action stack
:parameters (?x ?y - block)
:precondition
(and
(reachable ?y)
(holding ?x)
(clear ?y)
)
:effect
(and
(not (holding ?x))
(not (clear ?y))
(clear ?x)
(handempty)
(on ?x ?y)
(reachable ?x)
(not (reachable ?x))
)
)

(:action unstack
:parameters (?x ?y - block)
:precondition
(and
(on ?x ?y)
(clear ?x)
(reachable ?x)
(handempty)
)
:effect
(and
(holding ?x)
(clear ?y)
(not (clear ?x))
(not (handempty))
(not (on ?x ?y))
(reachable ?y)
)
)

(:action move
:parameters (?from ?to - location)
:precondition
(and
(at ?from)
(handtucked)
(crouched)
)
:effect
(and
(at ?to)
(not (at ?from))
)
)

(:action tuck
:parameters ()
:precondition
(and
)
:effect
(and
(handtucked)
(crouched)
)
)

(:action crouch
:parameters ()
:precondition
(and
)
:effect
(and
(crouched)
)
)

)

