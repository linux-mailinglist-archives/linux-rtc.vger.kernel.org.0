Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB3AD55C220
	for <lists+linux-rtc@lfdr.de>; Tue, 28 Jun 2022 14:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343693AbiF1HFq (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 28 Jun 2022 03:05:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343608AbiF1HFq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 28 Jun 2022 03:05:46 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46CA4615D
        for <linux-rtc@vger.kernel.org>; Tue, 28 Jun 2022 00:05:45 -0700 (PDT)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1o65I5-0006Yz-FM; Tue, 28 Jun 2022 09:05:41 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1o65I4-0003wr-3l; Tue, 28 Jun 2022 09:05:40 +0200
Date:   Tue, 28 Jun 2022 09:05:40 +0200
From:   Sascha Hauer <s.hauer@pengutronix.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] rtc: rv8803: unlock on error path in rv8803_set_time()
Message-ID: <20220628070540.GI19026@pengutronix.de>
References: <YrqmpT873Y99+a2d@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrqmpT873Y99+a2d@kili>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-rtc@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi Dan,

On Tue, Jun 28, 2022 at 09:58:45AM +0300, Dan Carpenter wrote:
> Call mutex_unlock(&rv8803->flags_lock) before returning if
> rv8803_regs_reset() fails.
> 
> Fixes: f8176e0bb83f ("rtc: rv8803: initialize registers on post-probe voltage loss")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/rtc/rtc-rv8803.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

A fix for this is already posted here:

https://lore.kernel.org/lkml/20220627080822.3881072-1-yangyingliang@huawei.com/

Sascha

> 
> diff --git a/drivers/rtc/rtc-rv8803.c b/drivers/rtc/rtc-rv8803.c
> index fe1247e771b9..3527a0521e9b 100644
> --- a/drivers/rtc/rtc-rv8803.c
> +++ b/drivers/rtc/rtc-rv8803.c
> @@ -315,8 +315,10 @@ static int rv8803_set_time(struct device *dev, struct rtc_time *tm)
>  
>  	if (flags & RV8803_FLAG_V2F) {
>  		ret = rv8803_regs_reset(rv8803);
> -		if (ret)
> +		if (ret) {
> +			mutex_unlock(&rv8803->flags_lock);
>  			return ret;
> +		}
>  	}
>  
>  	ret = rv8803_write_reg(rv8803->client, RV8803_FLAG,
> -- 
> 2.35.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
