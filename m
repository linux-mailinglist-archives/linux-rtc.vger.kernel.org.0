Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E393E0079
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Aug 2021 13:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237858AbhHDLsp (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Aug 2021 07:48:45 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47810
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237830AbhHDLso (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Aug 2021 07:48:44 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 69FA23F34C
        for <linux-rtc@vger.kernel.org>; Wed,  4 Aug 2021 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628077711;
        bh=tMhbSJd33Y47U6GjgAsHtEsnbos4pp9tr5S63DrVWrM=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=b2jnhCHOX9KjNPTOJLCdyttD5F1wULyw9aYwQ6fAW0MsNhc0sDjILimGvCIe0v+9x
         uEMSNJUP1tURr99vCLc/jA3oFO3+Nja/opRySg7Iusd9BRoiy+PqSdFqKKGjoZj7jZ
         sVzgUTBktCYrNUSPOzeQf92KfYRh27r15wvuFwck7jrx2oH539brEIeWTrv6fmdXyd
         ++/Nay5/cm253qCGz2zj/cjAgOi7iWxhOowdG8jhCGWDsV3xLMoeGH0IgyzkjNjuMJ
         5i2FB+Vkh6i1ZYEA3c8jRUpyZr9W6l31iCd1rZW7+ZM2rBzq2HqvmdDX/609RDDUMP
         3P9r78slj+ERg==
Received: by mail-ed1-f72.google.com with SMTP id k14-20020a05640212ceb02903bc50d32c17so1329794edx.12
        for <linux-rtc@vger.kernel.org>; Wed, 04 Aug 2021 04:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tMhbSJd33Y47U6GjgAsHtEsnbos4pp9tr5S63DrVWrM=;
        b=uMFsza+QhX//q+VJccMdUItNjJD/2Npx3zLSTV3PCTPZELDiMQB28Dn3iiqw5/6OpN
         9QGpG9r4R1HswX6CWXaFuMl9w5gHGNPDNVcLJvMNIfAV3YDbvUM5rhJXm5YD1Q/xZXOI
         4T2qRwDHPOWbobTcq9YRxUJmLMLTbNzBcVA7EX/FTvu1yxrj7ts3uJHvvB1Z7Oax/61Q
         zQBMouS+Y9qtloSAVIWI7ofG2FOS036Cb3eBHb1F5OGt2ny1GGtQUFFfb0HUQDqJjUv1
         lwEIn54BhhScIcxyUtwjPUDGi/mK2i3R2gvQpiSV5DQ8keUzIIds0SBsqzV4yuI/WTi3
         DRhg==
X-Gm-Message-State: AOAM532ZLivZKk+XK4vOiM64O3OodBsPSTTUyxmLCKjAizo6ZxUadhTm
        IwQ+PQ5KIrJjzTT4EdtrV9u5YmzgSVTvrp2/nwVaZe1teh6XpTt8JUQZ1dOmEnt3XimCweFaYK9
        WoRvN06gIyVedjMftAEr6y0jKg4QHSN6H1kD6sA==
X-Received: by 2002:a50:ce45:: with SMTP id k5mr31297887edj.168.1628077711187;
        Wed, 04 Aug 2021 04:48:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyz1JuI2wwWVfNsvgCD6IontIiSgpJPdXAInWolV92t4U1jmScRlUPBnjegyq1MDUsGkv3GHg==
X-Received: by 2002:a50:ce45:: with SMTP id k5mr31297876edj.168.1628077711044;
        Wed, 04 Aug 2021 04:48:31 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id i14sm845463edx.30.2021.08.04.04.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 04:48:30 -0700 (PDT)
Subject: Re: [PATCH 3/4] rtc: s5m: enable wakeup only when available
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
 <20210804104133.5158-3-alexandre.belloni@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3dde6cbd-6822-ff49-51f5-0ab20db0c56e@canonical.com>
Date:   Wed, 4 Aug 2021 13:48:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804104133.5158-3-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/08/2021 12:41, Alexandre Belloni wrote:
> Call device_init_wakeup() only when alarms are available and the RTC is
> actually able to wake up the system.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-s5m.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
