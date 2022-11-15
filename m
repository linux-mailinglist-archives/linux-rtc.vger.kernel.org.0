Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB44F62A289
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Nov 2022 21:10:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231826AbiKOUKu (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Nov 2022 15:10:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbiKOUKt (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Nov 2022 15:10:49 -0500
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com [IPv6:2607:f8b0:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC02A17E11
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 12:10:47 -0800 (PST)
Received: by mail-il1-x132.google.com with SMTP id o13so8006483ilq.6
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 12:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rb7jBGXbzGyxffcDNwboMY2DzDKCBnatY7WqspaVRkI=;
        b=A/6V3WqOc5LiuT2BWj4xJGbmK8TaNUt3i2Uzdh6QY0DvRyDxCX0R6k/xAOzrho0zgc
         ih7j8ji5WWqxf0DYfUzXUPrF+uvGD8SqkqTQ6S5u9gM4/PuxRJhEDCSbomcaLoHXNLEP
         OMEtcOhFBHOH7obD+S0hiUNgxoHY2IadZtJks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rb7jBGXbzGyxffcDNwboMY2DzDKCBnatY7WqspaVRkI=;
        b=bTvCgUh0uO1DzOR71QTfxI+I2zw1J7HQAUzcKIi8N/XKo28Y2ZYJMSC7xU582fXi5F
         EP6bSMUUOZCkAG2/sXAxlzYQWUQmi8Aq1Orl1Y++d3EbFusFIEP7ujTUpTYYQqrjqj03
         C2E/77Dptub1DpEBWoPu47l/usl6Z/SITo44f1741dBQypX6+ms6OrtyC0uSgABa+40S
         VybUHJYE9kTB5PSHncgnH1g5tb3Nw74VD9qmQhwywQ6eGtvZAkmBFn6YD3W/8L8XRvnf
         hNbHZ9eZYg76c6vrUFjL+durtYr9Gex59NcvP2yrYasnYANVy4FV8RG+yWul0/3rXoL2
         nCIw==
X-Gm-Message-State: ANoB5pk/NMFI2jRKhS+y8rLVxNzzpJxQ8NtHpLzcU5jy91WHkU6h4ebn
        ezEsrvfHGNNRn5IpwEtFU8W+AQ==
X-Google-Smtp-Source: AA0mqf76lOK+KSl53+gEBcVW/o6FRM+XDnbBp6Wwh7l0FISCD1Nws+PS61elFQDW8Iq/xklmNwtcXw==
X-Received: by 2002:a92:dd0d:0:b0:302:47e0:e08 with SMTP id n13-20020a92dd0d000000b0030247e00e08mr8376255ilm.83.1668543047194;
        Tue, 15 Nov 2022 12:10:47 -0800 (PST)
Received: from [192.168.1.128] ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id i11-20020a02cc4b000000b00375e136bf95sm5053681jaq.127.2022.11.15.12.10.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 12:10:46 -0800 (PST)
Message-ID: <7b864479-e7c6-cabe-e363-a8268f7ce2f2@linuxfoundation.org>
Date:   Tue, 15 Nov 2022 13:10:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] selftests: rtc: skip when RTC is not present
Content-Language: en-US
To:     alexandre.belloni@bootlin.com,
        Alessandro Zummo <a.zummo@towertech.it>,
        Shuah Khan <shuah@kernel.org>
Cc:     Linux Kernel Functional Testing <lkft@linaro.org>,
        Daniel Diaz <daniel.diaz@linaro.org>,
        linux-rtc@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20221115200422.2306194-1-alexandre.belloni@bootlin.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20221115200422.2306194-1-alexandre.belloni@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/15/22 13:04, alexandre.belloni@bootlin.com wrote:
> From: Alexandre Belloni <alexandre.belloni@bootlin.com>
> 
> There is not point in failing the tests when there the RTC is not present,
> simply skip the test.
> 
Could be rephrased to read:

There is no point in failing the tests when RTC is not present.

I can fix them when I apply the patch or send me v2


> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Tested-by:  Daniel Diaz <daniel.diaz@linaro.org>
> ---

thanks,
-- Shuah

