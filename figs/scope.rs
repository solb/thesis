#![feature(fn_traits)]
#![feature(unboxed_closures)]

use std::env::args;

fn main() {
	let helper = OldHelper::default();
	let dog = OldYeller::from("dog");
	let help: bool = args().skip(1).next().unwrap().parse().unwrap();
	if help {
		println!("calling helper()");
		helper(dog);
		println!("helper() returned");
	} else {
		println!("not calling helper()");
	}
	println!("end of main()");
}

/*fn helper(_: OldYeller) {
	println!("helper()");
}
*/

#[derive(Default)]
struct OldHelper<'a> (OldYeller<'a>);

impl<'a> FnOnce<(OldYeller<'a>,)> for OldHelper<'a> {
	type Output = ();

	extern "rust-call" fn call_once(self, _: (OldYeller,)) {
		println!("OldHelper()");
	}
}

impl<'a> Drop for OldHelper<'a> {
	fn drop(&mut self) {
		println!("OldHelper::drop()");
	}
}

#[derive(Default)]
struct OldYeller<'a> (&'a str);

impl<'a> From<&'a str> for OldYeller<'a> {
	fn from(tag: &'a str) -> Self {
		Self (tag)
	}
}

impl<'a> Drop for OldYeller<'a> {
	fn drop(&mut self) {
		let Self (tag) = self;
		println!("OldYeller (\"{}\")::drop()", tag);
	}
}
