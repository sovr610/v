// Copyright (c) 2019 Alexander Medvednikov. All rights reserved.
// Use of this source code is governed by an MIT license
// that can be found in the LICENSE file.

module math

struct Complex {
	re f64
	im f64
}

pub fn complex(re f64, im f64) Complex {
	return Complex{re, im}
}

// To String method
pub fn (c Complex) str() string { 
	mut out := '$c.re'
	out += if c.im >= 0 {
		'+$c.im'
	}
	else {
		'$c.im'
	}
	out += 'i'
	return out
}

// Complex Modulus value
// mod() and abs() return the same
pub fn (c Complex) abs() f64 {
	return C.hypot(c.re, c.im)
}
pub fn (c Complex) mod() f64 {
	return c.abs()
}


// Complex Angle
pub fn (c Complex) angle() f64 { 
	return atan2(c.im, c.re)
}

// Complex Addition c1 + c2
pub fn (c1 Complex) + (c2 Complex) Complex {
	return Complex{c1.re + c2.re, c1.im + c2.im}
}

// Complex Substraction c1 - c2
pub fn (c1 Complex) - (c2 Complex) Complex {
	return Complex{c1.re - c2.re, c1.im - c2.im}
}

// Complex Multiplication c1 * c2
// Currently Not Supported
// pub fn (c1 Complex) * (c2 Complex) Complex {
// 	return Complex{
// 		(c1.re * c2.re) + ((c1.im * c2.im) * -1), 
// 		(c1.re * c2.im) + (c1.im * c2.re)
// 	}
// }

// Complex Division c1 / c2
// Currently Not Supported
// pub fn (c1 Complex) / (c2 Complex) Complex {
// 	denom := (c2.re * c2.re) + (c2.im * c2.im)
// 	return Complex { 
// 		((c1.re * c2.re) + ((c1.im * -c2.im) * -1))/denom, 
// 		((c1.re * -c2.im) + (c1.im * c2.re))/denom
// 	}
// }

// Complex Addition c1.add(c2)
pub fn (c1 Complex) add(c2 Complex) Complex {
	return c1 + c2
}

// Complex Subtraction c1.subtract(c2)
pub fn (c1 Complex) subtract(c2 Complex) Complex {
	return c1 - c2
}

// Complex Multiplication c1.multiply(c2)
pub fn (c1 Complex) multiply(c2 Complex) Complex {
	return Complex{
		(c1.re * c2.re) + ((c1.im * c2.im) * -1), 
		(c1.re * c2.im) + (c1.im * c2.re)
	}
}

// Complex Division c1.divide(c2)
pub fn (c1 Complex) divide(c2 Complex) Complex {
	denom := (c2.re * c2.re) + (c2.im * c2.im)
	return Complex { 
		((c1.re * c2.re) + ((c1.im * -c2.im) * -1)) / denom, 
		((c1.re * -c2.im) + (c1.im * c2.re)) / denom
	}
}

// Complex Conjugate
pub fn (c Complex) conjugate() Complex{
	return Complex{c.re, -c.im}
}

// Complex Additive Inverse
// Based on 
// http://tutorial.math.lamar.edu/Extras/ComplexPrimer/Arithmetic.aspx
pub fn (c Complex) addinv() Complex {
	return Complex{-c.re, -c.im}
}

// Complex Multiplicative Inverse
// Based on
// http://tutorial.math.lamar.edu/Extras/ComplexPrimer/Arithmetic.aspx
pub fn (c Complex) mulinv() Complex {
	return Complex {
		c.re / (c.re * c.re + c.im * c.im),
		-c.im / (c.re * c.re + c.im * c.im)
	}
}
 
// Complex Power
// Based on
// https://www.khanacademy.org/math/precalculus/imaginary-and-complex-numbers/multiplying-and-dividing-complex-numbers-in-polar-form/a/complex-number-polar-form-review
pub fn (c Complex) pow(n f64) Complex {
	r := pow(c.abs(), n)
	angle := c.angle()
	return Complex {
		r * cos(n * angle),
		r * sin(n * angle)
	}
}

// Complex nth root 
pub fn (c Complex) root(n f64) Complex {
	return c.pow(1.0 / n)
}

// Complex Exponential
// Using Euler's Identity 
// Based on
// https://www.math.wisc.edu/~angenent/Free-Lecture-Notes/freecomplexnumbers.pdf
pub fn (c Complex) exp() Complex {
	a := exp(c.re)
	return Complex {
		a * cos(c.im),
		a * sin(c.im)
	}
}

// Complex Natural Logarithm
// Based on 
// http://www.chemistrylearning.com/logarithm-of-complex-number/
pub fn (c Complex) ln() Complex {
	return Complex {
		log(c.abs()),
		c.angle()
	}
}

// Complex Equals
pub fn (c1 Complex) equals(c2 Complex) bool {
	return (c1.re == c2.re) && (c1.im == c2.im)
}