Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A48DE6C0164
	for <lists+linux-rtc@lfdr.de>; Sun, 19 Mar 2023 13:07:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjCSMHD (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 19 Mar 2023 08:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjCSMG5 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 19 Mar 2023 08:06:57 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F58B22A22
        for <linux-rtc@vger.kernel.org>; Sun, 19 Mar 2023 05:06:54 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id er8so25054246edb.0
        for <linux-rtc@vger.kernel.org>; Sun, 19 Mar 2023 05:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679227612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=wyyRNf1RVCSmVWy3uIQD6gbqmoxHXa4hhnuxOXFy5DSK6KoJMRW/7snBe+hAcOuLSh
         4Lil0xPsXtCAFbTqAzDdtCyDhPRNI/pweLUmN6KTonFGYaLFKA2c641IjtNvE0333K/0
         iwf8OUVV6CImiDOkzXbLoQxSXxGLT1pNVgzmz8rjCC4TtF0xRkBnaw2J6Q6fsDn6B3vO
         qGuzkd5xHcL84vTvayPMp0BjhvSj1BaD45jc37kce8oQ795+M7hlUkz5iakVRZLdUngL
         KVKgU5E9wG7BR2kQZUT4ObnjiJ9P0zF028UvVcHQPrlM6HIR4Yc/BHO1sVUHHif7PQzP
         va2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679227612;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3GQ0kuX+CANTyKsciGzMU4Vb8Jeilt6T7QwH/C5HtcI=;
        b=xLUKZQFoySBMn/EpvZZ1xKd0DgicAd1K/fLp0Wg4o4MOoeISHSGGvuNZZ2QkxULRtd
         peQcdlJXt3ba9rtwI/8BHTdituAhkudzaVIjng5oDFJHZTBC5B2MjZrXmus9spr7DM85
         YtZ1TEhcS74h/l+MRJiXujB9MxU6tIJ/WrmSgAt91En29UkV2N0oQiwXnWeQQCJbyZ2S
         gD9uvXTTDMZSmZ9cnHf5dBEkNFF5vr5bn/Rq5yUf+tozOZ9ZoVBnGjuyu/YTFOvRf/bl
         LNaKAZNWzL81q+bsxRdyJ3sayLSBcoI+wabUM5/u6T/R1HBwGXoQ0R2Y2MFz4Uucb7nG
         TlyQ==
X-Gm-Message-State: AO0yUKU/tvjfqliG2a8c5Jb8HegU8xM9+4DU3i/ymXVJi6MqPaHKp9Y0
        2w+Q3/t71n+y36hM+3OqQV1EFQ==
X-Google-Smtp-Source: AK7set80QOZ+DV1BMmqsy+GIRzW1eJc2fyUakkB2BmV/dLpU+3H5MSHjgo5dvspVJM8r1tWCDkHtFw==
X-Received: by 2002:a05:6402:4d2:b0:501:c120:6e90 with SMTP id n18-20020a05640204d200b00501c1206e90mr1103738edw.3.1679227612697;
        Sun, 19 Mar 2023 05:06:52 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:5b5f:f22b:a0b:559d? ([2a02:810d:15c0:828:5b5f:f22b:a0b:559d])
        by smtp.gmail.com with ESMTPSA id qx20-20020a170906fcd400b008eaf99be56esm3244862ejb.170.2023.03.19.05.06.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 05:06:52 -0700 (PDT)
Message-ID: <a4d6ef37-77a4-bdf7-9281-681864b901d3@linaro.org>
Date:   Sun, 19 Mar 2023 13:06:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] dt-bindings: rtc: Drop unneeded quotes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        Hans Ulli Kroll <ulli.kroll@googlemail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        linux-stm32@st-md-mailman.stormreply.com
References: <20230317233634.3968656-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230317233634.3968656-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/03/2023 00:36, Rob Herring wrote:
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

