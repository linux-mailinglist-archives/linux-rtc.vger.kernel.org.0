Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAF3E299830
	for <lists+linux-rtc@lfdr.de>; Mon, 26 Oct 2020 21:48:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725784AbgJZUsQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 26 Oct 2020 16:48:16 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:42565 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725771AbgJZUsP (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 26 Oct 2020 16:48:15 -0400
X-Originating-IP: 90.65.88.165
Received: from localhost (lfbn-lyo-1-1908-165.w90-65.abo.wanadoo.fr [90.65.88.165])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 32BDCFF808;
        Mon, 26 Oct 2020 20:48:12 +0000 (UTC)
Date:   Mon, 26 Oct 2020 21:48:11 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Qiang Zhao <qiang.zhao@nxp.com>
Cc:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Bruno Thomsen <bruno.thomsen@gmail.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly
 available
Message-ID: <20201026204811.GD75353@piout.net>
References: <20200924074715.GT9675@piout.net>
 <20200924105256.18162-1-u.kleine-koenig@pengutronix.de>
 <VE1PR04MB676864E851C6371F97877FA291190@VE1PR04MB6768.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <VE1PR04MB676864E851C6371F97877FA291190@VE1PR04MB6768.eurprd04.prod.outlook.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 26/10/2020 07:23:26+0000, Qiang Zhao wrote:
> Any update for this patchset?
> 

The whole point would be to get the DT and the watchdog maintainers
agree on the property name. Once done, the driver implementation is
trivial and will get applied.

> Best Regards
> Qiang Zhao
> 
> > -----Original Message-----
> > From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > Sent: 2020年9月24日 18:53
> > To: Alexandre Belloni <alexandre.belloni@bootlin.com>; Qiang Zhao
> > <qiang.zhao@nxp.com>; Bruno Thomsen <bruno.thomsen@gmail.com>
> > Cc: linux-rtc@vger.kernel.org; a.zummo@towertech.it;
> > linux-watchdog@vger.kernel.org; devicetree@vger.kernel.org;
> > linux-kernel@vger.kernel.org; robh+dt@kernel.org; kernel@pengutronix.de;
> > Wim Van Sebroeck <wim@linux-watchdog.org>; Guenter Roeck
> > <linux@roeck-us.net>
> > Subject: [PATCH 0/2] rtc: pcf2127: only use watchdog when explicitly available
> > 
> > Hello,
> > 
> > now that there are two people stumbling over the pcf2127 driver providing a
> > non-functional watchdog device, here comes an RFC patch to address this.
> > 
> > Note this is only compile tested and dt-documentation is still missing.
> > Still send this series because the cleanup is nice independent of this discussion
> > and to have something to argue about.
> > 
> > Does someone can offer a better name than "has-watchdog", is there a scheme
> > that could be used already that I'm not aware of?
> > 
> > Best regards
> > Uwe
> > 
> > Uwe Kleine-König (2):
> >   rtc: pcf2127: move watchdog initialisation to a separate function
> >   [RFC] rtc: pcf2127: only use watchdog when explicitly available
> > 
> >  drivers/rtc/rtc-pcf2127.c | 57 ++++++++++++++++++++++-----------------
> >  1 file changed, 32 insertions(+), 25 deletions(-)
> > 
> > --
> > 2.28.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
