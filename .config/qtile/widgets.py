# -*- coding: utf-8 -*-

from libqtile.widget import base
from libqtile.widget.generic_poll_text import GenPollUrl
import locale


class CryptoTicker(GenPollUrl):
    """
    A cryptocurrency ticker widget, data provided by the coinmarketcap API. Defaults to
    displaying bitcoin currency in whatever the current locale is (or usd). Examples:

    ::

        # display the average price of bitcoin in euros in format like "BTC:9001"
        widget.CryptoTicker(from_currency='bitcoin', currency='eur', format="{symbol}:{price}")

        # display the average price of litecoin in local currency
        widget.CryptoTicker(from_currency='litecoin')

        # display the average price of litecoin in bitcoin
        widget.CryptoTicker(format="{symbol}:{price_btc}", from_currency='litecoin')
    """

    QUERY_URL = "https://api.coinmarketcap.com/v1/ticker/{from_currency}/?convert={currency}"

    orientations = base.ORIENTATION_HORIZONTAL

    defaults = [
        ('currency', locale.localeconv()['int_curr_symbol'].strip() or 'usd',
         'Result currency'),
        ('from_currency', 'bitcoin', 'The source currency to convert from'),
        ('format', '{symbol}:{to_price}',
         'Display format: name, symbol, rank, to_price, price_usd, price_btc, percentage_change_<1h,24h,7d>'),
    ]

    def __init__(self, **config):
        super().__init__(**config)
        self.add_defaults(self.defaults)
        self.url = self.QUERY_URL.format(from_currency=self.from_currency.lower(), currency=self.currency.lower())

    def parse(self, body):
        body = body[0] if body else {}
        body['currency'] = self.currency
        body['from_currency'] = self.from_currency
        body['to_price'] = body.get('price_{}'.format(self.currency), 'unknown_output_currency')
        return self.format.format(**body)
