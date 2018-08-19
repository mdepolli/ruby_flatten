# Flatten

Ruby re-implementation of the `Array#flatten` method.

### To run tests in shell:

```shell
$ ruby flatten.rb
```

### To use module in irb:

```
irb(main):001:0> require_relative 'flatten'
=> true
irb(main):001:1> Flatten.run([[1, 2, [3]], 4])
=> [1, 2, 3, 4]
```
