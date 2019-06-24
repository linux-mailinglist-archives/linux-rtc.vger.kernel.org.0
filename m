Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFB3750920
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2019 12:42:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729271AbfFXKmp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Jun 2019 06:42:45 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:57125 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728676AbfFXKmp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 Jun 2019 06:42:45 -0400
Received: from localhost (alyon-656-1-672-152.w92-137.abo.wanadoo.fr [92.137.69.152])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id BE47B100005;
        Mon, 24 Jun 2019 10:42:38 +0000 (UTC)
Date:   Mon, 24 Jun 2019 12:42:34 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Chen-Yu Tsai <wens@kernel.org>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Vincent Donnefort <vdonnefort@gmail.com>,
        linux-rtc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/3] rtc: pcf8563: Fix unhandled interrupt storm
Message-ID: <20190624104234.GG3133@piout.net>
References: <20190604042337.26129-1-wens@kernel.org>
 <20190620162220.GA23549@piout.net>
 <CAGb2v67sf3L9zH9Li6tF3xunQ4-isoodBLQmSv2VJtAj6hS7Ug@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGb2v67sf3L9zH9Li6tF3xunQ4-isoodBLQmSv2VJtAj6hS7Ug@mail.gmail.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/06/2019 18:34:29+0800, Chen-Yu Tsai wrote:
> On Fri, Jun 21, 2019 at 12:22 AM Alexandre Belloni
> <alexandre.belloni@bootlin.com> wrote:
> >
> > On 04/06/2019 12:23:34+0800, Chen-Yu Tsai wrote:
> > > From: Chen-Yu Tsai <wens@csie.org>
> > >
> > > Hi everyone,
> > >
> > > While bringing up my Pine H64, I encountered an interrupt storm from the
> > > pcf8563 RTC. The RTC chip's interrupt line is shared with the PMIC, and
> > > was not properly added to the device tree. Also, the driver was using an
> > > trigger method incompatible with the PMIC, preventing the interrupt line
> > > from being shared. Last, the driver only clears and masks the alarm
> > > interrupt, while leaving the timer interrupt untouched. This is a
> > > problem if previous systems left the timer interrupt enabled, and there
> > > was an interrupt pending.
> > >
> > > This patch set fixes all three issues, one per patch.
> > >
> > > Please have a look.
> > >
> >
> > I don't have that particular RTC so I can't test but the interrupt
> > handling in pcf8563_irq seems problematic too. I guess the RTC will only
> > trigger once per second because the call to pcf8563_set_alarm_mode will
> > explicitely leave the alarm enabled. The core doesn't really care but it
> > doesn't really expect the alarm to stay enabled. i.e. It will ensure the
> > alarm is enabled again after setting it when necessary. I think it would
> > be safer to simply clear both AIE and AF here. Could you test?
> 
> Yeah, that bit looked weird to me as well. And actually the alarm doesn't
> go down to the second, only the minute.
> 
> Is there a test program I can use to test the alarms?
> 

Sure, tools/testing/selftests/rtc/rtctest.c if you use a recent enough
version, it will test minute boundaries.


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
