Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F78F1C16CF
	for <lists+linux-rtc@lfdr.de>; Fri,  1 May 2020 16:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731447AbgEANxR (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 1 May 2020 09:53:17 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:60231 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729727AbgEANxN (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 1 May 2020 09:53:13 -0400
X-Originating-IP: 86.202.105.35
Received: from localhost (lfbn-lyo-1-9-35.w86-202.abo.wanadoo.fr [86.202.105.35])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 3553820003;
        Fri,  1 May 2020 13:53:10 +0000 (UTC)
Date:   Fri, 1 May 2020 15:53:09 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        "open list:REAL TIME CLOCK (RTC) SUBSYSTEM" 
        <linux-rtc@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: mfd: Document the RTC present on
 MAX77620
Message-ID: <20200501135309.GC51277@piout.net>
References: <20200417170825.2551367-1-thierry.reding@gmail.com>
 <20200430140701.GA21776@bogus>
 <20200430141520.GA101194@piout.net>
 <CAL_Jsq+HzG8QT+kHUjqC8joDxfm1WM+N_F1ZwYXg7cL5faGxVA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+HzG8QT+kHUjqC8joDxfm1WM+N_F1ZwYXg7cL5faGxVA@mail.gmail.com>
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/05/2020 08:00:11-0500, Rob Herring wrote:
> > I don't think this is true because in the case of a discrete RTC, its
> > interrupt pin can be connected directly to a PMIC to power up a board
> > instead of being connected to the SoC. In that case we don't have an
> > interrupt property but the RTC is still a wakeup source. This is the
> > usual use case for wakeup-source in the RTC subsystem. Else, if there is
> > an interrupt, then we assume the RTC is a wakeup source and there is no
> > need to have the wakeup-source property.
> 
> Yes, that would be an example of "unless the wakeup mechanism is
> somehow not an interrupt". I guess I should add not an interrupt from
> the perspective of the OS.
> 
> So if the wakeup is self contained within the PMIC, why do we need a
> DT property? The capability is always there and enabling/disabling
> wakeup from it is userspace policy.
> 

Yes, for this particular case, I'm not sure wakeup-source is actually
necessary. If the interrupt line is used to wakeup the SoC, then the
presence of the interrupts property is enough to enable wakeup.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
