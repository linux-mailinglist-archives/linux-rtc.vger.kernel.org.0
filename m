Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D65C6785549
	for <lists+linux-rtc@lfdr.de>; Wed, 23 Aug 2023 12:22:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231601AbjHWKWC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 23 Aug 2023 06:22:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231949AbjHWKWA (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 23 Aug 2023 06:22:00 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F600DF
        for <linux-rtc@vger.kernel.org>; Wed, 23 Aug 2023 03:21:59 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c93638322so1114350566b.1
        for <linux-rtc@vger.kernel.org>; Wed, 23 Aug 2023 03:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692786117; x=1693390917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cxd/f9pUe8tSEE35CH9p7Iwcb3H3wlv2n72/JZm5DmY=;
        b=fhfCXRjF1eOLreLlvb8oxrNvDkJggjqJtbdAUtLifVJ4A/JJb126n//9lEO5dM3Qhj
         8XsDVxuGPPOkF8JF8rzqm+vmjCLYsdmsjBavoTQtdo5JUlETw1AUp5SWfTWCRtomGfVw
         TL39HS5JK7BYBZNVbaAwVaNbgxMFdV9hLz5OTj78DUYQmloM9KHMLAqfri9kp2+exXl3
         /Kpjhg3Z79v8l/dZWrowRkxd4WPC6IZaOBU3tkF43NxJF8nL29xEx8UqsKGPchu0v4b6
         LrY0i+DU4cK9g0PyGi0lRhzOq7XiYafobq4Yc7YHr9SjQQbceO0awX7if4rnOBrs10pd
         le4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692786117; x=1693390917;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cxd/f9pUe8tSEE35CH9p7Iwcb3H3wlv2n72/JZm5DmY=;
        b=J22w2NI3Ug9xkFVjdDSqLYIKe9hFk95Gx55rFQuQljEesNQpQs7ZChB/dLe8l0b8l6
         AStNd/oufDcy/rSpDzGWnEIkPuY/K89tl6Af0BNcR2F1iV607a5vpU+8BF51CyFlco4h
         /uc+6ACI3gOnFgTe82ksJPCjYtHi3kgYdI6Cd1wtJS8VmMEHuLWB0nfKlFdAjtZZWSYr
         ipnQvuCphiZ7eGt2hBZqgOP1HPL523Qvx1myQmcUrbURge1ZtZWSNmTDC03ON6Nvo3+0
         9JCw/O8RZHW9FFxS0fIC4249nEvOwKZ4nJCGTSUoOGqPPN6CsFJ34P3efplIlXdM17w6
         pk3w==
X-Gm-Message-State: AOJu0Yy1FGBpRkLbgqWhBx+6aFLEVnctHv/10ZPOlvpPCWrmyf24gDIs
        /laZThOzTZL6InSxrYPAGLW5xw==
X-Google-Smtp-Source: AGHT+IEUxXO44chPAXFLzuTL41oAjmwX7yfAnA+DmU4UChPuHTMzIvsQpBWV7EeqPqAFCShxzLV+kQ==
X-Received: by 2002:a17:907:7b8b:b0:9a1:d29c:fb6b with SMTP id ne11-20020a1709077b8b00b009a1d29cfb6bmr2248394ejc.25.1692786117621;
        Wed, 23 Aug 2023 03:21:57 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id a22-20020a1709064a5600b009a1c4d04989sm1695052ejv.217.2023.08.23.03.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 03:21:57 -0700 (PDT)
Message-ID: <86d91b27-1573-7a7c-40c1-f0bbe4f8df9f@linaro.org>
Date:   Wed, 23 Aug 2023 12:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/2] rtc: m48t86: add DT support for m48t86
Content-Language: en-US
To:     Nikita Shubin <nikita.shubin@maquefel.me>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>
References: <20230823-m48t86_device_tree-v1-0-240023b435ac@maquefel.me>
 <20230823-m48t86_device_tree-v1-2-240023b435ac@maquefel.me>
 <19f09a5e-c420-f209-ebef-cfa36ffa8467@linaro.org>
 <c39b9281fa599d523591b3a3b34db6a05362cdbf.camel@maquefel.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c39b9281fa599d523591b3a3b34db6a05362cdbf.camel@maquefel.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 23/08/2023 12:20, Nikita Shubin wrote:
> Hello Krzysztof!
> 
> On Wed, 2023-08-23 at 12:14 +0200, Krzysztof Kozlowski wrote:
>> On 23/08/2023 11:03, Nikita Shubin via B4 Relay wrote:
>>> From: Nikita Shubin <nikita.shubin@maquefel.me>
>>>
>>> Add OF ID match table.
>>>
>>> Acked-by: Arnd Bergmann <arnd@arndb.de>
>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>
>> How did these appear? It's v1, so it is a bit confusing.
> 
> Indeed this is from "ep93xx device tree conversion" series, you asked
> to submit these part as a separate.
> 
> I don't know the rules for tags in such cases, sorry. It's discouraged
> to use tags given elsewhere ?

Ah, no, it's okay, but this patchset should have some history (e.g.
continuing versioning and changelog) or references to previous lore
submission with explanation.

Best regards,
Krzysztof

