#![allow(non_snake_case)]
#![allow(unused_must_use)]

use std::fs::File;
use std::io::prelude::*;
use std::process::Command;

#[cfg(first)]
fn dec(count: i8) -> i8 {
    count - 1
}

#[cfg(not(first))]
fn dec(count: i8) -> i8 {
    count
}

fn main() -> std::io::Result<()> {
    let mut count = 5;
    if count <= 0 {
        return Ok(());
    }
    count = dec(count);
    let mut file = File::create(format!("Sully_{count}.rs"))?;
    let a = "\n    let mut count = ";
    let f = "\n    if count <= 0 {\n        return Ok(());\n    }\n    count = dec(count);\n    let mut file = File::create(format!(\"Sully_{count}.rs\"))?;\n    let a = ";
    let e = "#![allow(non_snake_case)]\n#![allow(unused_must_use)]\n\nuse std::fs::File;\nuse std::io::prelude::*;\nuse std::process::Command;\n\n#[cfg(first)]\nfn dec(count: i8) -> i8 {\n    count - 1\n}\n\n#[cfg(not(first))]\nfn dec(count: i8) -> i8 {\n    count\n}\n\nfn main() -> std::io::Result<()> {";
    let c = "\n    ";
    let b = "\n    file.write_all(format!(\"{e}{a}{count};{f}{a:?};{c}let f = {f:?};{c}let e = {e:?};{c}let c = {c:?};{c}let b = {b:?};{b}\").as_bytes())?;\n    Command::new(\"bash\").args([\"-c\", format!(\"rustc --cfg first -o Sully_{count} Sully_{count}.rs\").as_str()]).output()?;\n    if count > 0 {\n        Command::new(format!(\"./Sully_{count}\")).output()?;\n    }\n    Ok(())\n}\n";
    file.write_all(format!("{e}{a}{count};{f}{a:?};{c}let f = {f:?};{c}let e = {e:?};{c}let c = {c:?};{c}let b = {b:?};{b}").as_bytes())?;
    Command::new("bash").args(["-c", format!("rustc --cfg first -o Sully_{count} Sully_{count}.rs").as_str()]).output()?;
    if count > 0 {
        Command::new(format!("./Sully_{count}")).output()?;
    }
    Ok(())
}
