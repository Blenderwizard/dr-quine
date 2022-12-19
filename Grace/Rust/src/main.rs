#![allow(non_snake_case)]

use std::fs::File;
use std::io::prelude::*;

fn main() -> std::io::Result<()> {
    let mut file = File::create("Grace_kid.rs")?;
    let a = "#![allow(non_snake_case)]\n\nuse std::fs::File;\nuse std::io::prelude::*;\n\nfn main() -> std::io::Result<()> {\n    let mut file = File::create(\"Grace_kid.rs\")?;\n    let a = ";
    let c = "\n    ";
    let b = "\n    file.write_all(format!(\"{a}{a:?};{c}let c = {c:?};{c}let b = {b:?};{b}\").as_bytes())?;\n    Ok(())\n}\n";
    file.write_all(format!("{a}{a:?};{c}let c = {c:?};{c}let b = {b:?};{b}").as_bytes())?;
    Ok(())
}
