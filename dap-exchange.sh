echo "EUR/USD/EUR" &&curl "https://www.xe.com/currencyconverter/convert/?Amount=1&From=EUR&To=USD" -A "Mozilla" -s | sed -n "s/.*>\(.*\) USD<.*/\1 USD/p" && curl "https://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=EUR" -A "Mozilla" -s | sed -n "s/.*>\(.*\) EUR<.*/\1 EUR/p"
