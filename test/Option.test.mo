import Option "../src/Option";
import Int "../src/Int";
import Debug "../src/Debug";

Debug.print("Option");

do {
  Debug.print("  apply");

  do {
    Debug.print("    null function, null value");

    let actual = Option.apply<Int, Bool>(null, null);
    let expected : ?Bool = null;

    switch (actual, expected) {
      case (?_actual_, ?_expected_) {
        assert (false)
      };
      case (_, _) {
        assert (true)
      }
    }
  };

  do {
    Debug.print("    null function, non-null value");

    let actual = Option.apply<Int, Bool>(?0, null);
    let expected : ?Bool = null;

    switch (actual, expected) {
      case (?_actual_, ?_expected_) {
        assert (false)
      };
      case (_, _) {
        assert (true)
      }
    }
  };

  do {
    Debug.print("    non-null function, null value");

    let isEven = func(x : Int) : Bool {
      x % 2 == 0
    };

    let actual = Option.apply<Int, Bool>(null, ?isEven);
    let expected : ?Bool = null;

    switch (actual, expected) {
      case (?_actual_, ?_expected_) {
        assert (false)
      };
      case (_, _) {
        assert (true)
      }
    }
  };

  do {
    Debug.print("    non-null function, non-null value");

    let isEven = func(x : Int) : Bool {
      x % 2 == 0
    };

    let actual = Option.apply<Int, Bool>(?0, ?isEven);
    let expected = ?true;

    switch (actual, expected) {
      case (?actual_, ?expected_) {
        assert (actual_ == expected_)
      };
      case (_, _) {
        assert (false)
      }
    }
  };

};

do {
  Debug.print("  bind");

  do {
    Debug.print("    null value to null value");

    let safeInt = func(x : Int) : ?Int {
      if (x > 9007199254740991) {
        null
      } else {
        ?x
      }
    };

    let actual = Option.chain<Int, Int>(null, safeInt);
    let expected : ?Int = null;

    switch (actual, expected) {
      case (?_actual_, ?_expected_) {
        assert (false)
      };
      case (_, _) {
        assert (true)
      }
    }
  };

  do {
    Debug.print("    non-null value to null value");

    let safeInt = func(x : Int) : ?Int {
      if (x > 9007199254740991) {
        null
      } else {
        ?x
      }
    };

    let actual = Option.chain<Int, Int>(?9007199254740992, safeInt);
    let expected : ?Int = null;

    switch (actual, expected) {
      case (?_actual_, ?_expected_) {
        assert (false)
      };
      case (_, _) {
        assert (true)
      }
    }
  };

  do {
    Debug.print("    non-null value to non-null value");

    let safeInt = func(x : Int) : ?Int {
      if (x > 9007199254740991) {
        null
      } else {
        ?x
      }
    };

    let actual = Option.chain<Int, Int>(?0, safeInt);
    let expected = ?0;

    switch (actual, expected) {
      case (?actual_, ?expected_) {
        assert (actual_ == expected_)
      };
      case (_, _) {
        assert (false)
      }
    }
  };

};

do {
  Debug.print("  flatten");

  do {
    Debug.print("    null value");

    let actual = Option.flatten<Int>(?null);
    let expected : ?Int = null;

    switch (actual, expected) {
      case (?_actual_, ?_expected_) {
        assert (false)
      };
      case (_, _) {
        assert (true)
      }
    }
  };

  do {
    Debug.print("    non-null value");
    let actual = Option.flatten<Int>(??0);
    let expected = ?0;

    switch (actual, expected) {
      case (?actual_, ?expected_) {
        assert (actual_ == expected_)
      };
      case (_, _) {
        assert (false)
      }
    }
  };

};

do {
  Debug.print("  map");

  do {
    Debug.print("    null value");

    let isEven = func(x : Int) : Bool {
      x % 2 == 0
    };

    let actual = Option.map<Int, Bool>(null, isEven);
    let expected : ?Bool = null;

    switch (actual, expected) {
      case (?_actual_, ?_expected_) {
        assert (false)
      };
      case (_, _) {
        assert (true)
      }
    }
  };

  do {
    Debug.print("    non-null value");

    let isEven = func(x : Int) : Bool {
      x % 2 == 0
    };

    let actual = Option.map<Int, Bool>(?0, isEven);
    let expected = ?true;

    switch (actual, expected) {
      case (?actual_, ?expected_) {
        assert (actual_ == expected_)
      };
      case (_, _) {
        assert (false)
      }
    }
  };

};
do {
  Debug.print("  forEach");

  do {
    var witness = 0;
    Option.forEach<Nat>(?(1), func(x : Nat) { witness += 1 });
    assert (witness == 1);
    Option.forEach<Nat>(null, func(x : Nat) { witness += 1 });
    assert (witness == 1)
  }
};

do {
  Debug.print("  some");

  let actual = Option.some<Int>(0);
  let expected = ?0;

  switch (actual, expected) {
    case (?actual_, ?expected_) {
      assert (actual_ == expected_)
    };
    case (_, _) {
      assert (false)
    }
  }
};

do {
  Debug.print(" equal");

  assert (Option.equal<Int>(null, null, Int.equal));
  assert (Option.equal<Int>(?0, ?0, Int.equal));
  assert (not Option.equal<Int>(?0, ?1, Int.equal));
  assert (not Option.equal<Int>(?0, null, Int.equal));
  assert (not Option.equal<Int>(null, ?0, Int.equal))
}
