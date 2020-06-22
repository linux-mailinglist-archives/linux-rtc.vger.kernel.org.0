Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9185C203A34
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2020 17:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729092AbgFVPB3 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jun 2020 11:01:29 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:49027 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729065AbgFVPB3 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jun 2020 11:01:29 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id D0265240010;
        Mon, 22 Jun 2020 15:01:26 +0000 (UTC)
Date:   Mon, 22 Jun 2020 17:01:26 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>
Subject: Re: [PATCH 1/3] mfd: ds1374: Introduce Dallas/Maxim DS1374 MFD core
 driver
Message-ID: <20200622150126.GJ131826@piout.net>
References: <HK2PR01MB328111AB2520315A7D4A1172FA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
 <20200622111413.GV954398@dell>
 <20200622142656.GA102380@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200622142656.GA102380@roeck-us.net>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/06/2020 07:26:56-0700, Guenter Roeck wrote:
> On Mon, Jun 22, 2020 at 12:14:13PM +0100, Lee Jones wrote:
> > On Mon, 22 Jun 2020, Johnson CH Chen (陳昭勳) wrote:
> > 
> > > Dallas/Maxim DS1374 is a counter designed to continuously count
> > > time in seconds. It provides an I2C interface to the host to
> > > access RTC clock or Alarm/Watchdog timer.
> > > 
> > > Add MFD Core driver, supporting the I2C communication to RTC and
> > > Watchdog devices.
> > > 
> > > Signed-off-by: Johnson Chen <johnsonch.chen@moxa.com>
> > > ---
> > >  drivers/mfd/Kconfig  |  11 +++++
> > >  drivers/mfd/Makefile |   2 +
> > >  drivers/mfd/ds1374.c | 101 +++++++++++++++++++++++++++++++++++++++++++
> > >  3 files changed, 114 insertions(+)
> > >  create mode 100644 drivers/mfd/ds1374.c
> > 
> > Not sure I see the point of this driver.
> > 
> 
> Not entirely sure either. Seems to me the idea is to use the watchdog
> subsystem for watchdog functionality, but that is just a guess and not
> really necessary (the conversion could be done in the rtc driver).
> I don't think the code as written works - the rtc code uses a mutex
> which the watchdog driver obviously isn't aware of. The mutex would
> have to be moved into the mfd code, with respective access functions.
> 
> Overall this adds a lot of complexity, and it seems the interdependencies
> between rtc and watchdog functionality are not well understood. Plus,
> other watchdog drivers have recently been added to other rtc clock chips,
> so this adds some inconsistencies in the rtc subsystem. Are we going
> to see this change for all those combined rtc/watchdog drivers ?
> If so, it might make sense to communicate that now to ensure consistency.
> 

I read the datasheet again and I agree the watchdog part can live in the
rtc driver. As only the RTC alarm and the watchdog are mutually
exclusive. I don't think an MFD driver is necessary. Converting the
current driver to the watchdog subsystem seems to be the correct way
forward.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
