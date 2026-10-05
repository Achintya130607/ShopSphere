<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>ShopSphere - Product Details</title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: Arial, Helvetica, sans-serif;
            color: #172033;
            background:
                radial-gradient(circle at 5% 5%, rgba(99,102,241,.10), transparent 28%),
                radial-gradient(circle at 95% 15%, rgba(59,130,246,.10), transparent 25%),
                linear-gradient(135deg, #f8fbff, #eef3ff, #f9fbff);
            min-height: 100vh;
        }

        .page {
            padding: 50px 5% 70px;
        }

        .product-card {
            max-width: 1150px;
            margin: auto;
            display: grid;
            grid-template-columns: 46% 54%;
            gap: 40px;
            padding: 30px;
            border-radius: 28px;
            background: rgba(255,255,255,.95);
            box-shadow: 0 20px 55px rgba(30,41,59,.10);
        }

        .visual {
            min-height: 520px;
            border-radius: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
            padding: 22px;
            background: linear-gradient(135deg, #eef2ff, #dbeafe, #ede9fe);
        }

        .visual img {
            width: 100%;
            height: 100%;
            max-height: 475px;
            object-fit: contain;
            border-radius: 20px;
            display: block;
            transition: transform .3s ease;
        }

        .visual img:hover {
            transform: scale(1.03);
        }

        .info {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 10px 5px;
        }

        .small-title {
            color: #4f46e5;
            font-size: 13px;
            font-weight: bold;
            letter-spacing: 4px;
            margin-bottom: 12px;
        }

        h1 {
            margin: 0 0 12px;
            font-size: 46px;
            line-height: 1.05;
        }

        .brand {
            color: #64748b;
            margin-bottom: 22px;
            font-size: 17px;
        }

        .description {
            color: #64748b;
            line-height: 1.7;
            font-size: 16px;
            margin-bottom: 22px;
        }

        .price {
            font-size: 36px;
            font-weight: 800;
            margin-bottom: 8px;
        }

        .discount {
            color: #16a34a;
            font-weight: bold;
            margin-bottom: 18px;
        }

        .stock {
            display: inline-block;
            width: fit-content;
            padding: 9px 14px;
            border-radius: 999px;
            background: #ecfdf5;
            color: #15803d;
            font-weight: bold;
            margin-bottom: 22px;
        }

        .quantity-label {
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
        }

        .quantity {
            width: 100px;
            padding: 12px;
            border-radius: 12px;
            border: 1px solid #cbd5e1;
            margin: 5px 0 18px;
            font-size: 16px;
        }

        .btn-row {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
        }

        .btn,
        .wishlist-btn {
            border: 0;
            min-height: 50px;
            padding: 13px 22px;
            border-radius: 13px;
            font-weight: bold;
            cursor: pointer;
            text-decoration: none;
            font-size: 15px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
        }

        .btn {
            color: white;
            background: linear-gradient(135deg, #2563eb, #4f46e5);
            box-shadow: 0 10px 24px rgba(37,99,235,.22);
        }

        .wishlist-btn {
            color: #db2777;
            background: #fce7f3;
        }

        .back {
            display: inline-block;
            margin-top: 25px;
            color: #475569;
            text-decoration: none;
            font-weight: bold;
        }

        .out-stock {
            display: inline-block;
            padding: 12px 15px;
            border-radius: 12px;
            background: #fef2f2;
            color: #dc2626;
            font-weight: bold;
            margin-bottom: 20px;
        }

        @media (max-width: 900px) {
            .product-card {
                grid-template-columns: 1fr;
            }

            .visual {
                min-height: 390px;
            }

            h1 {
                font-size: 38px;
            }
        }

        @media (max-width: 600px) {
            .page {
                padding: 25px 15px 45px;
            }

            .product-card {
                padding: 18px;
            }

            .visual {
                min-height: 320px;
            }

            h1 {
                font-size: 32px;
            }

            .price {
                font-size: 30px;
            }

            .btn,
            .wishlist-btn {
                width: 100%;
            }

            .btn-row {
                flex-direction: column;
            }
        }
    </style>
</head>

<body>

    <jsp:include page="fragments/navbar.jspf" />

    <div class="page">

        <div class="product-card">

            <div class="visual">
                <img
                    id="productImage"
                    src=""
                    alt="${product.name}">
            </div>

            <div class="info">

                <div class="small-title">
                    SHOPSPHERE PRODUCT
                </div>

                <h1>
                    ${product.name}
                </h1>

                <div class="brand">
                    Brand: ${product.brand}
                </div>

                <div class="description">
                    ${product.description}
                </div>

                <div class="price">
                    ₹${product.price}
                </div>

                <div class="discount">
                    ${product.discount}% discount available
                </div>

                <%
                    Object stockObj = request.getAttribute("product");
                %>

                <div class="stock" id="stockBox">
                    ✓ In Stock — ${product.stock} available
                </div>

                <form action="${pageContext.request.contextPath}/cart" method="post">

                    <input type="hidden"
                           name="action"
                           value="add">

                    <input type="hidden"
                           name="productId"
                           value="${product.productId}">

                    <label class="quantity-label">
                        Quantity
                    </label>

                    <input
                        class="quantity"
                        type="number"
                        name="quantity"
                        value="1"
                        min="1"
                        max="${product.stock}"
                        required>

                    <div class="btn-row">

                        <button class="btn" type="submit">
                            🛒 Add to Cart
                        </button>

                        <a
                            class="wishlist-btn"
                            href="${pageContext.request.contextPath}/wishlist?action=add&productId=${product.productId}">
                            ❤️ Add to Wishlist
                        </a>

                    </div>

                </form>

                <a
                    class="back"
                    href="${pageContext.request.contextPath}/products">
                    ← Back to Products
                </a>

            </div>

        </div>

    </div>

    <script>
        const productId = Number("${product.productId}");

        const imageMap = {
            1: "https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?auto=format&fit=crop&w=1000&q=85",
            2: "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?auto=format&fit=crop&w=1000&q=85",
            3: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?auto=format&fit=crop&w=1000&q=85",
            4: "https://images.unsplash.com/photo-1585515320310-259814833e62?auto=format&fit=crop&w=1000&q=85",
            5: "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=1000&q=85",
            6: "https://images.unsplash.com/photo-1579952363873-27f3bade9f55?auto=format&fit=crop&w=1000&q=85",
            7: "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?auto=format&fit=crop&w=1000&q=85"
        };

        const image = document.getElementById("productImage");

        if (imageMap[productId]) {
            image.src = imageMap[productId];
        }

        image.onerror = function () {
            this.style.display = "none";
        };
    </script>

</body>
</html>