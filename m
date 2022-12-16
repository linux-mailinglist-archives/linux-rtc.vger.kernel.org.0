Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3169964EC0D
	for <lists+linux-rtc@lfdr.de>; Fri, 16 Dec 2022 14:24:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230312AbiLPNYY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 16 Dec 2022 08:24:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230375AbiLPNYV (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 16 Dec 2022 08:24:21 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D042150D6D
        for <linux-rtc@vger.kernel.org>; Fri, 16 Dec 2022 05:24:18 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id p36so3407978lfa.12
        for <linux-rtc@vger.kernel.org>; Fri, 16 Dec 2022 05:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/+mMxOdMAgLCeuwkaZmvxMZlpVOnxVzWHkvJPQHxnRI=;
        b=ujrJHZZ7vtUjOvUQAW81BfcvxHm/qIXYl8RqOCVYigjm+N2HO3xtQ08VyIyN8pHJ9R
         Md1d10dAusU9tWOY9DmsIYn9MUsBz1cdpP1u9zUWfuqGmztxmHpgHHAD2Sir3Bcb+Zbl
         RVUxYE3GdQIJTvGhh1P3zcTTg9ooz+tIZ2ITLHKfKuXcmg4oo7OdBKcPjBaldTtrlR28
         E+tvzcZaVyPXCLm6F10efIgO/gbnzk6riJr20tkPBk5X6vDkZCJFuf2CYd3uDs7gFrR/
         zTp+cGBxbAZVdV/Y0VIpiqOYJf5i+09sryUE1BSu7vG7IaNdWjf3DHyizxkBsZTMEeY9
         ourA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/+mMxOdMAgLCeuwkaZmvxMZlpVOnxVzWHkvJPQHxnRI=;
        b=DNBQpAfg8dNVDZt6hWZimkjxZjKXXnPZDrj64PnmEslX+5NwaIaHtKQxEnzEQvDnx7
         U7mfaechomWnXK8L0Yu1ZOa/OhnqgGOWO7Cv4YiGGqT5KxE4nZ61T983rfZLQx8Yp5+r
         bkjif4tjBJWoB0jXVky9Tib6CKbaWj3ciFMsgSX5FTeSCJ7qK3DJZEXJu00eR6M90Y94
         JWzSn1fZG8kjLw0vPxBZ7petJplznwCdmA3C609AqfV2YqjJdGdN80LtWBFSn9In5tnF
         Z8/RD+dOxwCpVNgT/N54EQ9SB9btXfIrXSdtm5V+qQ7P/8YvprBDlhZNDAD2JmTFbBmG
         CFuQ==
X-Gm-Message-State: ANoB5pkTdYPZi7Kv9GE4vBNsVACUIskanRMhdmprxGgjxIuVhtpr2+Wz
        WOBEhxhsmxGjJaImbjsYYBWE4Q==
X-Google-Smtp-Source: AA0mqf56qsEGhfRMqX+JEjXAuSmBjPtw3+8fmZRoUV93ZUk48rfYhC2KVQXthyFQhi41/i48fWGR7Q==
X-Received: by 2002:a05:6512:259e:b0:4ab:f3f1:8299 with SMTP id bf30-20020a056512259e00b004abf3f18299mr9923984lfb.6.1671197057217;
        Fri, 16 Dec 2022 05:24:17 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id a8-20020a056512200800b004a2c447598fsm220591lfb.159.2022.12.16.05.24.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 05:24:16 -0800 (PST)
Message-ID: <07ab1c4d-2e59-6b0d-0d82-24b4772653ea@linaro.org>
Date:   Fri, 16 Dec 2022 14:24:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 14/14] dt-bindings: rtc: pcf2127: add PCF2131
Content-Language: en-US
To:     Hugo Villeneuve <hugo@hugovil.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hugo Villeneuve <hvilleneuve@dimonoff.com>
References: <20221215150214.1109074-1-hugo@hugovil.com>
 <20221215150214.1109074-15-hugo@hugovil.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221215150214.1109074-15-hugo@hugovil.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/12/2022 16:02, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add support for new NXP RTC PCF2131.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/rtc/nxp,pcf2127.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

