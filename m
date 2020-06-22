Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F8E2035A6
	for <lists+linux-rtc@lfdr.de>; Mon, 22 Jun 2020 13:25:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729005AbgFVLZk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 22 Jun 2020 07:25:40 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:46839 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728864AbgFVLZk (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 22 Jun 2020 07:25:40 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 48B5C240005;
        Mon, 22 Jun 2020 11:25:37 +0000 (UTC)
Date:   Mon, 22 Jun 2020 13:25:37 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Johnson CH Chen =?utf-8?B?KOmZs+aYreWLsyk=?= 
        <JohnsonCH.Chen@moxa.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 0/3] Use MFD for Dallas/Maxim DS1374 driver series
Message-ID: <20200622112537.GE131826@piout.net>
References: <HK2PR01MB3281DAE412911621A7F8963BFA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <HK2PR01MB3281DAE412911621A7F8963BFA970@HK2PR01MB3281.apcprd01.prod.exchangelabs.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 22/06/2020 10:03:25+0000, Johnson CH Chen (陳昭勳) wrote:
> Hello all,
> 
> This patch set uses MFD structure for DS1374 so that RTC and Watchdog
> functions can be separately. Therefore, we can add more Watchdog 
> subfunctions here.
> 
> A DS1374 MFD core driver supports the I2C communication to RTC and
> Watchdog devices.
> 
> 1. Add DS1374 MFD core driver with I2C bus.
> 2. Let DS1374 RTC driver has RTC and Alarm functions only.
> 3. Add DS1374 Watchdog driver.
> 

For reference, this was the last attempt:

https://lore.kernel.org/linux-rtc/20170718092245.tc5oosbbb6lzvqpy@dell/

The main issue I see with your series is that there is no way to select
which of the rtc or the watchdog driver has to be used as IIRC each
function is mutually exclusive. I think you should work on the DT
bindings, addressing the few remaining comments.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
