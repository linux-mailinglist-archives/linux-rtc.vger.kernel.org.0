Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE9DE3823A3
	for <lists+linux-rtc@lfdr.de>; Mon, 17 May 2021 07:07:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233826AbhEQFIw (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 17 May 2021 01:08:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbhEQFIw (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 17 May 2021 01:08:52 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDFD1C061573;
        Sun, 16 May 2021 22:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=L+FK+jU/P7UyfqWMjF5PsAH9YRlPbqZxb6mrYNfGR4k=; b=DyBNqxMhp9ArDZldpbaebU3xZz
        O+B88CsCQR4wQqVU8wwAmrH+DZrA/1p6u1lbDEufD+WGhM19OyDVEeFijxLY33dXLzWyi1u52e3ur
        hBHwvBkRgj52uwxu4ZTKIEwy/2LkicTcNNPwYz4ppUKtBcjC75GA7aKQ2oAlGXz1YrSdwQS0UI/2h
        uTuzoyaX+YqtPowOg0jc+ipnQTs7Kwx2aZEuh5Dn/uN0Fa0QJ3Dw1HT46O6XzqBHVpg3qDy/IQ2Fm
        va2zFtO83fpN0zDdNUCxIYYPGTc/buNvOuAYA5kqfxkSere8daaLaUrBLct4WbGrpz181/oBCFPXv
        OV27l9ZQ==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1liVTV-00DU2k-9H; Mon, 17 May 2021 05:07:29 +0000
Subject: Re: [PATCH -next] rtc: m41t80: correct function names in rtc-m41t80.c
To:     Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
Cc:     a.zummo@towertech.it, alexandre.belloni@bootlin.com
References: <20210517045831.3461507-1-yangyingliang@huawei.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6dc0bf7e-50d3-e8bb-d068-a8a9bbed6fa1@infradead.org>
Date:   Sun, 16 May 2021 22:07:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210517045831.3461507-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 5/16/21 9:58 PM, Yang Yingliang wrote:
> Fix the following make W=1 kernel build warnings:
> 
>   drivers/rtc/rtc-m41t80.c:811: warning: expecting prototype for wdt_close(). Prototype was for wdt_release() instead
>   drivers/rtc/rtc-m41t80.c:830: warning: expecting prototype for notify_sys(). Prototype was for wdt_notify_sys() instead
> 
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Hi,
In kernel-doc notation, a function name should be followed by a '-',
not a ':'.  Please fix & resend.

Thanks.

> ---
>  drivers/rtc/rtc-m41t80.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-m41t80.c b/drivers/rtc/rtc-m41t80.c
> index 89128fc29ccc..79512d1c828e 100644
> --- a/drivers/rtc/rtc-m41t80.c
> +++ b/drivers/rtc/rtc-m41t80.c
> @@ -802,7 +802,7 @@ static int wdt_open(struct inode *inode, struct file *file)
>  }
>  
>  /**
> - *	wdt_close:
> + *	wdt_release:
>   *	@inode: inode to board
>   *	@file: file handle to board
>   *
> @@ -815,7 +815,7 @@ static int wdt_release(struct inode *inode, struct file *file)
>  }
>  
>  /**
> - *	notify_sys:
> + *	wdt_notify_sys:
>   *	@this: our notifier block
>   *	@code: the event being reported
>   *	@unused: unused
> 


-- 
~Randy

