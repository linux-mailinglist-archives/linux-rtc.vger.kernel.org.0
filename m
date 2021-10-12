Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96A16429AE5
	for <lists+linux-rtc@lfdr.de>; Tue, 12 Oct 2021 03:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234873AbhJLBU1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Oct 2021 21:20:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbhJLBU0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Oct 2021 21:20:26 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 548EFC06161C;
        Mon, 11 Oct 2021 18:18:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=eXBIFEgTO+nqupPPIAP0fZrutKKFYMtvu8j/H82owZA=; b=FpKBuU7ug1NjckcahWRIgefQWU
        xckATGgFPpjnL9E4yiMaopNLFUoqyrJb4IUEk6aIM6Ke2pTAFQ/dYIEaoTzFzExXjp2yF3CuMkVZ8
        3EXn+FO8lFzl+4/PIZrsKMOOUzuv9LFw3upg02klUwqOphqtF0LykeZln4atZCSVHSAkWZXrdYq3n
        J0h8iYl+Ky3FyP7LqSj6k19cX4ylIAIwY3bUzhe42UAArR0mRq8QCaKBZ/pkoZ7hT+ynt/gES+jX6
        RXQwF6vdIm6CSV32RiMTk7vq/w8z06TdAI5X35YFlwzxmPxRVjAqn6dkIIEPHVcuA/q3BIFm7gGjE
        d37cQiZA==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1ma6Qq-00BBBM-KQ; Tue, 12 Oct 2021 01:18:16 +0000
Subject: Re: [PATCH 7/8] watchdog: max77714: add driver for the watchdog in
 the MAX77714 PMIC
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211011155615.257529-1-luca@lucaceresoli.net>
 <20211011155615.257529-8-luca@lucaceresoli.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <319589ca-0dfb-008f-052a-01f0f25d86fa@infradead.org>
Date:   Mon, 11 Oct 2021 18:18:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211011155615.257529-8-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

Hi,

On 10/11/21 8:56 AM, Luca Ceresoli wrote:
> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> index bf59faeb3de1..00bc3f932a6c 100644
> --- a/drivers/watchdog/Kconfig
> +++ b/drivers/watchdog/Kconfig
> @@ -699,6 +699,15 @@ config MAX77620_WATCHDOG
>   	 MAX77620 chips. To compile this driver as a module,
>   	 choose M here: the module will be called max77620_wdt.
>   
> +config MAX77714_WATCHDOG
> +	tristate "Maxim MAX77714 Watchdog Timer"
> +	depends on MFD_MAX77714 || COMPILE_TEST
> +	help
> +	 This is the driver for watchdog timer in the MAX77714 PMIC.
> +	 Say 'Y' here to enable the watchdog timer support for
> +	 MAX77714 chips. To compile this driver as a module,
> +	 choose M here: the module will be called max77714_wdt.

Please follow coding-style for Kconfig files:

(from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


-- 
~Randy
