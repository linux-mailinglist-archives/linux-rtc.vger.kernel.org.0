Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FB0D905BC
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Aug 2019 18:28:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726265AbfHPQ22 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Aug 2019 12:28:28 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:60161 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725956AbfHPQ21 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Aug 2019 12:28:27 -0400
X-Originating-IP: 90.65.161.137
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id BE01E60002;
        Fri, 16 Aug 2019 16:28:25 +0000 (UTC)
Date:   Fri, 16 Aug 2019 18:28:25 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Li Yang <leoyang.li@nxp.com>
Cc:     Biwen Li <biwen.li@nxp.com>, a.zummo@towertech.it,
        linux-rtc@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [v2] rtc: pcf85363/pcf85263: fix error that failed to run
 hwclock -w
Message-ID: <20190816162825.GE3545@piout.net>
References: <20190816024636.34738-1-biwen.li@nxp.com>
 <20190816080417.GB3545@piout.net>
 <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRPPNRkqbWzGEvUJyi0Qff3oS6biO0v7BTrK1Jiz9AMnOYF=Q@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/08/2019 10:50:49-0500, Li Yang wrote:
> On Fri, Aug 16, 2019 at 3:05 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 16/08/2019 10:46:36+0800, Biwen Li wrote:
> > > Issue:
> > >     - # hwclock -w
> > >       hwclock: RTC_SET_TIME: Invalid argument
> > >
> > > Why:
> > >     - Relative patch: https://lkml.org/lkml/2019/4/3/55 , this patch
> > >       will always check for unwritable registers, it will compare reg
> > >       with max_register in regmap_writeable.
> > >
> > >     - In drivers/rtc/rtc-pcf85363.c, CTRL_STOP_EN is 0x2e, but DT_100THS
> > >       is 0, max_regiter is 0x2f, then reg will be equal to 0x30,
> > >       '0x30 < 0x2f' is false,so regmap_writeable will return false.
> > >
> > >     - Root cause: the buf[] was written to a wrong place in the file
> > >       drivers/rtc/rtc-pcf85363.c
> > >
> >
> > This is not true, the RTC wraps the register accesses properly and this
> 
> This performance hack probably deserve some explanation in the code comment.  :)
> 
> > is probably something that should be handled by regmap_writable.
> 
> The address wrapping is specific to this RTC chip.  Is it also
> commonly used by other I2C devices?  I'm not sure if regmap_writable
> should handle the wrapping case if it is too special.
> 

Most of the i2c RTCs do address wrapping which is sometimes the only way
to properly set the time.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
