Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41116324166
	for <lists+linux-rtc@lfdr.de>; Wed, 24 Feb 2021 17:06:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234875AbhBXPzn (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 24 Feb 2021 10:55:43 -0500
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:52245 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232866AbhBXPBV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 24 Feb 2021 10:01:21 -0500
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 6A495240008;
        Wed, 24 Feb 2021 15:00:14 +0000 (UTC)
Date:   Wed, 24 Feb 2021 16:00:14 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Lars Alex Pedersen <laa@kamstrup.com>,
        Bruno Thomsen <bth@kamstrup.com>,
        NXP Linux Team <linux-imx@nxp.com>
Subject: Re: watchdog: pcf2127: systemd fails on 5.11
Message-ID: <YDZp/u+fO/8HX8qo@piout.net>
References: <CAH+2xPDs8f=bR7y5QYCpYpJTE1KJPfuiML1og3S9TfSFtOFBHw@mail.gmail.com>
 <20210222224325.GB177866@roeck-us.net>
 <CAH+2xPDDiUxKk3Y3R=fj0cOU+7vJRSC5yUb_XmfOUXnqoe+2Zg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH+2xPDDiUxKk3Y3R=fj0cOU+7vJRSC5yUb_XmfOUXnqoe+2Zg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 24/02/2021 15:55:00+0100, Bruno Thomsen wrote:
> You could be right about that, I don't think the watchdog feature should
> be available for use if the alarm feature is enabled due to how CTRL2
> register behaves.
> 
> The hardware I am testing on is a custom board, but it's actually
> possible to get a Raspberry Pi module called RasClock that has
> the chip.
> 

I have an eval board for the PCF2127 (and PCF2129), the OM13513.

> I will test some locking around WD_VAL register access as that is used
> in pcf2127_wdt_ping function.
> 
> My initial test shows that spin_lock_irqsave around regmap calls are not
> a good idea as it result in:
> BUG: scheduling while atomic: watchdog/70/0x00000002
> BUG: scheduling while atomic: systemd/1/0x00000002
> 

The issue is not only regmap but the fact that i2C and spi accesses are
allowed to sleep.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
