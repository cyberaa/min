class Min::GeneratedParser

/* literals */
token NIL TRUE FALSE

/* Terminal types */
token BLOCK
token NUMBER
token STRING
token INDENT
token DEDENT
token SEP
token ID

rule
  Script:
    /* nothing */
  | Statements
  ;
  
  Statements:
    Statement                { result = Block.new([val[0]]) }
  | Statements SEP Statement { result = Block.new([val[0].nodes, val[2]].flatten) }
  ;

  Statement:
    Call
  | Assign
  | Var
  | Literal
  ;
  
  Literal:
    NIL    { result = Nil.new(val[0]) }
  | TRUE   { result = True.new(val[0]) }
  | FALSE  { result = False.new(val[0]) }
  | NUMBER { result = Number.new(val[0]) }
  | STRING { result = String.new(val[0]) }
  ;
  
  Call:
    ID ArgList { result = Call.new(val[0], val[1]) }
  ;

  Assign:
    Var '=' Statement { result = Assign.new(val[0], val[2]) }
  ;

  Var:
    ID { result = Var.new(val[0]) }
  ;
  
  ArgList:
    Statement             { result = [val[0]] }
  | Statement "," ArgList { result = [val[1], val[2]].flatten }
  ;
end

---- header
  require "min/nodes"

---- inner
  include Min::Nodes
