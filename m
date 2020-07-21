Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E3A02275B7
	for <lists+linux-rtc@lfdr.de>; Tue, 21 Jul 2020 04:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgGUCjx (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 20 Jul 2020 22:39:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgGUCjx (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 20 Jul 2020 22:39:53 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 319B0C061794;
        Mon, 20 Jul 2020 19:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=wWhHWzxhd3/LIaCH5+jXFeYS78v/TctNfa+wPmrIhxk=; b=vKKlneSRINyMeAUOfG0d++ZOsk
        CQX6JgvX8SyQGs1lCTrDog24yiRRsqjA8njXW7RF+iVluimdDXa7pOuz/kI5Z0+PvH1PRQauB0cxu
        rDM1ppvSRTKQEO1aDNmQkN8ByXliE14htjIml1a8z2FkXpvOFzS4sDjKk91hg7naisQNXrTddM7yv
        e6MRmrIN1YbbFnH7HpWXrQlGJi/IiBrkKPMVt3BQYCO2Qd8TzCRV0OMd/mZykYaHWXSrizffNTgxx
        8JCd4W2jPsngWxeBMGVHhzbURlldSXP4eTNPv36LZdN5VeiujV9YzKwNeGsdeAwNEYRwy5756e9Q6
        vTyPiNRA==;
Received: from [2601:1c0:6280:3f0::19c2]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jxiC6-0003rV-Dp; Tue, 21 Jul 2020 02:39:50 +0000
Subject: Re: [PATCH 1/2] rtc: ds1374: fix RTC_DRV_DS1374_WDT dependencies
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200720075250.1019172-1-alexandre.belloni@bootlin.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2d322558-d60e-6da2-3434-389959d222b2@infradead.org>
Date:   Mon, 20 Jul 2020 19:39:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720075250.1019172-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-rtc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 7/20/20 12:52 AM, Alexandre Belloni wrote:
> It is not enough to select WATCHDOG_CORE, the watchdog part of the driver
> now also depends on WATCHDOG. This is currently the best we can do because
> alarm support and watchdog support are mutually exclusive.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

Thanks.

> ---
>  drivers/rtc/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index c25d51f35f0c..2753e0f54cc3 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -281,8 +281,8 @@ config RTC_DRV_DS1374
>  
>  config RTC_DRV_DS1374_WDT
>  	bool "Dallas/Maxim DS1374 watchdog timer"
> -	depends on RTC_DRV_DS1374
> -	select WATCHDOG_CORE if WATCHDOG
> +	depends on RTC_DRV_DS1374 && WATCHDOG
> +	select WATCHDOG_CORE
>  	help
>  	  If you say Y here you will get support for the
>  	  watchdog timer in the Dallas Semiconductor DS1374
> 


-- 
~Randy

