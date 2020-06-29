Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED07C20E72D
	for <lists+linux-rtc@lfdr.de>; Tue, 30 Jun 2020 00:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404387AbgF2Vyu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 29 Jun 2020 17:54:50 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:37673 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728939AbgF2Vye (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 29 Jun 2020 17:54:34 -0400
X-Originating-IP: 86.202.110.81
Received: from localhost (lfbn-lyo-1-15-81.w86-202.abo.wanadoo.fr [86.202.110.81])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id DFCF220002;
        Mon, 29 Jun 2020 21:54:31 +0000 (UTC)
Date:   Mon, 29 Jun 2020 23:54:31 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Martin =?iso-8859-1?Q?Hundeb=F8ll?= <martin@geanix.com>
Cc:     linux-rtc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Sean =?iso-8859-1?Q?Nyekj=E6r?= <sean@geanix.com>
Subject: Re: [RFC] rtc: class: register for late suspend / early resume
Message-ID: <20200629215431.GA3800@piout.net>
References: <20200610132403.2539519-1-martin@geanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200610132403.2539519-1-martin@geanix.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 10/06/2020 15:24:03+0200, Martin Hundebøll wrote:
> When running on hardware with no persistent clock, and no non-stop
> clocksource, the timekeeping resume code relies on the rtc class to
> inject the suspend time.
> 
> Other drivers might call into the timekeeping code to sync time in their
> devices. If such devices are resumed before the rtc class (and rtc is
> the only time source running in suspend) they currently get the
> pre-suspend time.
> 
> Move the rtc class suspend/resume functions to be called late/early in
> the cycle to make sure timekeeping is synchronised when other devices
> are resumed.
> 
> This works in our case on an i.MX6, where the rtc driver only has
> _suspend_noirq()/_resume_noirq(). I imagine it fails with drivers that
> has regular _suspend()/_resume() functions. Any hints are welcome.
> 

Just to let you know that I've seen the previous thread and also this
patch. I'm not sure about the patch, especially regarding RTCs on an i2c
or SPI bus were wee need the bus to be suspended after the RTC and
resumed before the RTC. The order is properly handled when using
but I need to check whether it is correct when using _late. I remember
having issues with that with regulators.

I must admit my time is a bit scarce right now. Maybe you can get input
from the PM guys?

Regards,

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
