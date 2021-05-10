Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA5A377D94
	for <lists+linux-rtc@lfdr.de>; Mon, 10 May 2021 10:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhEJIB6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 10 May 2021 04:01:58 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:55257 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbhEJIBz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 10 May 2021 04:01:55 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 3890C240006;
        Mon, 10 May 2021 08:00:46 +0000 (UTC)
Date:   Mon, 10 May 2021 10:00:46 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: sun6i: Add NVMEM provider
Message-ID: <YJjoLuwTSbZlNCPa@piout.net>
References: <20210419014549.26900-1-samuel@sholland.org>
 <20210430090206.lybmygrt636nysoc@gilmour>
 <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a3b03a06-c8fc-7dbe-7c0b-ffd1f194ecbc@sholland.org>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/05/2021 22:39:30-0500, Samuel Holland wrote:
> On 4/30/21 4:02 AM, Maxime Ripard wrote:
> > Hi,
> > 
> > On Sun, Apr 18, 2021 at 08:45:49PM -0500, Samuel Holland wrote:
> >> The sun6i RTC provides 32 bytes of general-purpose data registers.
> >> They can be used to save data in the always-on RTC power domain.
> >> The registers are writable via 32-bit MMIO accesses only.
> >>
> >> Expose the region as a NVMEM provider so it can be used by userspace and
> >> other drivers.
> >>
> >> Signed-off-by: Samuel Holland <samuel@sholland.org>
> > 
> > As far as I understood, you want to use those registers to implement
> > super-standby? If so, while it makes sense for the kernel to be able to
> > be able to write to those registers, I guess it would be a bit unwise to
> > allow the userspace to access it?
> 
> I want the user to be able to pass information to the bootloader (to
> select a boot device, e.g. reboot to FEL). I also want the user to be
> able to read data stored to these registers by system firmware (e.g.
> crust writes exception information there). It's not really related to
> standby.
> 
> I would want to stack a nvmem-reboot-mode on top to give friendlier
> names to some of the numbers, but I don't see a problem with root having
> direct access to the registers. It's no different from /dev/nvram
> providing access to the PC CMOS RAM.
> 

(which is deprecated in favor of nvmem)


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
