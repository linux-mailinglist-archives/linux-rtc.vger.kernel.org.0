Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2157210E0A
	for <lists+linux-rtc@lfdr.de>; Wed,  1 May 2019 22:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726096AbfEAUae (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 May 2019 16:30:34 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:60931 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfEAUae (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 May 2019 16:30:34 -0400
Received: from localhost (lfbn-1-3034-80.w90-66.abo.wanadoo.fr [90.66.53.80])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id BE03B240008;
        Wed,  1 May 2019 20:30:23 +0000 (UTC)
Date:   Wed, 1 May 2019 22:30:23 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Trent Piepho <tpiepho@impinj.com>
Cc:     "patrice.chotard@st.com" <patrice.chotard@st.com>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] rtc: st-lpc: remove unnecessary check
Message-ID: <20190501203023.GL11339@piout.net>
References: <20190430201834.12634-1-alexandre.belloni@bootlin.com>
 <1556663479.31309.36.camel@impinj.com>
 <20190501142513.GK11339@piout.net>
 <1556730703.31309.53.camel@impinj.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556730703.31309.53.camel@impinj.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/05/2019 17:11:44+0000, Trent Piepho wrote:
> > I can't believe you can possibly have more than one second between the
> > check in the core and the check in the driver, it doesn't make much
> > sense to check, even in the current state of the core.
> 
> It's certainly possible to have multiple seconds pass.  For an external
> device over SPI or I2C, one has to wait for the bus to become free. 
> And on SPI that requires the kernel thread running the bus to be 
> scheduled.  Just put in some real-time tasks and maybe a big transfer
> to a flash chip and it could be a while before that happens.
> 
> I don't think this device has that issue as I don't think it's
> external.  And ever for a device on an external bus, delays > 1 second
> are unlikely.  Possible, but unlikely.
> 
> You can also get them when Linux is running under a hypervisor, i.e. a
> Linux VM.  But also something like an NMI and ACPI BIOS.  If the Linux
> guest is not scheduled to run for while anything that is supposed to be
> based on real time, like the value returned by an RTC, will still
> advance.  It is possible that multiple seconds elapse from the guest
> CPU executing one instruction to the next.
> 
> But even ignoring that, does it require > 1 second to elapse.  Can't it
> happen when the clock ticks from one second to the next, which happens
> effectively instantly?
> 
> If the time from the check to the time when the alarm is set is 1
> microsecond, and the time this call to set the alarm is made is
> randomly done and not synchronized to the RTC, then isn't there a 1 out
> of 1 million chance (1 microsecond / 1 second), that the once per
> second clock tick will hit our 1 us window?

No, let's say you want Talarm == Tcurrent + 1, if the core check happens
right before the next second, then you necessarily end up with
Talarm == Tcurrent after the check. This means that you now have one
second before the time read in st-lpc to avoid the
alarm_secs -= now_secs; underflow.

Obviously, in that case, you are likely to miss the alarm but this is as
likely to happen with the check that is in the driver. This check
doesn't provide anything but a false sense of security.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
