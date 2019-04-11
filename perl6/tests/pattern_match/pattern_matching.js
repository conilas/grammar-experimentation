let anon_tagged_union be the Fn of (String | Int) (first is String, second is Int) => {
  match second with
    x when x > 20 => x
    otherwise => first
  end
}
