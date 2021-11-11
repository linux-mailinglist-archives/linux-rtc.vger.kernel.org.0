Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66B5244DE5F
	for <lists+linux-rtc@lfdr.de>; Fri, 12 Nov 2021 00:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbhKKXRu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 11 Nov 2021 18:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230308AbhKKXRu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 11 Nov 2021 18:17:50 -0500
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1E5CC061766;
        Thu, 11 Nov 2021 15:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=vpFeLn+W4mEp0sMCG4BTjlTY9uKT4Ge3pyZvm3ZesMs=; b=doQEfRjs8sY5XiXT1IHqnKi4AA
        /s5uGPNF26VpsskzDl9A7958Id4OMXInejeId5S8JXJfDbGncTQIaIolroA9GfA1l8RZY0khyHLKf
        Wprh1XQFm3jT5fR5iv2a+wxXtiHrMmQMznjWOMsEGa11mkTJhuNkrF9apbFBDBi8aF0WUwkgjeZ0j
        ZcAv5oF/j2iboAR1Sq0NZ17BXswnP04U78G1gBgUdx8YFJinqQ8Tutm3G1Vshm87W43wNHSYACdD7
        0+lAEU2RSoJqkGOSTXeOBBXrb96w2eysYRV2EztZtBx+dMnCTOWQNVb+/tm9Wan9cMfGiXGoBdT4y
        yFbueIrw==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mlJHM-008xCI-V0; Thu, 11 Nov 2021 23:14:49 +0000
Subject: Re: [PATCH v3 6/8] watchdog: Kconfig: fix help text indentation
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
 <20211111225852.3128201-7-luca@lucaceresoli.net>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <de192867-56b7-ec9b-bdbe-31c6ae66c5b9@infradead.org>
Date:   Thu, 11 Nov 2021 15:14:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111225852.3128201-7-luca@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/11/21 2:58 PM, Luca Ceresoli wrote:
> Some entries indent their help text with 1 tab + 1 space or 1 tab only
> instead of 1 tab + 2 spaces. Add the missing spaces.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> 
> ---
> 
> Changes in v3: none
> ---
>   drivers/watchdog/Kconfig | 48 ++++++++++++++++++++--------------------
>   1 file changed, 24 insertions(+), 24 deletions(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.
-- 
~Randy
