Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F141919F6A
	for <lists+linux-rtc@lfdr.de>; Fri, 10 May 2019 16:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbfEJOiT (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 10 May 2019 10:38:19 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:39797 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727262AbfEJOiT (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 10 May 2019 10:38:19 -0400
X-Originating-IP: 109.213.220.252
Received: from localhost (alyon-652-1-77-252.w109-213.abo.wanadoo.fr [109.213.220.252])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3ACD9FF809;
        Fri, 10 May 2019 14:38:17 +0000 (UTC)
Date:   Fri, 10 May 2019 16:38:16 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] RTC for 5.2
Message-ID: <20190510143816.GB7622@piout.net>
References: <20190509210340.GA23061@piout.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190509210340.GA23061@piout.net>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/05/2019 23:03:40+0200, Alexandre Belloni wrote:
> Hello Linus,
> 
> A huge series from me this cycle. I went through many drivers to set the
> date and time range supported by the RTC which helps solving HW
> limitation when the time comes (as early as next year for some). This
> time, I focused on drivers using .set_mms and .set_mmss64, allowing me
> to remove those callbacks. About a third of the patches got reviews, I
> actually own the RTCs and I tested another third and the remaining one
> are unlikely to cause any issues.
> 
> Other than that, a single new driver and the usual fixes here and there.
> 
> The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> 
>   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git tags/rtc-5.2
> 
> for you to fetch changes up to dacb6a4035a010e41abaf81c1cfe2beadfb05ec8:
> 
>   rtc: snvs: Use __maybe_unused instead of #if CONFIG_PM_SLEEP (2019-05-08 22:14:36 +0200)
> 

I forgot to mention that you will have a non trivial conflict that is
properly resolved in linux-next when you will pull arm-soc.

There is no need to check the return value of tm2bcd() after
35118b7a4ea0 ("rtc: omap: let the core handle range")


-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
