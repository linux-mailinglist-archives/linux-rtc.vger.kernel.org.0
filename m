Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27F0D44DE64
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Nov 2021 00:16:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbhKKXTA (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 18:19:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhKKXTA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Nov 2021 18:19:00 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E46C061766;
        Thu, 11 Nov 2021 15:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=OMbw+oaZmEcVelygW8bdZY2jU8q1S+0riVAueUdEN6s=; b=U+jxZ2+m3hBxpo5Zt3SVuGqQhZ
        VmlK2K24WrVlTWFA9hP2OxGmQYWpdVAzZD9FP7sza58Rv8I199fwe6B8RGjNqUFjKBM505c0Hj/3P
        LzyvU+36DFMloDq4JgBBJrktx/yFNu6SVoyfxnKhdyvELcHznAorTdO9MqW5OBmkFc3geBdvRcq0W
        /Aa6FdcP4HmfKU1sRMC1vy7MKNITCuKirtVPK7K8W6YnYrhN8uk7ZS1FMzqLNL9i5r7KgfM1+Xttn
        UfB3oZUm0aK5RYdFye5XwTWAdh8hy9iL2Tp3aKQaaIm9oYPfW1d1zQh3loyYm0dgSdE4cqlBqDvc8
        d2R3ZJvg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mlJIe-008xFX-7F; Thu, 11 Nov 2021 23:16:08 +0000
Subject: Re: [PATCH v3 1/8] rtc: max77686: convert comments to kernel-doc
 format
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-kernel@vger.kernel.org
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Chiwoong Byun <woong.byun@samsung.com>,
        Laxman Dewangan <ldewangan@nvidia.com>
References: <20211111225852.3128201-1-luca@lucaceresoli.net>
 <20211111225852.3128201-2-luca@lucaceresoli.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <79d99962-0243-d6b8-936d-ffd50270fbbe@infradead.org>
Date:   Thu, 11 Nov 2021 15:16:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111225852.3128201-2-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/11/21 2:58 PM, Luca Ceresoli wrote:
> Convert the comments documenting this struct to kernel-doc format for
> standardization and readability.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> ---
> 
> Changes in v3: none
> 
> Changes in v2: none
> ---
>   drivers/rtc/rtc-max77686.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
