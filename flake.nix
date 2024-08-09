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
    };

    defaultTemplate = templates.empty;
  };
}
