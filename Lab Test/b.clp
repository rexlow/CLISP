(defrule tell-1
  (INFECTION-IS-MENINGITIS) =>
  (printout t "Infection is meningitis" crlf)
)

(defrule tell-2
  (WE-SUSPECT-MENINGITIS) =>
  (printout t "We suspect the patient has meningitis" crlf)
)

(defrule tell-3
  (WE-SUSPECT-MENINGITIS-FROM-TEST-RESULT) =>
  (printout t "We suspect the patient has meningitis from test result" crlf)
)

(defrule tell-4
  (WE-SUSPECT-MENINGITIS-FROM-PATIENT-SYMPTOMS) =>
  (printout t "We suspect the patient has meningitis from patient symptoms" crlf)
)

(defrule tell-5
  (CULTURES-LOOK-LIKE-MENINGITIS) =>
  (printout t "The cultures look like meningitis" crlf)
)

(defrule rule-1
  (or 
    (PHYSICIAN-KNOWS-PATIENT-HAS-MENINGITIS)
    (WE-SUSPECT-MENINGITIS)
  ) => (assert (INFECTION-IS-MENINGITIS))
)

(defrule rule-2
  (or
    (WE-SUSPECT-MENINGITIS-FROM-TEST-RESULT)
    (WE-SUSPECT-MENINGITIS-FROM-PATIENT-SYMPTOMS)
  ) => (assert (WE-SUSPECT-MENINGITIS))
)

(defrule rule-3
  (TEST-WERE-RUN)
  (CULTURES-WERE-SEEN)
  (CULTURES-LOOK-LIKE-MENINGITIS) =>
  (assert (WE-SUSPECT-MENINGITIS-FROM-TEST-RESULT))
)

(defrule rule-4
  (THE-APPEARANCE-OF-THE-CULTURE-IS-COCCUS)
  (THE-STAIN-OF-THE-CULTURE-IS-GRAMPOS) =>
  (assert (CULTURES-LOOK-LIKE-MENINGITIS))
)

(defrule rule-5
  (THE-PATIENT-IS-SUFFERING-PERSISTENT-HEADACHES)
  (THE-PATIENT-IS-SUFFERING-DIZZINESS)
  (THE-PATIENT-HAS-BEEN-LETHARGIC) =>
  (assert (WE-SUSPECT-MENINGITIS-FROM-PATIENT-SYMPTOMS))
)

(assert (TEST-WERE-RUN)(CULTURES-WERE-SEEN)(THE-APPEARANCE-OF-THE-CULTURE-IS-COCCUS)(THE-STAIN-OF-THE-CULTURE-IS-GRAMPOS))
