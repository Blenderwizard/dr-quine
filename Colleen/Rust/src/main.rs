#![allow(non_snake_case)]

// Global Scope Comment
fn main() {
    // Main Scope Comment
    let a = "#![allow(non_snake_case)]\n\n// Global Scope Comment\nfn main() {\n    // Main Scope Comment\n    let a = ";
    let c = "\n    ";
    let b = "\n    print!(\"{}{:?};{}let c = {:?};{}let b = {:?};{}\", a, a, c, c, c, b, b)\n}\n";
    print!("{}{:?};{}let c = {:?};{}let b = {:?};{}", a, a, c, c, c, b, b)
}
