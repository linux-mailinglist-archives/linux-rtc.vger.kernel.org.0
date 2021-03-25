Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2656D348BCE
	for <lists+linux-rtc@lfdr.de>; Thu, 25 Mar 2021 09:46:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhCYIpt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 25 Mar 2021 04:45:49 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:59857 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhCYIpX (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 25 Mar 2021 04:45:23 -0400
X-Originating-IP: 90.65.108.55
Received: from localhost (lfbn-lyo-1-1676-55.w90-65.abo.wanadoo.fr [90.65.108.55])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 821681BF20C;
        Thu, 25 Mar 2021 08:45:19 +0000 (UTC)
Date:   Thu, 25 Mar 2021 09:45:17 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     "heying (H)" <heying24@huawei.com>
Cc:     mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
        a.zummo@towertech.it, christophe.leroy@csgroup.eu,
        npiggin@gmail.com, msuchanek@suse.de, tglx@linutronix.de,
        peterz@infradead.org, geert@linux-m68k.org,
        geert+renesas@glider.be, kernelfans@gmail.com, frederic@kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH V3 -next] powerpc: kernel/time.c - cleanup warnings
Message-ID: <YFxNneWEFO4m5Glt@piout.net>
References: <20210324090939.143477-1-heying24@huawei.com>
 <YFsGYgdNH5HrlqDJ@piout.net>
 <18a8d444-f1a5-61e0-b9f2-f85c03d71686@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <18a8d444-f1a5-61e0-b9f2-f85c03d71686@huawei.com>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/03/2021 17:46:19+0800, heying (H) wrote:
> Many thanks for your suggestion. As you suggest, rtc_lock should be local to
> platforms.
> 
> Does it mean not only powerpc but also all other platforms should adapt this
> change?

Not all the other ones, in the current state, x86 still needs it. I'll
work on that. Again, the patch is fine as is.

Reviewed-by: Alexandre Belloni <alexandre.belloni@bootlin.com>



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
