Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308CF3A9706
	for <lists+linux-rtc@lfdr.de>; Wed, 16 Jun 2021 12:15:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231638AbhFPKRQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 16 Jun 2021 06:17:16 -0400
Received: from foss.arm.com ([217.140.110.172]:32874 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231452AbhFPKRQ (ORCPT <rfc822;linux-rtc@vger.kernel.org>);
        Wed, 16 Jun 2021 06:17:16 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 334CD1042;
        Wed, 16 Jun 2021 03:15:10 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5423F3F70D;
        Wed, 16 Jun 2021 03:15:08 -0700 (PDT)
Date:   Wed, 16 Jun 2021 11:14:52 +0100
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
Message-ID: <20210616111452.1d7f2423@slackpad.fritz.box>
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

Hi,

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

If you mean to have a separate clock driver, and one RTC driver: I
agree, and IIUC Samuel has a prototype, covering the H6 and D1 as well:
https://github.com/smaeul/linux/commit/6f8f761db1d8dd4b6abf006fb7e2427da79321c2

The only problem I see that they are sharing MMIO registers. Maybe it
works because the RTC part never touches anything below 0x10, and the
clock part just needs the first four registers?
But this means we can't easily change this for the H6, as the
existing H6 RTC code adds 0x10 to the MMIO base, and also old DTs will
have the RTC base address in their RTC reg property.

If we can somehow solve this (let the clock driver point to the RTC
node to get a regmap?) I am all in, for the reasons you mentioned.

Cheers,
Andre
