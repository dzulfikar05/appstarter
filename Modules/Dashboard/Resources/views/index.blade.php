@extends('dashboard::layouts.master')

@section('content')
    <h1>Hello World</h1>

    <p>
        This view is loaded from module: {!! config('dashboard.name') !!}
    </p>
    <?= session('userdata.user_role')?>
@endsection
