Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBEAB305CF4
	for <lists+linux-rtc@lfdr.de>; Wed, 27 Jan 2021 14:20:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238193AbhA0NUf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 27 Jan 2021 08:20:35 -0500
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:54043 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233033AbhA0NTS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 27 Jan 2021 08:19:18 -0500
X-Originating-IP: 86.202.109.140
Received: from localhost (lfbn-lyo-1-13-140.w86-202.abo.wanadoo.fr [86.202.109.140])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3F273FF802;
        Wed, 27 Jan 2021 13:18:22 +0000 (UTC)
Date:   Wed, 27 Jan 2021 14:18:21 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: rtc: pcf2127: update bindings
Message-ID: <20210127131821.GH1196852@piout.net>
References: <20201219013418.3474461-1-alexandre.belloni@bootlin.com>
 <c5290432-a6b0-2b96-585f-3abc2dcc56f6@prevas.dk>
 <20210126224835.GE1196852@piout.net>
 <0a8fd7f3-58c1-9e20-bcfa-9872b3dc3550@prevas.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a8fd7f3-58c1-9e20-bcfa-9872b3dc3550@prevas.dk>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 27/01/2021 14:07:59+0100, Rasmus Villemoes wrote:
> On 26/01/2021 23.48, Alexandre Belloni wrote:
> > On 21/12/2020 22:17:54+0100, Rasmus Villemoes wrote:
> >> On 19/12/2020 02.34, Alexandre Belloni wrote:
> >>> pcf2127, pcf2129 and pca2129 support start-year and reset-source.
> >>>
> >>
> >> No, the 2129 variant doesn't even have a reset output pin. Not sure if
> >> there's any way to reflect that, and it probably doesn't matter, since
> >> nobody's going to add the reset-source property to a 2129 node. But the
> >> commit message is a bit misleading.
> >>
> > 
> > Actually no, the INT pin can be used as a reset, the pcf/pca2129
> > can be used as a watchdog and so it may need the reset-source property.
> 
> Unless I'm missing something, that would require some rather creative
> extra circuitry: The interrupt pin is kept low until the appropriate bit
> in the rtc is cleared, so if that is routed directly to a reset pin on
> the SOC, the SOC would be kept in reset indefinitely.
> 

You mean inverting the level of INT? I don't think this is creative or
complicated...
And anyway, INT# is active low, like RST# so if the SoC has an RST#
input, this should just work.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
