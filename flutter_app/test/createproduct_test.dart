import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../lib/common/constants.dart';

import 'package:flutter_app/Pages/createproduct/dataform.dart';

void main() {
  test('Test create product name', () {
    var result = Validate.productnamevlaidator('product');
    expect(result, null);
  });

  test('Test create product name empty', () {
    var result = Validate.productnamevlaidator('');
    expect(result, kProductNameNullError);
  });

  test('Test create product price', () {
    var result = Validate.productpricevalidator('200');
    expect(result, null);
  });

  test('Test create product price empty', () {
    var result = Validate.productpricevalidator('');
    expect(result, kProductPriceNullError);
  });

  test('Test create product brand', () {
    var result = Validate.productbrandvalidator('brand');
    expect(result, null);
  });

  test('Test create product brand empty', () {
    var result = Validate.productbrandvalidator('');
    expect(result, kProductBrandNullError);
  });

  test('Test create product size', () {
    var result = Validate.productsizevalidator('size');
    expect(result, null);
  });

  test('Test create product size empty', () {
    var result = Validate.productsizevalidator('');
    expect(result, kProductSizeNullError);
  });

  test('Test create product quantity', () {
    var result = Validate.productquantityvalidator('quantity');
    expect(result, null);
  });

  test('Test create product quantity empty', () {
    var result = Validate.productquantityvalidator('');
    expect(result, kProductQuantityNullError);
  });

  test('Test create product color', () {
    var result = Validate.productcolorvalidator('color');
    expect(result, null);
  });

  test('Test create product color empty', () {
    var result = Validate.productcolorvalidator('');
    expect(result, kProductColorNullError);
  });

  test('Test create product category', () {
    Item cat = Item('category');

    var result = Validate.productcategoryvalidator(cat);
    expect(result, null);
  });

  test('Test create product category empty', () {
    Item cat = Item('Default');
    var result = Validate.productcategoryvalidator(cat);
    expect(result, kProductCategoryNullError);
  });
}
