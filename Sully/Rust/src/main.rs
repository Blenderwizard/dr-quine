#![allow(non_snake_case)]
#![allow(unused_must_use)]

use std::fs::File;
use std::io::prelude::*;
use std::process::Command;

fn main() -> std::io::Result<()> {
    let mut count = 5;
    count = count - 1;
    let mut file = File::create(format!("Sully_{count}.rs"))?;
    let a = "\n    let mut count = ";
    let f = "\n    count = count - 1;\n    let mut file = File::create(format!(\"Sully_{count}.rs\"))?;\n    let a = ";
    let e = "#![allow(non_snake_case)]\n#![allow(unused_must_use)]\n\nuse std::fs::File;\nuse std::io::prelude::*;\nuse std::process::Command;\n\nfn main() -> std::io::Result<()> {";
    let c = "\n    ";
    let b = "\n    file.write_all(format!(\"{e}{a}{count};{f}{a:?};{c}let f = {f:?};{c}let e = {e:?};{c}let c = {c:?};{c}let b = {b:?};{b}\").as_bytes())?;\n    if count > 0 {\n        Command::new(\"bash\").args([\"-c\", format!(\"rustc -o Sully_{count} Sully_{count}.rs && ./Sully_{count}\").as_str()]).output()?;\n    }\n    Ok(())\n}\n";
    file.write_all(format!("{e}{a}{count};{f}{a:?};{c}let f = {f:?};{c}let e = {e:?};{c}let c = {c:?};{c}let b = {b:?};{b}").as_bytes())?;
    if count > 0 {
        Command::new("bash").args(["-c", format!("rustc -o Sully_{count} Sully_{count}.rs && ./Sully_{count}").as_str()]).output()?;
    }
    Ok(())
}
