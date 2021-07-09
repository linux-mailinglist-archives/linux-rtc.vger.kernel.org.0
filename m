Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34B463C2BDD
	for <lists+linux-rtc@lfdr.de>; Sat, 10 Jul 2021 01:51:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhGIXyS (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 9 Jul 2021 19:54:18 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:55881 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230168AbhGIXyR (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 9 Jul 2021 19:54:17 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 6060E240003;
        Fri,  9 Jul 2021 23:51:31 +0000 (UTC)
Date:   Sat, 10 Jul 2021 01:51:31 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 09/10] rtc: starfire: convert to SPDX identifier
Message-ID: <YOjhAxjZJ5upFK9T@piout.net>
References: <20210707075804.337458-1-nobuhiro1.iwamatsu@toshiba.co.jp>
 <20210707075804.337458-10-nobuhiro1.iwamatsu@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707075804.337458-10-nobuhiro1.iwamatsu@toshiba.co.jp>
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hello,

On 07/07/2021 16:58:03+0900, Nobuhiro Iwamatsu wrote:
> Use SPDX-License-Identifier instead of a license line.
> 
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
>  drivers/rtc/rtc-starfire.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-starfire.c b/drivers/rtc/rtc-starfire.c
> index fbd1ed41cbf1..ccaef051d6e6 100644
> --- a/drivers/rtc/rtc-starfire.c
> +++ b/drivers/rtc/rtc-starfire.c
> @@ -1,7 +1,7 @@
> +// SPDX-License-Identifier: GPL-2.0-only
>  /* rtc-starfire.c: Starfire platform RTC driver.
>   *
>   * Author: David S. Miller
> - * License: GPL

I would argue this is not GPL-2.0-only. Dave, what was your initial
intention?

>   *
>   * Copyright (C) 2008 David S. Miller <davem@davemloft.net>
>   */
> -- 
> 2.32.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
