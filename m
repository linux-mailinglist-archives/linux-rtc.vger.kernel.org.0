Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD771CDD26
	for <lists+linux-rtc@lfdr.de>; Mon, 11 May 2020 16:28:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727792AbgEKO2x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 May 2020 10:28:53 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:60007 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgEKO2w (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 May 2020 10:28:52 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2B6EAFF806;
        Mon, 11 May 2020 14:28:50 +0000 (UTC)
Date:   Mon, 11 May 2020 16:28:49 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Rob Herring <robh@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on
 MAX77620
Message-ID: <20200511142849.GT34497@piout.net>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200430140701.GA21776@bogus>
 <20200430141520.GA101194@piout.net>
 <CAL_Jsq+HzG8QT+kHUjqC8joDxfm1WM+N_F1ZwYXg7cL5faGxVA@mail.gmail.com>
 <20200501135309.GC51277@piout.net>
 <20200508110226.GA3034719@ulmo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508110226.GA3034719@ulmo>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 08/05/2020 13:02:26+0200, Thierry Reding wrote:
> On Fri, May 01, 2020 at 03:53:09PM +0200, Alexandre Belloni wrote:
> > On 01/05/2020 08:00:11-0500, Rob Herring wrote:
> > > > I don't think this is true because in the case of a discrete RTC, its
> > > > interrupt pin can be connected directly to a PMIC to power up a board
> > > > instead of being connected to the SoC. In that case we don't have an
> > > > interrupt property but the RTC is still a wakeup source. This is the
> > > > usual use case for wakeup-source in the RTC subsystem. Else, if there is
> > > > an interrupt, then we assume the RTC is a wakeup source and there is no
> > > > need to have the wakeup-source property.
> > > 
> > > Yes, that would be an example of "unless the wakeup mechanism is
> > > somehow not an interrupt". I guess I should add not an interrupt from
> > > the perspective of the OS.
> > > 
> > > So if the wakeup is self contained within the PMIC, why do we need a
> > > DT property? The capability is always there and enabling/disabling
> > > wakeup from it is userspace policy.
> > > 
> > 
> > Yes, for this particular case, I'm not sure wakeup-source is actually
> > necessary. If the interrupt line is used to wakeup the SoC, then the
> > presence of the interrupts property is enough to enable wakeup.
> 
> So yes, the wakeup-source property isn't necessary. The goal of patches
> 1 and 2 was to allow the RTC to be actually disabled as a wakeup-source
> in case it didn't work as intended. But since the RTC is enabled as a
> wakeup source on these PMICs by default, the idea was to add a new sub-
> node for the RTC and required the wakeup-source in that subnode if that
> subnode was present.
> 
> That said, patch 3 actually does make the RTC work as a wakeup source
> on the particular board that I tested this, so patches 1 and 2 are no
> longer really required from my point of view.
> 
> Do you want me to send patch 3/3 again separately or can you pick it up
> from this series?
> 

I applied it.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
