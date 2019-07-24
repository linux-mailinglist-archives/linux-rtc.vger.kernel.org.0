Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ABAB872F5D
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Jul 2019 15:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726422AbfGXNBB (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Jul 2019 09:01:01 -0400
Received: from relay2-d.mail.gandi.net ([217.70.183.194]:35955 "EHLO
        relay2-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726312AbfGXNBB (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Jul 2019 09:01:01 -0400
X-Originating-IP: 92.137.69.152
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 4573540015;
        Wed, 24 Jul 2019 13:00:59 +0000 (UTC)
Date:   Wed, 24 Jul 2019 15:00:58 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     linux-rtc@vger.kernel.org, a.zummo@towertech.it, bth@kamstrup.com,
        u.kleine-koenig@pengutronix.de
Subject: Re: [PATCH 4/4] rtc: pcf2127: add watchdog feature support
Message-ID: <20190724130058.GQ24911@piout.net>
References: <20190722155811.11980-1-bruno.thomsen@gmail.com>
 <20190722155811.11980-5-bruno.thomsen@gmail.com>
 <20190723184842.GM24911@piout.net>
 <CAH+2xPAjafxayxFStQOFqiEKZKMtiNaNrYWfy5YbJVdmxYXq7g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH+2xPAjafxayxFStQOFqiEKZKMtiNaNrYWfy5YbJVdmxYXq7g@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/07/2019 09:18:05+0200, Bruno Thomsen wrote:
> Den tir. 23. jul. 2019 kl. 20.48 skrev Alexandre Belloni
> <alexandre.belloni@bootlin.com>:
> >
> > > +config RTC_DRV_PCF2127_WDT
> > > +     bool "NXP PCF2127 watchdog timer"
> > > +     depends on RTC_DRV_PCF2127
> > > +     help
> > > +       If you say Y here you will get support for the watchdog timer
> > > +       in the NXP PCF2127 and PCF2129 real-time clock chips.
> > > +
> > > +       The watchdog is usually used together with systemd or the
> > > +       watchdog daemon. Watchdog trigger cause system reset.
> > > +
> >
> > I wouldn't add a new Kconfig entry for that. How much bigger will it be?
> 
> Delta size on rtc-pcf2127.ko is 3244 bytes when compiled for armv7a.
> 
> I only added Kconfig option to allow driver load on arm platforms where
> you need to use internal watchdog to restart board. But I will remove it
> for next version, should I extend help text on exiting Kconfig option to
> also include information about other chip features? As this is not a
> simple RTC chip.

You can extend the Kconfig help if you want.

> 
> > > +static const struct file_operations pcf2127_wdt_fops = {
> > > +     .owner = THIS_MODULE,
> > > +     .write = pcf2127_wdt_write,
> > > +     .unlocked_ioctl = pcf2127_wdt_ioctl,
> > > +};
> > > +
> > > +static struct miscdevice pcf2127_miscdev = {
> > > +     .minor = WATCHDOG_MINOR,
> > > +     .name = "watchdog",
> > > +     .fops = &pcf2127_wdt_fops,
> > > +};
> >
> > Wow, that is old school, please use the watchdog subsysteů.
> 
> Okay, I was not aware that this was an old API. So I should convert
> to struct watchdog_ops and devm_watchdog_register_device?
> 

Yes, that is what I was asking for.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
