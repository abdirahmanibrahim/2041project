(* Types for basic expressions *)
type expression =
  | Int of int
  | Var of string
  | FuncCall of string * expression list
  | Equation of expression * expression
  | Match of expression * match_case list
and match_case =
  | Case of pattern * expression

(* Pattern matching *)
type pattern =
  | ConstructorPattern of string * pattern list
  | VarPattern of string

(* Types for representing OCaml statements *)
type statement =
  | TypeDef of string * (string * type_param list) list
  | FuncDef of string * (string * type_param) list * type_param * expression
  | ProveDef of string * (string * type_param) list * expression * hint list

(* Types for function and type parameters *)
type type_param =
  | TypeVar of string
  | TypeConstructor of string * type_param list

(* Types for different hints that can be used in proofs *)
type hint =
  | Axiom
  | Induction of string
  | Other of string

(* Type for a complete OCaml program *)
type program = statement list
