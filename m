Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 210C676BD99
	for <lists+linux-rtc@lfdr.de>; Tue,  1 Aug 2023 21:22:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbjHATWh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 1 Aug 2023 15:22:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbjHATWg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 1 Aug 2023 15:22:36 -0400
Received: from mail.hugovil.com (mail.hugovil.com [162.243.120.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836D51BF5;
        Tue,  1 Aug 2023 12:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
        ; s=x; h=Subject:Content-Transfer-Encoding:Content-Type:Mime-Version:
        References:In-Reply-To:Message-Id:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=5OWat7qcCx9U5uBJcxHyqk9wkymg+2TtyEz8tedgglc=; b=HnbGGG+zF2vK5nFaKm+4BC4JwB
        jOJQK35XtS5vn5IupZpHE+ATTSkYhOnjeDFn1Kxc7xziSdthgGL65WIJbtcVLITSEsbVljTwiarSJ
        +wkJ4hInbv8/MrXZpy060zMqK2TvAvtWioJqKzM1jDgJJ8doVg4pjNIcRs/ETOTt3dkY=;
Received: from modemcable061.19-161-184.mc.videotron.ca ([184.161.19.61]:33908 helo=pettiford)
        by mail.hugovil.com with esmtpa (Exim 4.92)
        (envelope-from <hugo@hugovil.com>)
        id 1qQuwx-0001Zc-KH; Tue, 01 Aug 2023 15:22:32 -0400
Date:   Tue, 1 Aug 2023 15:22:31 -0400
From:   Hugo Villeneuve <hugo@hugovil.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-rtc@vger.kernel.org, kernel-janitors@vger.kernel.org
Message-Id: <20230801152231.bdf746e985c8c44209d28bf7@hugovil.com>
In-Reply-To: <55b9c84b-9d21-444f-b91a-cf9316b65833@moroto.mountain>
References: <55b9c84b-9d21-444f-b91a-cf9316b65833@moroto.mountain>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 184.161.19.61
X-SA-Exim-Mail-From: hugo@hugovil.com
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
Subject: Re: [PATCH] rtc: pcf2127: fix error code in pcf2127_enable_ts()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On Mon, 31 Jul 2023 17:09:30 +0300
Dan Carpenter <dan.carpenter@linaro.org> wrote:

> This error path accidentally returns success.  Return -EINVAL instead.
> 
> Fixes: 420cc9e850db ("rtc: pcf2127: add support for multiple TS functions")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> From static analysis.  Not tested.
> 
>  drivers/rtc/rtc-pcf2127.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/rtc/rtc-pcf2127.c b/drivers/rtc/rtc-pcf2127.c
> index 78141bb06ab0..988cad171174 100644
> --- a/drivers/rtc/rtc-pcf2127.c
> +++ b/drivers/rtc/rtc-pcf2127.c
> @@ -1060,7 +1060,7 @@ static int pcf2127_enable_ts(struct device *dev, int ts_id)
>  	if (pcf2127->cfg->ts[ts_id].gnd_detect_bit == 0) {
>  		dev_err(dev, "%s: tamper detection to GND configuration invalid\n",
>  			__func__);
> -		return ret;
> +		return -EINVAL;
>  	}
>  
>  	/*
> -- 
> 2.39.2
 
Reviewed-by: Hugo Villeneuve <hugo@hugovil.com>
