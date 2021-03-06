<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
<meta name="csrf-token" content="{{ csrf_token() }}">
  <title>TerraFlops</title>
  <link href="{{asset('vendor/bootstrap/css/bootstrap.min.css')}}" rel="stylesheet">
  <link href="{{asset('css/simple-sidebar.css')}}" rel="stylesheet">
  @section('styles')
  @show
</head>

<body>

  <div class="d-flex" id="wrapper">

    <!-- Sidebar -->
    <div class="bg-secondary border-right" id="sidebar-wrapper">
      <div class="sidebar-heading">
	  			<H1>TerraFlops
          </H1>
	  </div>
      <div class="list-group list-group-flush" >
	          <div id="basket">
            <table id="bascets">
                <tbody>
                <tr style="display: none;" class="hPb">
                    <td>Выбрано:</td>
                    <td><span id="totalGoods">0</span> товаров</td>
                    <td>Сумма: &asymp; </td>
                    <td><span id="totalPrice">0</span> $.</td>
                </tr>
                <tr style="display: table-row;" class="hPe">
                    <td colspan="2">Корзина пуста</td>
                </tr>
                <tr>
                    <td><a style="display: none;" id="clearBasket" href="#">Очистить</a></td>
                    <td><a style="display: none;" id="checkOut" href="{{asset('basket')}}">Оформить</a></td>
                </tr>
                </tbody>
            </table>
        </div>
	    @foreach($v_categories as $cat)
         <a href="{{asset('category/'.$cat->id)}}" class="list-group-item list-group-item-action bg-primary text-light">{{__('base.menu.'.$cat->name)}}</a>
		@endforeach
      </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">

      <nav class="navbar navbar-expand-lg navbar-dark bg-secondary border-bottom">
        <button class="btn btn-primary" id="menu-toggle">Menu</button>

        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ml-auto mt-2 mt-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="{{asset('about')}}">{{__('base.about')}}</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{asset('construct')}}">{{__('base.construct')}}</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="{{asset('contact')}}">{{__('base.contact')}}</a>
            </li>
						@guest
                            <li class="nav-item">
                                <a class="nav-link" href="{{ route('login') }}">{{ __('base.login') }}</a>
                            </li>
                            @if (Route::has('register'))
                                <li class="nav-item">
                                    <a class="nav-link" href="{{ route('register') }}">{{ __('base.register') }}</a>
                                </li>
                            @endif
                        @else
                            <li class="nav-item dropdown">
                                <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="{{asset('home')}}" >
                                        {{__('base.cabinet')}}
                                    </a>
                                    <a class="dropdown-item" href="{{ route('logout') }}"
                                       onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                        {{ __('base.logout') }}
                                    </a>

                                    <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                                        @csrf
                                    </form>
                                </div>
                            </li>
                        @endguest
<li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                            <img id="imgNavSel" src="{{(isset($_COOKIE['lang']))?'/lang/'.$_COOKIE['lang'].'.jpg':'ru.jpg'}}" alt="..." class="img-thumbnail icon-small">&nbsp;&nbsp;
                            <span id="lanNavSel">
							{{(isset($_COOKIE['lang']))?$_COOKIE['lang']:'ru'}}
							</span> <span class="caret"></span></a>
                        <ul class="dropdown-menu mumu" role="menu">
                            <li><a id="navFra" href="/?lang=fr" class="language">
                                    <img id="imgNavFra" src="{{asset('lang/fr.jpg')}}" alt="France" class="img-thumbnail icon-small">&nbsp;
                                    <span id="lanNavFra">Française</span>&nbsp;
                                </a></li>
                            <li><a id="navEng" href="/?lang=en" class="language">
                                    <img id="imgNavEng" src="{{asset('lang/en.jpg')}}" alt="English" class="img-thumbnail icon-small">&nbsp;
                                    <span id="lanNavEng">English</span>&nbsp;
                                </a></li>
                            <li><a id="navRus" href="/?lang=ru" class="language">
                                    <img id="imgNavRus" src="{{asset('lang/ru.jpg')}}" alt="Russia" class="img-thumbnail icon-small">&nbsp;
                                    <span id="lanNavRus">Русский</span>&nbsp;
                                </a></li>
                        </ul>
                    </li>
          </ul>
        </div>
      </nav>

      <div class="container-fluid">
        <main class="py-4">
            @yield('content')
        </main>
      </div>
    </div>
    <!-- /#page-content-wrapper -->

  </div>
  <!-- /#wrapper -->

  <!-- Bootstrap core JavaScript -->
  <script src="{{asset('vendor/jquery/jquery.min.js')}}"></script>
  <script src="{{asset('vendor/bootstrap/js/bootstrap.min.js')}}"></script>
  <script src="{{asset('js/jquery.cookie.js')}}"></script>
  <script src="{{asset('js/cart.js')}}"></script>
  @section('scripts')
  <script>
    $("#menu-toggle").click(function(e) {
      e.preventDefault();
      $("#wrapper").toggleClass("toggled");
    });
  </script>
  @show
</body>

</html>
