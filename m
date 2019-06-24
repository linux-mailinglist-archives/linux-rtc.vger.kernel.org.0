Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B135351BCB
	for <lists+linux-rtc@lfdr.de>; Mon, 24 Jun 2019 21:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbfFXT5O (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 24 Jun 2019 15:57:14 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:48617 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727282AbfFXT5N (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 24 Jun 2019 15:57:13 -0400
Received: from localhost (lfbn-1-1545-137.w90-65.abo.wanadoo.fr [90.65.161.137])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 874FF240005;
        Mon, 24 Jun 2019 19:57:05 +0000 (UTC)
Date:   Mon, 24 Jun 2019 21:57:05 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Finn Thain <fthain@telegraphics.com.au>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: Don't state that the RTC holds UTC in case it
 doesn't
Message-ID: <20190624195705.GD5690@piout.net>
References: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e1e24a326b8b623b1a8b66a905ac6494ef74a07.1561081886.git.fthain@telegraphics.com.au>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 21/06/2019 11:51:26+1000, Finn Thain wrote:
> Some machines store local time in the Real Time Clock. The hard-coded
> "UTC" string is wrong on those machines so just omit that string.
> Update the log parser so it doesn't require the string "UTC".
> 

I don't agree, hctossys will always think the RTC is in UTC. If you
store local time in the RTC, then you are probably not using hctosys
because it definitively doesn't know about the timezone and will
incorrectly set the system time. That information is usually kept in
/etc/adjtime.

> Signed-off-by: Finn Thain <fthain@telegraphics.com.au>
> ---
>  drivers/rtc/hctosys.c             | 2 +-
>  tools/power/pm-graph/bootgraph.py | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/hctosys.c b/drivers/rtc/hctosys.c
> index ff2092a0d38c..2270eca23203 100644
> --- a/drivers/rtc/hctosys.c
> +++ b/drivers/rtc/hctosys.c
> @@ -58,7 +58,7 @@ static int __init rtc_hctosys(void)
>  
>  	err = do_settimeofday64(&tv64);
>  
> -	dev_info(rtc->dev.parent, "setting system clock to %ptR UTC (%lld)\n",
> +	dev_info(rtc->dev.parent, "setting system clock to %ptR (%lld)\n",
>  		 &tm, (long long)tv64.tv_sec);
>  
>  err_read:
> diff --git a/tools/power/pm-graph/bootgraph.py b/tools/power/pm-graph/bootgraph.py
> index 6dae57041537..5a045d1cb879 100755
> --- a/tools/power/pm-graph/bootgraph.py
> +++ b/tools/power/pm-graph/bootgraph.py
> @@ -333,7 +333,7 @@ def parseKernelLog():
>  			if(not sysvals.stamp['kernel']):
>  				sysvals.stamp['kernel'] = sysvals.kernelVersion(msg)
>  			continue
> -		m = re.match('.* setting system clock to (?P<t>.*) UTC.*', msg)
> +		m = re.match('.* setting system clock to (?P<t>.*) (?:UTC )?\(.*', msg)
>  		if(m):
>  			bt = datetime.strptime(m.group('t'), '%Y-%m-%d %H:%M:%S')
>  			bt = bt - timedelta(seconds=int(ktime))
> -- 
> 2.21.0
> 

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
