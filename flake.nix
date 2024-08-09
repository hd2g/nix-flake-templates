{
  outputs = { self }: rec {
    templates = {
      empty = {
        path = ./empty;
        description = "Empty template";
      };
    };

    defaultTemplate = templates.empty;
  };
}
