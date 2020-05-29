Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E2751E7E66
	for <lists+linux-rtc@lfdr.de>; Fri, 29 May 2020 15:16:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgE2NQD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 May 2020 09:16:03 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:52073 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgE2NQD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 May 2020 09:16:03 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 001F3FF80C;
        Fri, 29 May 2020 13:16:00 +0000 (UTC)
Date:   Fri, 29 May 2020 15:16:00 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "Kevin P. Fleming" <kevin+linux@km6g.us>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH] rtc: abx80x: Provide feedback for invalid dt properties
Message-ID: <20200529131600.GC3972@piout.net>
References: <20200529001203.235304-1-kevin+linux@km6g.us>
 <20200529085452.GZ3972@piout.net>
 <CAE+UdophyZJtQsj2UahE481u1Yrj_qy1j9Fjx1V_feNy0RW5GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAE+UdophyZJtQsj2UahE481u1Yrj_qy1j9Fjx1V_feNy0RW5GQ@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 29/05/2020 06:28:56-0400, Kevin P. Fleming wrote:
> On Fri, May 29, 2020 at 4:54 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> > > -static int abx80x_dt_trickle_cfg(struct device_node *np)
> > > +static int abx80x_dt_trickle_cfg(struct i2c_client *client,
> > > +                              struct device_node *np)
> >
> > I would remove np from the parameters and use
> > struct device_node *np = client->dev.of_node;
> > in the function.
> 
> Will do.
> 
> > > +             dev_err(&client->dev, "Invalid tc-diode value: %s\n", diode);
> >
> > Can you make that dev_dbg? This is only ever needed at board bring up/
> > development time, so it is not necessary to bloat the kernel with more
> > strings.
> 
> I'm using this driver via the Raspberry Pi device tree 'overlay'
> mechanism, so I'm setting these parameters in a configuration file and
> they are applied by the board's firmware before the kernel is booted.
> As a result this is essentially 'runtime' configuration, it's not a
> static device tree for the board, so end users like me could run into
> this problem.
> 

This is still board bringup, once it is correct, you will never need the
message anymore. If the issue is device tree validation (i.e. typo in
the string), then maybe you should convert the doc to yaml so you device
tree and overlay could be checked.


> I'd be fine with changing it to dev_info though, and indicating that
> the trickle charger won't be enabled in addition.

dev_info is worse, it is still bloating the kernel and also always
printing in the kernel logs.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
