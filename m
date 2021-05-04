Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C16D372CFF
	for <lists+linux-rtc@lfdr.de>; Tue,  4 May 2021 17:34:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230334AbhEDPe5 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 May 2021 11:34:57 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:54805 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhEDPe5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 May 2021 11:34:57 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 2AB0A1C0007;
        Tue,  4 May 2021 15:33:59 +0000 (UTC)
Date:   Tue, 4 May 2021 17:33:59 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Samuel Holland <samuel@sholland.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Message-ID: <YJFpZzm07ZX3aYsK@piout.net>
References: <20210419014549.26900-1-samuel@sholland.org>
 <20210430090206.lybmygrt636nysoc@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210430090206.lybmygrt636nysoc@gilmour>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 30/04/2021 11:02:06+0200, Maxime Ripard wrote:
> Hi,
> 
> On Sun, Apr 18, 2021 at 08:45:49PM -0500, Samuel Holland wrote:
> > The sun6i RTC provides 32 bytes of general-purpose data registers.
> > They can be used to save data in the always-on RTC power domain.
> > The registers are writable via 32-bit MMIO accesses only.
> > 
> > Expose the region as a NVMEM provider so it can be used by userspace and
> > other drivers.
> > 
> > Signed-off-by: Samuel Holland <samuel@sholland.org>
> 
> As far as I understood, you want to use those registers to implement
> super-standby? If so, while it makes sense for the kernel to be able to
> be able to write to those registers, I guess it would be a bit unwise to
> allow the userspace to access it?

I would think nvmem is still the proper subsystem. I guess maybe we
should have a version of __nvmem_device_get that would ensure exclusive
access to a cell, thus preventing userspace accessing it as long a the
kernel is using it.

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
