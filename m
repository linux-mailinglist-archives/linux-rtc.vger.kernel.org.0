Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3612C44366A
	for <lists+linux-rtc@lfdr.de>; Tue,  2 Nov 2021 20:21:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230348AbhKBTYN (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 2 Nov 2021 15:24:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhKBTYM (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 2 Nov 2021 15:24:12 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A35C061714;
        Tue,  2 Nov 2021 12:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=y7NmXxmwgNpuEsIAHDr8sgPMHa6A/nAcTvtGWxZXzeI=; b=OVECd4bQpwqdFBu7KHEkYG2Vcn
        vMCT3NQhvvIzWlTRdSvrUOXAVw7hy8Gle1CndoQdDI3eDblsNpslKIbJnmCjZXV+4iHHmMuSvicrl
        i8ToskSx2IU+EJL+v9froy266qnDomOIyQCG54iSBTe3ZLY5ilxxxTIlAoDPVASp+ypnOvIX39JXP
        /W0DgxKFFqLzgH7QAPm4FE+MBHyUu8WbNhxug7I78SbIDjuK9LpsfmetV+etd5Z7iKxNzxMahRgHz
        fIp9CB8HSsHmsNcaOtAZv/uVJuaW+8btPAhM0cq7UY/SKg8+A/dbg2afseLM+gK3L7O7ZgIWSTRmg
        s1JjkiGQ==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mhzLj-002nSc-Mp; Tue, 02 Nov 2021 19:21:35 +0000
Subject: Re: [PATCH 1/2] rtc: Add driver for Sunplus SP7021
To:     Vincent Shih <vincent.sunplus@gmail.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, p.zabel@pengutronix.de,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Vincent Shih <vincent.shih@sunplus.com>
References: <1635834123-24668-1-git-send-email-vincent.shih@sunplus.com>
 <1635834123-24668-2-git-send-email-vincent.shih@sunplus.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <1ebf36aa-2680-81b2-aa26-d8b4d10c80ec@infradead.org>
Date:   Tue, 2 Nov 2021 12:21:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1635834123-24668-2-git-send-email-vincent.shih@sunplus.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi--

On 11/1/21 11:22 PM, Vincent Shih wrote:
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e1bc521..0c205d2 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1028,6 +1028,16 @@ config RTC_DRV_DS1685_FAMILY
>   	  This driver can also be built as a module. If so, the module
>   	  will be called rtc-ds1685.
>   
> +config RTC_DRV_SUNPLUS
> +	bool "Sunplus SP7021 RTC"
> +	depends on SOC_SP7021
> +	help
> +		Say 'yse' to get support for Sunplus SP7021 real-time clock

		     yes

> +		(RTC) for industrial applications.
> +		It provides RTC status check, timer/alarm functionalities,
> +		user data reservation only with battery with voltage over 2.5V,
> +		RTC power status check and battery charge.


Also please follow coding-style for Kconfig files:

(from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


thanks.
-- 
~Randy
