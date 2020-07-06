Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26ED2152B7
	for <lists+linux-rtc@lfdr.de>; Mon,  6 Jul 2020 08:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727089AbgGFGem (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 6 Jul 2020 02:34:42 -0400
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:56429 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727039AbgGFGem (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 6 Jul 2020 02:34:42 -0400
X-Originating-IP: 90.65.108.121
Received: from localhost (lfbn-lyo-1-1676-121.w90-65.abo.wanadoo.fr [90.65.108.121])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id DD885C000B;
        Mon,  6 Jul 2020 06:34:38 +0000 (UTC)
Date:   Mon, 6 Jul 2020 08:34:38 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alessandro Zummo <a.zummo@towertech.it>
Subject: Re: [PATCH v2] rtc: rtc-ds1374: wdt: Use watchdog core for watchdog
 part
Message-ID: <20200706063438.GF6538@piout.net>
References: <HK2PR01MB3281245DE7A646BCB12D987DFA6A0@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200705152410.GB5663@roeck-us.net>
 <HK2PR01MB328121F60A378124D2C83698FA690@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB328121F60A378124D2C83698FA690@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 06/07/2020 05:18:39+0000, Johnson CH Chen (陳昭勳) wrote:
> > >  #endif /*CONFIG_RTC_DRV_DS1374_WDT*/
> > >  /*
> > > @@ -653,15 +514,25 @@ static int ds1374_probe(struct i2c_client
> > > *client,
> > >
> > >  #ifdef CONFIG_RTC_DRV_DS1374_WDT
> > >  	save_client = client;
> > > -	ret = misc_register(&ds1374_miscdev);
> > > -	if (ret)
> > > -		return ret;
> > > -	ret = register_reboot_notifier(&ds1374_wdt_notifier);
> > > +	ds1374->wdt.info = &ds1374_wdt_info;
> > > +	ds1374->wdt.ops = &ds1374_wdt_ops;
> > > +	ds1374->wdt.timeout = TIMER_MARGIN_DEFAULT;
> > > +	ds1374->wdt.min_timeout = TIMER_MARGIN_MIN;
> > > +	ds1374->wdt.max_timeout = TIMER_MARGIN_MAX;
> > > +
> > > +	watchdog_init_timeout(&ds1374->wdt, wdt_margin, &client->dev);
> > > +	watchdog_set_nowayout(&ds1374->wdt, nowayout);
> > > +	watchdog_stop_on_reboot(&ds1374->wdt);
> > > +	watchdog_stop_on_unregister(&ds1374->wdt);
> > > +	ds1374_wdt_settimeout(&ds1374->wdt, wdt_margin);
> > > +
> > > +	ret = devm_watchdog_register_device(&client->dev, &ds1374->wdt);
> > >  	if (ret) {
> > > -		misc_deregister(&ds1374_miscdev);
> > > +		dev_err(&client->dev, "failed to register DS1374 watchdog
> > > +device\n");

There was no error message before, I don't think this one is necessary.

> > >  		return ret;
> > >  	}
> > > -	ds1374_wdt_settimeout(131072);
> > > +
> > > +	dev_info(&client->dev, "DS1374 watchdog device enabled\n");
> > 
> > Is that necessary ?
> > 
> 
> I think it's good to show watchdog initial timeout. I'll include above suggestions in v3, thanks!
> 

No, please avoid adding more strings in that driver.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
