{
  outputs = { self }: rec {
    templates = {
      empty = {
        path = ./empty;
        description = "Empty template";
      };

      FSharp = {
        path = ./FSharp;
        description = "FSharp template";
      };

      OCaml4 = {
        path = ./OCaml4;
        description = "Ocaml v4.* template";
      };

      OCaml5 = {
        path = ./OCaml5;
        description = "Ocaml v5.* template";
      };

      CommonLisp = {
        path = ./CommonLisp;
        description = "CommonLisp template";
      };
    };

    defaultTemplate = templates.empty;
  };
}
