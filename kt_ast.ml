(* Define the type for expressions *)
type expression =
  | Var of string  (* Variable, e.g., "x" *)
  | Func of string * expression list  (* Function application, e.g., "cf x" *)

(* Define the type for statements *)
type statement =
  | Equation of expression * expression  (* Equation, e.g., "cf x = x" *)
  | LetProve of string * statement * hint option  (* A prove statement, e.g., "let prove ... with hint ..." *)

(* Define the type for hints *)
type hint =
  | Axiom  (* Axiom hint *)
  (* Induction hints and other types of hints can be added here *)

(* Define the type for a program, which is a list of statements *)
type program = statement list

