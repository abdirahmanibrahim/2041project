type ident = string

type expr =
  | Var of ident                   
  | FuncCall of ident * expr list   
  | Match of expr * match_body       
  | Equation of expr * expr         


and match_case = 
  | Case of pattern * expr


and match_body = match_case list


type pattern =
  | PatVar of ident                  
  | PatConstructor of ident * pattern list  

type func_arg = ident * type_expr


type type_expr =
  | TypeIdent of ident               
  | TypeFunc of type_expr * type_expr 
  | TypeVariant of ident * type_expr list 


type statement =
  | Let of ident * type_expr option * expr  
  | LetRec of ident * type_expr option * expr 
  | Prove of ident * expr            
  | Hint of hint                    


type hint =
  | Axiom                 
  | Induction of ident        

type type_def =
  | TypeDecl of ident * type_variant  

type type_variant = 
  | Variant of ident * type_expr list 


type func_decl = 
  | Func of ident * func_arg list * expr 


type program = 
  | Program of type_def list * func_decl list * statement list


let test_simple_let_statement () =
    let input = "let x = 5" in
    let expected_ast = Let("x", IntLit(5)) in  (* Assuming Let and IntLit are constructors in your AST *)
    let actual_ast = Parser.parse_string input in
    assert_equal expected_ast actual_ast ~printer:string_of_ast
