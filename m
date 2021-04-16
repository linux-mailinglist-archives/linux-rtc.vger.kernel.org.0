Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6C0F361D00
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Apr 2021 12:09:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235226AbhDPJOQ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Apr 2021 05:14:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:59524 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234914AbhDPJOQ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Apr 2021 05:14:16 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lXKXv-0007Kp-6q
        for linux-rtc@vger.kernel.org; Fri, 16 Apr 2021 09:13:51 +0000
Received: by mail-ed1-f71.google.com with SMTP id y13-20020aa7cccd0000b02903781fa66252so6686723edt.18
        for <linux-rtc@vger.kernel.org>; Fri, 16 Apr 2021 02:13:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TBHSrQMedfIZ0NHm4Vuee3oMabjgi2Z9z+wuaFSao34=;
        b=I+J4ccuSuaZJRvMS+Qu3qbu6ftWJP/xZfqQqtWbUPQcDlJo5mSaZKZzFdvb1BVfj4W
         j0ZweZUx320KrqQuqpObZTdA9UP4IbeFREXkYimJVKf6Se6d5l1p9csCUABxYxIxBmry
         twck3y1f8unwguWat+iYQgHgPhywXX75k2qj6CCq45yq96q6F+DU7bwVd5gwnDYDQyRc
         z4Sm2qyORz+M8jJIFjH/Lrd7rNCOBdqmdReWmO3BUKb06zQWd49h+CBkSVs4ubLurqSj
         x2NAh+gO05D65kKV8ODA+AozxLqQ4wnkX/ze/tIqOTwR4iEW/ykfngRr6AAadEhs48AV
         leSQ==
X-Gm-Message-State: AOAM531P1rbDqjQBy+RXC3+UHGiKhyN/ahv5yFgn2NO/tBQK8mlPgoIX
        28oJy/EmTqOoq1bwFqkgPO7dOeOgSRTpkYmGT7IVBOynmB89rZF+AExr5wVhaL5A+SA3vsH2GuV
        BtKgWTcpKMh2YpyGr04U+2m1V+IaKcszyTS7tPA==
X-Received: by 2002:a17:906:53c7:: with SMTP id p7mr7337268ejo.89.1618564430903;
        Fri, 16 Apr 2021 02:13:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweK9tiB7uzLCIeFzW76R/mM0DO97HxN0N8y+fVULfDExeD0z+87Y25+JwAgl7DxkP3goJkpA==
X-Received: by 2002:a17:906:53c7:: with SMTP id p7mr7337261ejo.89.1618564430799;
        Fri, 16 Apr 2021 02:13:50 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-192-147.adslplus.ch. [188.155.192.147])
        by smtp.gmail.com with ESMTPSA id m10sm3830584ejc.32.2021.04.16.02.13.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Apr 2021 02:13:50 -0700 (PDT)
Subject: Re: [PATCH] rtc: Fix missing IRQF_ONESHOT as only threaded handler
To:     zhuguangqing83@gmail.com, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210416021949.1569-1-zhuguangqing83@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <342f2c09-87a8-571e-e032-d954de4cf2fc@canonical.com>
Date:   Fri, 16 Apr 2021 11:13:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416021949.1569-1-zhuguangqing83@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 16/04/2021 04:19, zhuguangqing83@gmail.com wrote:
> From: Guangqing Zhu <zhuguangqing83@gmail.com>
> 
> Coccinelle noticed:
> 1. drivers/rtc/rtc-s5m.c:810:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 2. drivers/rtc/rtc-rk808.c:441:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 3. drivers/rtc/rtc-max77686.c:779:7-27: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 4. drivers/rtc/rtc-tps65910.c:415:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 5. drivers/rtc/rtc-lp8788.c:277:8-33: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 6. drivers/rtc/rtc-max8998.c:283:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 7. drivers/rtc/rtc-rc5t583.c:241:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 8. drivers/rtc/rtc-max8997.c:495:7-32: ERROR: Threaded IRQ with no primary
>    handler requested without IRQF_ONESHOT
> 
> Signed-off-by: Guangqing Zhu <zhuguangqing83@gmail.com>
> ---
>  drivers/rtc/rtc-lp8788.c   | 2 +-
>  drivers/rtc/rtc-max77686.c | 4 ++--
>  drivers/rtc/rtc-max8997.c  | 2 +-
>  drivers/rtc/rtc-max8998.c  | 3 ++-
>  drivers/rtc/rtc-rc5t583.c  | 2 +-
>  drivers/rtc/rtc-rk808.c    | 2 +-
>  drivers/rtc/rtc-s5m.c      | 4 ++--

The commit msg suggests in misleading way that there is an issue here to
solve but at least for max* and s5m it is not true. These are nested
interrupts.

I tested *only* the S5M:
Tested-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

but still I wonder - why this change is needed, except satisfying blind
Coccinelle runs? Does it really bring benefit for the nested interrupts?


Best regards,
Krzysztof
