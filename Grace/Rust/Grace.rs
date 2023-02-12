#![allow(non_snake_case)]
#![no_main]

use std::fs::File;
use std::io::prelude::*;

// Comment
#[export_name = "main"]
fn not_main() -> std::io::Result<()> {
    let mut file = File::create("Grace_kid.rs")?;
    let a = "#![allow(non_snake_case)]\n#![no_main]\n\nuse std::fs::File;\nuse std::io::prelude::*;\n\n// Comment\n#[export_name = \"main\"]\nfn not_main() -> std::io::Result<()> {\n    let mut file = File::create(\"Grace_kid.rs\")?;\n    let a = ";
    let c = "\n    ";
    let b = "\n    file.write_all(format!(\"{a}{a:?};{c}let c = {c:?};{c}let b = {b:?};{b}\").as_bytes())?;\n    Ok(())\n}\n";
    file.write_all(format!("{a}{a:?};{c}let c = {c:?};{c}let b = {b:?};{b}").as_bytes())?;
    Ok(())
}
