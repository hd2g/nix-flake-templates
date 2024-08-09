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
    };

    defaultTemplate = templates.empty;
  };
}
