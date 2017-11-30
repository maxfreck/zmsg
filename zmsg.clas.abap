class zmsg definition public final create public.
  public section.
    types:
      begin of ctx,
        id    type i,
        value type string,
      end of ctx,
      ctxt type standard table of ctx with key id.

    class-methods new importing template type any context type ctxt returning value(ret) type ref to zmsg.
    class-methods str  importing template type any context type ctxt returning value(ret) type string.
    class-methods symsg returning value(ret) type string.

    methods constructor importing template type any context type ctxt optional.
    methods to_string returning value(ret) type string.

  protected section.
    data:
      i_template type string,
      i_context  type ctxt.

endclass.



class zmsg implementation.

  method constructor.
    i_template = conv #( template ).

    if context is supplied.
      i_context = context.
    endif.
  endmethod.


  method new.
    ret = new #( template = template context = context ).
  endmethod.


  method str.
    data(msg) = new zmsg( template = template context = context ).
    ret = msg->to_string( ).
  endmethod.

  method symsg.
    message id sy-msgid type sy-msgty number sy-msgno with sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4 into ret.
  endmethod.

  method to_string.
    ret = i_template.

    if lines( i_context ) > 0.
      loop at i_context assigning field-symbol(<ctx>).
        replace all occurrences of |&{ <ctx>-id }| in ret with <ctx>-value.
      endloop.
    endif.
  endmethod.
endclass.
