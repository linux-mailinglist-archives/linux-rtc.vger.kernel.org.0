Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0CD63E0075
	for <lists+linux-rtc@lfdr.de>; Wed,  4 Aug 2021 13:48:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237830AbhHDLs2 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 4 Aug 2021 07:48:28 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:47754
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237814AbhHDLs1 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 4 Aug 2021 07:48:27 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 8D2813F349
        for <linux-rtc@vger.kernel.org>; Wed,  4 Aug 2021 11:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628077694;
        bh=jJZp0apQcBCx/g4ztRnpqLCubJ3rAMKU3P29wXITwo4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=mcjrB++CfM5OmLg8sm9u86i1pEUkDXaHuDKmnO1mJZc8pjhsgr46KbYNJMX46Ruv7
         8xrTyTBlHdo4rZBTQVbMCxC+KPXvaH1r9IUbEWP8HBV2QvguI4xm81THV23gWqUEx3
         VcbsiEd47zz4z7ttQv2Mv7vCnlFA3i4mWQFARX5WLTrAG5OBRqoPfUZmlaQoiGeYyt
         lqe0cdDz2gTddH1CsZy9CARouQ5KO+YAqz5CJJeuxUtcFsOV8yuHPRiXgai/sbrXjB
         kt3KAD5td8JkCN8gwl8U+m/VttR9x9GBaLcYCwxLDY7TwQ2eo/X0qXE4lCxgUy8Erx
         vfN6w6VdtIy9Q==
Received: by mail-ed1-f72.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so1339574edu.1
        for <linux-rtc@vger.kernel.org>; Wed, 04 Aug 2021 04:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jJZp0apQcBCx/g4ztRnpqLCubJ3rAMKU3P29wXITwo4=;
        b=inftZMwcEeKFB2B4NFyrIM5vMeFEM7hKkc9fB1d9BiP3LvTSbcEUPn8EvYw/guw4nK
         lhXIhfaa1MEIv9QiSclQ0IAnTfmCQl+Sf/BQIj/w1LBR9dWj3eZf/x1lyaA2T9QGnj5h
         3gdHyivPNzU9WYy7aPIk0bNm32LdhLzA/JQ6ZPtYOx33MD4m1tBZrdnedpbM95R9YpnT
         CQxciGliQtf8fEeEqr/SDb7m1stKX2SgGLRDTqUIbJrcShP8yy8eS3BxAnHS6iztQkbC
         Dz0W/A1GjHqMKo5QcLpYNayaTf2HJTBm0s4/0xUMYQEEiUtLhDrig6shzMyzAiJpAyoC
         1/Eg==
X-Gm-Message-State: AOAM533jiT720e7J3PaZ7WLJdNZoPqO1ft2xpU+VIIlmO+mcWf4LRzd2
        4GkQ+GZOYdJP/dTAqFB1UzCFSGUEE2rB4WSExbddavJeTGWULPFIHEFCJGhyTiSE+mx/uWq2NVg
        sdE9y/hZqvXQ4IgKdpM/Kz7Zm0nsoCzVP3eJwTQ==
X-Received: by 2002:a05:6402:22b0:: with SMTP id cx16mr31583197edb.185.1628077694159;
        Wed, 04 Aug 2021 04:48:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcpiaW0+haWPvb7MEo4s9CiFXa91M44/xivEDNxbz6PFA5ot1FvpfcKva1eJKpbjYnqo92BA==
X-Received: by 2002:a05:6402:22b0:: with SMTP id cx16mr31583179edb.185.1628077693893;
        Wed, 04 Aug 2021 04:48:13 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id oz31sm605961ejb.54.2021.08.04.04.48.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 04:48:13 -0700 (PDT)
Subject: Re: [PATCH 2/4] rtc: s5m: signal the core when alarm are not
 available
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210804104133.5158-1-alexandre.belloni@bootlin.com>
 <20210804104133.5158-2-alexandre.belloni@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <67383f05-4bb9-23ea-662b-28a2cc24c7c7@canonical.com>
Date:   Wed, 4 Aug 2021 13:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210804104133.5158-2-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/08/2021 12:41, Alexandre Belloni wrote:
> Clear the RTC_FEATURE_ALARM bit to signal to the core when alarms are not
> available to ensure the alarm callbacks are never called and userspace is
> aware alarms are not supported.
> 
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> ---
>  drivers/rtc/rtc-s5m.c | 27 +++++++++++----------------
>  1 file changed, 11 insertions(+), 16 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
