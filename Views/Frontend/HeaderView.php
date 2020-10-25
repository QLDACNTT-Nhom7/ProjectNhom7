<header id="header">
    <!-- top header -->
    <div class="top-header">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-6 col-md-6"> <span><i class="fa fa-phone"></i> 0399966637</span> <span><i class="fa fa-envelope-o"></i> <a href="mailto:nguyenthetung2017605893@mail.com">nguyenthetung2017605893@mail.com</a></span> </div>
                <div class="col-xs-12 col-sm-6 col-md-6 customer"> </div>
            </div>
        </div>
    </div>
    <!-- end top header -->
    <!-- middle header -->
    <div class="mid-header">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-3 logo "> <a href="index.php"> <img style="height: 115px;" src="Assets/frontend/100/047/633/themes/517833/assets/tu.jpg?1481775169361" alt="Tùng Anh" title="Tùng Anh" class="img-responsive"> </a> </div>
                <div class="col-xs-12 col-sm-12 col-md-6 header-search">
                    <script type="text/javascript">
                        function search(){
                            key = document.getElementById("key").value;
                            location.href="index.php?controller=search&key="+key;
                            return false;
                        }
                    </script>
                    <form method="post" action="">
                        <input type="text" value="" placeholder="Nhập từ khóa tìm kiếm..." id="key" class="input-control">
                        <button  type="submit"> <i class="fa fa-search" onclick="return search();"></i> </button>
                    </form>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-3 mini-cart">

                    <div class="wrapper-mini-cart"> <span class="icon"><i class="fa fa-shopping-cart"></i></span>
                        <a href="cart">
                            <?php
                              //lay so luon san pham
                            $cartNumber = 0;
                            if(isset($_SESSION["cart"]) == true) {
                                foreach ($_SESSION["cart"] as $product) {
                                     $cartNumber = $cartNumber + $product["number"];
                                }
                            }

                            ?>
                            <span class="mini-cart-count"> <?php echo $cartNumber; ?> </span> sản phẩm <i class="fa fa-caret-down"></i></a>
                        <div class="content-mini-cart">
                            <div class="has-items">
                                <ul class="list-unstyled">
                                    <?php if(isset($_SESSION["cart"])): ?>
                                    <?php foreach ($_SESSION["cart"] as $product): ?>
                                    <li class="clearfix" id="item-1853038">
                                        <div class="image"> <a href="index.php?controller=Product_Detail&id=<?php echo $product['id']; ?>">
                                                <img alt="<?php echo $product['name']; ?>" src="Assets/upload/product/<?php echo $product['img']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive"> </a> </div>
                                        <div class="info">
                                            <h3><a href="index.php?controller=Product_Detail&id=<?php echo $product['id']; ?>"><?php echo $product['name']; ?></a></h3>
                                            <p><?php echo $product['number']; ?> x <?php echo number_format($product['price']); ?> ₫</p>
                                        </div>
                                        <div> <a href="index.php?controller=Cart&action=delete&id=<?php echo $product['id']; ?>"> <i class="fa fa-times"></i></a> </div>
                                    </li>
                                    <?php endforeach; ?>
                                    <?php
                                     endif;
                                    ?>
                                </ul>
                                <a href="index.php?controller=checkout" class="button">Thanh toán</a> </div>

                        </div>
                    </div>

                </div>
                <div style="margin-left: 1070px;font-size: 16px;margin-top: 0px;">
                <a href="index.php?area=Backend&controller=Login"><span class="icon"><i class="fa fa-user"> Đăng Nhập</i></span></a>  </div>
            </div>
        </div>
        <!-- end middle header -->
        <!-- bottom header -->
        <div class="bottom-header">
            <div class="container">
                <div class="clearfix">
                    <ul class="main-nav hidden-xs hidden-sm list-unstyled">
                        <li ><a href="index.php">Trang chủ</a></li>
                        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Sản phẩm <span class="caret"></span></a>
                            <ul class="dropdown-menu" style="background-color: #77ca64;">
                                <li><a href="index.php?controller=ProductCategory&id=1">SON MÔI</a></li>
                                <li><a href="index.php?controller=ProductCategory&id=2">PHẤN MÁ HỒNG</a></li>
                                <li><a href="index.php?controller=ProductCategory&id=3">KEM TRẮNG DA</a></li>
                                <li><a href="index.php?controller=ProductCategory&id=4">KEM DƯỠNG ẨM</a></li>
                                <li><a href="index.php?controller=ProductCategory&id=5">NƯỚC TẨY TRANG</a></li>
                            </ul>
                        </li>
                        <li ><a href="index.php?controller=Cart">Giỏ Hàng</a></li>
                        <li ><a href="index.php?controller=Contacts">Liên hệ</a></li>
                    </ul>
                    <a href="javascript:void(0);" class="toggle-main-menu hidden-md hidden-lg"> <i class="fa fa-bars"></i> </a>
                    <ul class="list-unstyled mobile-main-menu hidden-md hidden-lg" style="display:none">
                        <li class="active"><a href="index.php">Trang chủ</a></li>
                        <li ><a href="#">Giới thiệu</a></li>
                        <li ><a href="index.php?controller=Cart">Giỏ hàng</a></li>
                        <li ><a href="index.php?controller=lienhe">Liên hệ</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- end bottom header -->
</header>