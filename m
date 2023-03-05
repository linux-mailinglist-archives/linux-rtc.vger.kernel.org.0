Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53D2B6AAEDE
	for <lists+linux-rtc@lfdr.de>; Sun,  5 Mar 2023 10:51:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjCEJvE (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 5 Mar 2023 04:51:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjCEJvD (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 5 Mar 2023 04:51:03 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C6EDE066
        for <linux-rtc@vger.kernel.org>; Sun,  5 Mar 2023 01:51:02 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id cw28so26991170edb.5
        for <linux-rtc@vger.kernel.org>; Sun, 05 Mar 2023 01:51:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678009861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVRaSLbeCFr9xX9CHDPKOqJOZAVPSAhGTGppf2yuaB4=;
        b=jXl0tRM6U5nFIFnyhbzH6yuvONsWRmH4mkunTqHXLp8/JNKNk1t13kKIBcHLnHYKBC
         FBNTYhZWX23V1BRF8V9DPu8VkM13qlx0+a4m/9vTi3YZ2cMXRriOnYvTTYg/NIjV+rKD
         h6Fhb7OiVvn2ajf3fRuG5vCWWXemlpr+afvLL13IDkwobAlmaGm7GpCQyDvg7VijV5qJ
         68Cc8/msQYkbzZz6UWgHovR65Tl+LgP4Avvm1arKUMZagztj0t0tFssHr7Xq5cl+b+Zg
         BZnFh13BJlpr282YbKCq37ZWNKuNkMUqbD/KrQaMnBgnOziKWiVf2QObKpGa1DFZGOUi
         xuzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678009861;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVRaSLbeCFr9xX9CHDPKOqJOZAVPSAhGTGppf2yuaB4=;
        b=SVdCwE9p5UA+mOxP4WJfJntcDkMH+9MaXjF2sPglVtpIbqzMK7FGBo4sv/YREfdldi
         t9gYbFqTVpBV0y4X8rxBWcZcVDEd/cAfbF3EF1ll/aXHeemDRakIjy9sy/rHHYD1R4j9
         oL7tB0R+oQhv5s4k21ssfUDvFN0fhp0ojSaLtPnDEgFOF8Hr4TKcMpSOnwGL6/j0c5K7
         amUoPKzIK6iTRxJeP9YjqlEa7S7D0mj4KajX+Z0JvK5LfJzQ1gy/pIHaeEiPfNkpDYKH
         fEgUcm7REFcgv0DQRJCElmW0I5m/NjIiKNh03adlwX/mf/u+dn7MPgRYu1ABAKZNY75P
         LuWg==
X-Gm-Message-State: AO0yUKXLu1oZkQvL2mlc7HvvJcIEvOMIP1N1yAOQFiXL8cgSrYDo2zoH
        KJ7HUwK0I4VwJ1QWEBUZw6D3Yg==
X-Google-Smtp-Source: AK7set/eACMSSd8NmezMkgXV80Ojm7mp+0DHvSs3Z+YrczRnNQmj5ZJRxe9Leuhd5n1T/HmrPnBS8A==
X-Received: by 2002:a17:906:f46:b0:8f2:62a9:6159 with SMTP id h6-20020a1709060f4600b008f262a96159mr6777956ejj.2.1678009860764;
        Sun, 05 Mar 2023 01:51:00 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:71e7:13d:1c29:505f? ([2a02:810d:15c0:828:71e7:13d:1c29:505f])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906a38e00b008b8ae79a72bsm3027166ejz.135.2023.03.05.01.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Mar 2023 01:51:00 -0800 (PST)
Message-ID: <0e39d5e8-2206-8615-cb91-c65fdd0a2a17@linaro.org>
Date:   Sun, 5 Mar 2023 10:50:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 15/41] rtc: max77686: Convert to platform remove callback
 returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, kernel@pengutronix.de
References: <20230304133028.2135435-1-u.kleine-koenig@pengutronix.de>
 <20230304133028.2135435-16-u.kleine-koenig@pengutronix.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230304133028.2135435-16-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/03/2023 14:30, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/rtc/rtc-max77686.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

