Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2D1146860C6
	for <lists+linux-rtc@lfdr.de>; Wed,  1 Feb 2023 08:38:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbjBAHiz (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 1 Feb 2023 02:38:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjBAHiy (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 1 Feb 2023 02:38:54 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA5B521F9
        for <linux-rtc@vger.kernel.org>; Tue, 31 Jan 2023 23:38:51 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so653766wmb.4
        for <linux-rtc@vger.kernel.org>; Tue, 31 Jan 2023 23:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rruAmV9Uf5Hcl9hQCEy5robAKir9unM5ck997RFMX8I=;
        b=FwBoEPVRCogQqe9FwjlzFft0Yxyu7UPcvYex7ji4jlsu95uk9nYCx1cEOEUSki+gkx
         zCHJXMksh3fWfV54ewKL50IhcuElkTz3Cot5aHKBjnIExMbB95i8wGhgDlI/tUb/cFKT
         JkDUHYlxfd5PfOPHgxjTEVU61qjzu0lWaP2jGov6x3zJYG9J4CJvwGTl8DouXu2ITrcL
         zG1vyN+tSsTo2ixiP+1ZddVu9n2fQ/3f3rlkDF0nl49pi99p0GKALZ/4puE0L6nyBXhl
         qGsfi/Br8MOdmpjgL4ppSJt/03t4hCgSlDWLlXaBXHV62a/Uf741AFd8Mt18IstcvqmW
         O+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rruAmV9Uf5Hcl9hQCEy5robAKir9unM5ck997RFMX8I=;
        b=LK7OTsfWrr2iGU/jO9ftu6s+sMR6eO5VltSaf/GUWgzSg4DnjF2FxXkyibAFMfFACQ
         +FkvUbedWaNvEKh1kEhwRmTsPU8Va/CJu2FDNwEo12m9lWU9oGVFrqhh5nkDsYkjNUNK
         JANuWOvomHXNEnLdYTgbxre+oXbdfAVw1+6e7SJWYmRWkx1iTTbfOtMUPbHTeNGxFShn
         H1J/xDdXWlxN+qhYCyQf+gtedNOaDoyuD1byb6Nj2YizmKLwC6v+sFipwhGiFFT/W5IK
         Wb531WXrr5aUHJPQUPjrBw9W9ATtdnWKUTmcd/ToG/qM2NVmkhVfQAdxXr0/b7NiZNwQ
         HIng==
X-Gm-Message-State: AO0yUKVwf3deu+UvqmilqnFPtm+i+dqD/2kifektryb4cNjw4g9mV/Y+
        4IREluv1pY0HYIuGWRoM7IqwzA==
X-Google-Smtp-Source: AK7set92R7HYwYsOrLSUKb+5aTwkUFUbqOC2ASSd7D2z7qSN8UK8bmDodyucNPdtXWOYT5Tw8IvPxQ==
X-Received: by 2002:a05:600c:4f07:b0:3db:15b1:fb28 with SMTP id l7-20020a05600c4f0700b003db15b1fb28mr1002455wmq.19.1675237130432;
        Tue, 31 Jan 2023 23:38:50 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y6-20020a7bcd86000000b003dc4480df80sm845229wmj.34.2023.01.31.23.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 23:38:50 -0800 (PST)
Message-ID: <31e979dd-f4e9-081e-1bf2-e44dffc4e70f@linaro.org>
Date:   Wed, 1 Feb 2023 08:38:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/3] dt-bindings: rtc: moxart: use proper names for gpio
 properties
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230201054815.4112632-1-dmitry.torokhov@gmail.com>
 <20230201054815.4112632-2-dmitry.torokhov@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230201054815.4112632-2-dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 01/02/2023 06:48, Dmitry Torokhov wrote:
> MOXA ART RTC driver has been switched to gpiod API and is now using
> properly named properties for its gpios (with gpiolib implementing a
> quirk to recognize legacy names). Change binding document to use
> proper names as well.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  .../devicetree/bindings/rtc/moxa,moxart-rtc.txt      | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
> index c9d3ac1477fe..1374df7bf9d6 100644
> --- a/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/moxa,moxart-rtc.txt
> @@ -3,15 +3,15 @@ MOXA ART real-time clock
>  Required properties:
>  
>  - compatible : Should be "moxa,moxart-rtc"
> -- gpio-rtc-sclk : RTC sclk gpio, with zero flags
> -- gpio-rtc-data : RTC data gpio, with zero flags
> -- gpio-rtc-reset : RTC reset gpio, with zero flags
> +- rtc-sclk-gpios : RTC sclk gpio, with zero flags
> +- rtc-data-gpios : RTC data gpio, with zero flags
> +- rtc-reset-gpios : RTC reset gpio, with zero flags

Your driver breaks the ABI, doesn't it? If not, how are the old
properties parsed?

Best regards,
Krzysztof

