Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12F6B1EE908
	for <lists+linux-rtc@lfdr.de>; Thu,  4 Jun 2020 19:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729925AbgFDRBK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 4 Jun 2020 13:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729907AbgFDRBK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 4 Jun 2020 13:01:10 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05E26C08C5C0;
        Thu,  4 Jun 2020 10:01:09 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id bg4so2435209plb.3;
        Thu, 04 Jun 2020 10:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=APr1c63yMB00bntd9u0Oxg5hC4qT0S7BCgh01Muh2aY=;
        b=O3MH17LyPnMyb7sHeYcslLOYF7wsDvUAEBlNco3jOwD/3lVvqCSzNJrkVa6VxOi85W
         oqES2f88fwj9E6dW8lC6VuPkrjpl2NLspzDkeyl58Jj79vAjlRrbSXVzJROJ7iJ4g33t
         RVzQ8oJmi9yVeUfmWmQBUlufMhsf47cEhkMUzJE6np68aJD/hUX2OvZ6D2fk4p/NuOKW
         KE2tqTf8pnwiXALW7AR4CeOUPO/ruw9ZPNj3PCADgQ1Ix38jt/A4tHid0kbzqRF5tTKu
         IthiZ149ItvUtCsnVhm1bQ6QmkTHBLw0iqpRgSXD7YpQYlRMyFU7Vy+KOQG2T0q4nCQq
         nGbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=APr1c63yMB00bntd9u0Oxg5hC4qT0S7BCgh01Muh2aY=;
        b=IasYgz3L/724yRlMbdStr6pCV3AG05GrAMIAo7a3RG2tIS+s0Z0PoMv1Opw1crBAAr
         w5+ROpHxp1VVvaPv37mHg+eRYt2ZpXmqCJWrTiRz2hw0TCfYswaXBtEcndBSYMB1N151
         Av6N3mHkfXbqP+Ws4bKH7ar0LfDlKUPRPaXtnDQHoW7j0hfBMpnPoBdDGBQZZScmcfHX
         GOaY/2eQtrML7qbzqj5L+tdUeP781xtGZNFfQKgaJ8scbliIK9Z0mVWsUh5ra8sYTeS5
         IfzKo59lALHHBCqhiMNO7tTW6QepchXnA6CW4jhF50I+K+g7AUnnJNCK1+xtMGK8Ukd1
         JoPA==
X-Gm-Message-State: AOAM530vBC8CDFEPSBXFdMr13If/s1VO8a+LHXKGTRsdz/TNiefoUvhz
        KWqq3frVJTA0etxKuGsT3kjFKAyY
X-Google-Smtp-Source: ABdhPJwCJ5clmX2jl7zg/KBRzcXMZU8E2He1CRlXqRcYVoQHut8qTfGPumlfcGAIPbFlDc19EnvpoQ==
X-Received: by 2002:a17:902:c082:: with SMTP id j2mr5928765pld.268.1591290069319;
        Thu, 04 Jun 2020 10:01:09 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 73sm4538481pge.15.2020.06.04.10.01.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 10:01:08 -0700 (PDT)
Date:   Thu, 4 Jun 2020 10:01:07 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Bruno Thomsen <bruno.thomsen@gmail.com>
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        martin@geanix.com, bth@kamstrup.com
Subject: Re: [PATCH] rtc: pcf2127: watchdog: handle nowayout feature
Message-ID: <20200604170106.GA99753@roeck-us.net>
References: <20200604162602.76524-1-bruno.thomsen@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604162602.76524-1-bruno.thomsen@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Thu, Jun 04, 2020 at 06:26:02PM +0200, Bruno Thomsen wrote:
> Driver does not use module parameter for nowayout, so it need to
> statically initialize status variable of the watchdog_device based
> on CONFIG_WATCHDOG_NOWAYOUT.
> 
> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/rtc/rtc-pcf2127.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 4e50d6768f13..0f7d0a9a2d18 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -441,6 +441,7 @@ static int pcf2127_probe(struct device *dev, struct regmap *regmap,
>  	pcf2127->wdd.max_timeout = PCF2127_WD_VAL_MAX;
>  	pcf2127->wdd.timeout = PCF2127_WD_VAL_DEFAULT;
>  	pcf2127->wdd.min_hw_heartbeat_ms = 500;
> +	pcf2127->wdd.status = WATCHDOG_NOWAYOUT_INIT_STATUS;
>  
>  	watchdog_set_drvdata(&pcf2127->wdd, pcf2127);
>  
> -- 
> 2.26.2
> 
