# DDBuffer

**Deprecated** in favor of [slow_enumerator_tools](https://github.com/ddfreyne/slow_enumerator_tools).

Replace

```ruby
DDBuffer.new(size).call(enum)
```

with

```ruby
SlowEnumeratorTools.buffer(enum, size)
```
