Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1930F22E456
	for <lists+linux-rtc@lfdr.de>; Mon, 27 Jul 2020 05:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727987AbgG0DPp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 26 Jul 2020 23:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgG0DPo (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 26 Jul 2020 23:15:44 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 724B4C0619D2;
        Sun, 26 Jul 2020 20:15:44 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id m8so1415157pfh.3;
        Sun, 26 Jul 2020 20:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R2fUCpyoEpXcLqhIagFjvMuKuk/xhf3lv26ScKGnflM=;
        b=sM8bc/w11dDweOpJW9Qk53Fv8si9G2l7ygEVDrUgs/D7ZuCACvFsJy11hAPMYdpfOY
         EiPeW+9N/kkKISSeyZR3PiK4KSrqP296ijyOayoR2Tqmt56/CfSzD6C8aqLo+s0SyCFw
         tLsnR4/iOybUpCvPCUwWxtUZUB3fJHoIOTvbKtmY9RJOepnAMNwe42cwXpmWiunFdWnN
         DQ6Sm7ah3lJnh1uoxG79Y7s2K1ZEOHxPYLeE1cYP4arSQwXD/Opr21fZUr+Krad1etUG
         Bwqc0Ik+rV4XatMi5M3id29PnaJb8SjomEsN5MvjbbE7iG5goMDbJzO+9g19UdkLez4t
         X9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=R2fUCpyoEpXcLqhIagFjvMuKuk/xhf3lv26ScKGnflM=;
        b=YPTfWW+t819nYrF67X27mRmP8J3I5IYpAGngKN88vpMrb6JaEBzIuxMxu06H/n2jB6
         CeIYtTv5xYOqaqPZ2WQZAO1idGzPgFWfTiGblDfC1lzWHZWdp7ocFN/gfIQ8PIto01LK
         50EaLt9TQgSnVcdVnyd3xKVKot6rebhxb8vUCS6MvMJ8Y+40n/dcegtZNzaiz0BS221H
         DBiXBDSPdydGVPdtSIQ/BO3RZOUbtl8uaKYyXN93G6nBC2dMNix8pmty60YSHEQ0JoSQ
         +ACcxxgpqPb18DsVp5WkiGmO0BZmk8mrUnWRRvanhpw2sYkFnsrLAsmIV167sSv/nv2R
         BHJA==
X-Gm-Message-State: AOAM532gNP9J0bK51XN9S78Sd7vNdZu/7jNtSRK4yALE+crs7E8LWM5c
        K2mc8j4P5Pcsf9w+khH00cRLK/wC
X-Google-Smtp-Source: ABdhPJy5pIVT7e44QOu5P7YIYWfZ8mYz7zYUGCXQ5YrJJMwGU6eXzZQ8p4mIfMOcz8tENo/WOa+/rQ==
X-Received: by 2002:a62:e70c:: with SMTP id s12mr17509922pfh.98.1595819744044;
        Sun, 26 Jul 2020 20:15:44 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x24sm11693903pjr.53.2020.07.26.20.15.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Jul 2020 20:15:43 -0700 (PDT)
Date:   Sun, 26 Jul 2020 20:15:41 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rtc: ds1307: provide an indication that the watchdog
 has fired
Message-ID: <20200727031541.GA53573@roeck-us.net>
References: <20200726231306.734-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200726231306.734-1-chris.packham@alliedtelesis.co.nz>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, Jul 27, 2020 at 11:13:06AM +1200, Chris Packham wrote:
> There's not much feedback when the ds1388 watchdog fires. Generally it
> yanks on the reset line and the board reboots. Capture the fact that the
> watchdog has fired in the past so that userspace can retrieve it via
> WDIOC_GETBOOTSTATUS. This should help distinguish a watchdog triggered
> reset from a power interruption.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
> Changes in v2:
> - Set bootstatus to WDIOF_CARDRESET and let userspace decide what to do with
>   the information.
> 
>  drivers/rtc/rtc-ds1307.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
> index 49702942bb08..209736db510d 100644
> --- a/drivers/rtc/rtc-ds1307.c
> +++ b/drivers/rtc/rtc-ds1307.c
> @@ -868,6 +868,14 @@ static int ds1388_wdt_start(struct watchdog_device *wdt_dev)
>  	struct ds1307 *ds1307 = watchdog_get_drvdata(wdt_dev);
>  	u8 regs[2];
>  	int ret;
> +	int val;
> +
> +	ret = regmap_read(ds1307->regmap, DS1388_REG_FLAG, &val);
> +	if (ret)
> +		return ret;
> +
> +	if (val & DS1388_BIT_WF)
> +		wdt_dev->bootstatus = WDIOF_CARDRESET;

This should be done during probe, ie in ds1307_wdt_register().

Guenter

>  
>  	ret = regmap_update_bits(ds1307->regmap, DS1388_REG_FLAG,
>  				 DS1388_BIT_WF, 0);
> -- 
> 2.27.0
> 
