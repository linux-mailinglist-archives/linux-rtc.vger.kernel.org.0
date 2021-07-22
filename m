Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 580AD3D301D
	for <lists+linux-rtc@lfdr.de>; Fri, 23 Jul 2021 01:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232425AbhGVWhZ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 22 Jul 2021 18:37:25 -0400
Received: from foss.arm.com ([217.140.110.172]:35088 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232024AbhGVWhZ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Thu, 22 Jul 2021 18:37:25 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E767106F;
        Thu, 22 Jul 2021 16:17:59 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5BC713F694;
        Thu, 22 Jul 2021 16:17:57 -0700 (PDT)
Date:   Fri, 23 Jul 2021 00:17:21 +0100
From:   Andre Przywara <andre.przywara@arm.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh@kernel.org>, Icenowy Zheng <icenowy@aosc.io>,
        Samuel Holland <samuel@sholland.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
        Ondrej Jirman <megous@megous.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v7 06/19] rtc: sun6i: Add support for RTCs without
 external LOSCs
Message-ID: <20210723001721.0bb02cf2@slackpad.fritz.box>
In-Reply-To: <20210616091431.6tm3zdf77p2x3upc@gilmour>
References: <20210615110636.23403-1-andre.przywara@arm.com>
        <20210615110636.23403-7-andre.przywara@arm.com>
        <20210616091431.6tm3zdf77p2x3upc@gilmour>
Organization: Arm Ltd.
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Wed, 16 Jun 2021 11:14:31 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

Hi Maxime,

> On Tue, Jun 15, 2021 at 12:06:23PM +0100, Andre Przywara wrote:
> > Some newer Allwinner RTCs (for instance the one in the H616 SoC) lack
> > a pin for an external 32768 Hz oscillator. As a consequence, this LOSC
> > can't be selected as the RTC clock source, and we must rely on the
> > internal RC oscillator.
> > To allow additions of clocks to the RTC node, add a feature bit to ignore
> > any provided clocks for now (the current code would think this is the
> > external LOSC). Later DTs and code can then for instance add the PLL
> > based clock input, and older kernel won't get confused.
> > 
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>  
> 
> Honestly, I don't really know if it's worth it at this point.
> 
> If we sums this up:
> 
>  - The RTC has 2 features that we use, mostly centered around 2
>    registers set plus a global one
> 
>  - Those 2 features are programmed in a completely different way
> 
>  - Even the common part is different, given the discussion around the
>    clocks that we have.
> 
> What is there to share in that driver aside from the probe, and maybe
> the interrupt handling? Instead of complicating this further with more
> special case that you were (rightfully) complaining about, shouldn't we
> just acknowledge the fact that it's a completely separate design and
> should be treated as such, with a completely separate driver?

So I had a look, and I don't think it justifies a separate driver:
- Indeed it looks like the core functionality is different, but there
  are a lot of commonalities, with all the RTC and driver boilerplate,
  register offsets, and also the special access pattern (rtc_wait and
  rtc_setaie).
- The actual difference is really in the way the *date* is stored
  (the time is still in 24h H/M/S format), and the missing LOSC input
  clock - which is already optional for existing devices. The two
  patches just make this obvious, by using if() statements at the parts
  where they differ.

So we would end up with possibly some shared .c file, and two driver
front-end files, which I am not sure is really worth it.

Next I thought about providing separate rtc_class_ops, but even they
share a lot of code, so they would be possibly be calling a shared
function each. I don't think that is really better.

If you dislike the rather large if/else branches in the previous two
patches, I could move that out into separate functions, but I feel this
is more code, for no real benefit.

So for now I am tempted to keep it shared. I think Samuel had ideas for
bigger changes in the clock part, at which point we could revisit this
decision - for instance keep the RTC part (still quite similar) mostly
in a shared file, while modelling the clocks in separate files - in a
more "common clock" style for the new SoCs.

Feel free to disagree, but when I tried to actually separate the drivers
it just felt wrong.

Cheers,
Andre
