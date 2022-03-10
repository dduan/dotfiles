{}: {
  enable = true;
  general = {
    output_format = "i3bar";
    interval = 10;
  };
  modules = {
    "disk /".settings.format = "%avail";
    "tztime local".enable = false;
    "battery all".enable = false;
    "ipv6".enable = false;
    "wireless _first_".enable = false;
    "ethernet _first_" = {
      settings = {
        "format_up" = "%ip";
      };
    };
  };
}
