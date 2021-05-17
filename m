Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696CE383A3B
	for <lists+linux-rtc@lfdr.de>; Mon, 17 May 2021 18:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239204AbhEQQn0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 May 2021 12:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241445AbhEQQnF (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 May 2021 12:43:05 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61211C0ADEE2;
        Mon, 17 May 2021 08:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=C5HVt+49d+RVG/0UPKvULX99MaS5D0NU75IY07ck7wY=; b=hP7kp2Wr/fC8z11JVHDrCo6/oO
        GjaBVoIcEhZowZioJkSHn6cIjYjwhgE2gATluTFYA5lCwRksosTfEsYeYj93AZwlPX5wrW4MqLuMP
        oCa4CLabQ13ptyjeUoz4WKLBemZqinhz09sDbE6cHx3qRD6BBADmtx1XKFil13w5DmX1dGebu53dM
        RWt4zoMYcD7GkJ9I+s3yXji2WORNO8KQQZkRTtUd/zJbKtn1QEiN7LyFpgvsNbOeyMMJQJCYHurX6
        rGIhUBuVFrNw2YATuKoZvQz0Qrx2SEpwW7kRzWALkdkE9sMIkM6xPaA7V6tXTxZSk1v5PjLGKyack
        NCvinUgA==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lifXB-00Dwtk-NU; Mon, 17 May 2021 15:51:57 +0000
Subject: Re: [PATCH -next resend] rtc: m41t80: correct function names in
 rtc-m41t80.c
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
References: <20210517110641.473386-1-yangyingliang@huawei.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <d14f782a-0245-81c3-3c05-73671e670220@infradead.org>
Date:   Mon, 17 May 2021 08:51:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210517110641.473386-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 5/17/21 4:06 AM, Yang Yingliang wrote:
> Fix the following make W=1 kernel build warnings:
> 
>   drivers/rtc/rtc-m41t80.c:811: warning: expecting prototype for wdt_close(). Prototype was for wdt_release() instead
>   drivers/rtc/rtc-m41t80.c:830: warning: expecting prototype for notify_sys(). Prototype was for wdt_notify_sys() instead
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/rtc/rtc-m41t80.c | 20 ++++++++------------
>  1 file changed, 8 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 89128fc29ccc..269ec4962db3 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

thanks.

-- 
~Randy

