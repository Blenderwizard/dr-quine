#![allow(non_snake_case)]

/*
  Global Scope Comment
*/
fn other() {
    let a = "#![allow(non_snake_case)]\n\n/*\n  Global Scope Comment\n*/\nfn other() {\n    let a = ";
    let c = "\n    ";
    let b = "\n    print!(\"{}{:?};{}let c = {:?};{}let b = {:?};{}\", a, a, c, c, c, b, b)\n}\n\nfn main() {\n    /*\n      Main Scope Comment\n    */\n    other()\n}\n";
    print!("{}{:?};{}let c = {:?};{}let b = {:?};{}", a, a, c, c, c, b, b)
}

fn main() {
    /*
      Main Scope Comment
    */
    other()
}
