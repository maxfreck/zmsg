
# zmsg

A simple message with context, implemented in ABAP programming language.

## Usage examples

Basic usage example:

```ABAP
data(message) = new zmsg(
  template = 'Hello &1! This is a &2 &3 message.'
  context = value #(
    ( id = 1 value = sy-uname )
    ( id = 2 value = 'Foo' )
    ( id = 3 value = 'Bar' )
  )
).

data(message_string) = message->to_string( ).
```

You can get a string value using static method:

```ABAP
data(message_string) = zmsg=>str(
  template = 'Hello &1! This is a &2 &3 message.'
  context = value #(
    ( id = 1 value = sy-uname )
    ( id = 2 value = 'Foo' )
    ( id = 3 value = 'Bar' )
  )
).
```

Also, you can get a message text when checking `sy-subrc`:

```ABAP
data(message_string) = zmsg=>symsg( ).
```
