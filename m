Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19BF3433BC2
	for <lists+linux-rtc@lfdr.de>; Tue, 19 Oct 2021 18:10:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhJSQMh (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 19 Oct 2021 12:12:37 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44908
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229790AbhJSQMg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 19 Oct 2021 12:12:36 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 39E9D402F1
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 16:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634659818;
        bh=vbtQkKJv01vIX5oUykdTEq0VFYquYD5Mv4xWeOReiYU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=VvU1tur25tyA0fb1P7FDMc/1+BvEIw4AOX2wkrKsaSZh2ZFBHRJYJHDCBPH4VV2Yd
         bALuF0DpnLbUkqM/6uRbhgE7Uh9eBUqNsm4lKcTsoQuQEsmb8tIhJO18XttKcV3rco
         N/ROheHanlJdYH7tmzAxomljw+FdllW1DEutcC8ZNMYvoluievdrb/N1sPF6pjIIed
         MdPi39oobboow2bAXxgCGhjguz1WIk0XrEKBJeqWJAVKqR4ofpRhlr4wxTL4da+YpH
         yMP8OnGq7iBNyczfSdnqb/YFVm8EueV/VrWbod5Zl8VwrBEaPUViduVF+ZEGZ5sJYt
         oYiMssYCWBt4Q==
Received: by mail-lf1-f72.google.com with SMTP id y40-20020a0565123f2800b003fded085638so1651872lfa.0
        for <linux-rtc@vger.kernel.org>; Tue, 19 Oct 2021 09:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vbtQkKJv01vIX5oUykdTEq0VFYquYD5Mv4xWeOReiYU=;
        b=rWPr9sMJ6iF3g/KEbLbLZioWLzMVSrRdkNP7d9t1iTyHtHQBVvBh/f7kKnAmDVJoGb
         FZA7A0SprXtv028I1jlucxPfnmbjFdfWhgDFsxeJ8kUL1mZheRAj/1lgNAY1m5V9T6bm
         o5kcd6fP5GVPOYn6l3dbIV5lD6i2lZ8jkBmnAEcK8A9HcRi2P4QjfTo/n4qZEKGkTVfb
         HVEbc/C0lPTXWWF5YJK54eGo/rYnpTE16LBWKyZgi0V9d+0yJKTD8jZ08pWHW+XyEbtF
         640CCcNA/lKcjgR5YYz0BP9QHi9Ksb7ZAEMw4x3jF4rfeQVtlsvpvhhjE1i53/DEiteX
         4HlA==
X-Gm-Message-State: AOAM532uLtX02r8d3tvFMSaMkVYdnlXef4v1OmnQitgQ+nTJ6ZJO7Waj
        YOaBY4uLNjf/bq2FRp43c9/D6aO+2h0KK9qbpbpThPDhKu16xMja2FD57aOB7myJgMQfDR55/OY
        zqts7yGAlsUFp01Nz++lq07pyfwOlU9V4zvqbmw==
X-Received: by 2002:a2e:3c17:: with SMTP id j23mr7717434lja.161.1634659817314;
        Tue, 19 Oct 2021 09:10:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwuvSDYjL+zmtZPegiXBuE33fgNyA22xger9D425lRjzwroeHAMmeFFBSfH1dCAVIsuIHEvXQ==
X-Received: by 2002:a2e:3c17:: with SMTP id j23mr7717413lja.161.1634659817111;
        Tue, 19 Oct 2021 09:10:17 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x4sm2130401ljm.45.2021.10.19.09.10.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Oct 2021 09:10:16 -0700 (PDT)
Subject: Re: [PATCH 4/4] rtc: s3c: Fix RTC read on first boot
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211019131724.3109-1-semen.protsenko@linaro.org>
 <20211019131724.3109-5-semen.protsenko@linaro.org>
 <YW7o4iVhJNmv/ea6@piout.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <9206176d-2a79-a70d-9b2e-546385b42f3b@canonical.com>
Date:   Tue, 19 Oct 2021 18:10:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YW7o4iVhJNmv/ea6@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 19/10/2021 17:48, Alexandre Belloni wrote:
> On 19/10/2021 16:17:24+0300, Sam Protsenko wrote:
>> On first RTC boot it has the month register value set to 0.
>> Unconditional subtracting of 1 subsequently in s3c_rtc_gettime() leads
>> to the next error message in kernel log:
>>
>>     hctosys: unable to read the hardware clock
>>
>> That happens in s3c_rtc_probe() when trying to register the RTC, which
>> in turn tries to read and validate the time. Initialize RTC date/time
>> registers to valid values in probe function on the first boot to prevent
>> such errors.
>>
> 
> No, never ever do that, the time is bogus and it has to stay this way,
> else userspace can't know whether the time on the RTC is the actual wall
> time or just some random value that you have set from the driver.
> 

Indeed. This looks basically like a revert of your commit 5c78cceeb2d8
("rtc: s3c: stop setting bogus time"). For the Samsung PMIC RTC, we
dropped time initialization in commit fe787a5b2297 ("rtc: s5m: remove
undocumented time init on first boot").

Best regards,
Krzysztof
