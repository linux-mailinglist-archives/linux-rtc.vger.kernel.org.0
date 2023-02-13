Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE3669437F
	for <lists+linux-rtc@lfdr.de>; Mon, 13 Feb 2023 11:54:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229915AbjBMKy0 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 13 Feb 2023 05:54:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbjBMKyZ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 13 Feb 2023 05:54:25 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B531CC17
        for <linux-rtc@vger.kernel.org>; Mon, 13 Feb 2023 02:54:24 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id m20-20020a05600c3b1400b003e1e754657aso2505311wms.2
        for <linux-rtc@vger.kernel.org>; Mon, 13 Feb 2023 02:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c4gMj6DLk69LRUfrPQck9bSlMaISXZGCTkv4ZK5wjaA=;
        b=xabJSuvfnWQ37OhcxWukJ0rXnPEPPnqpfPEl3xZ9fab+kcs6mpfL4TM7e8zIRCjW/4
         cbyiT9qL5tOjl1arDVGpYqSYxESw8hMGf8evAiiZNAOcFams9kls907jCDm/PHJVZuqW
         7a7rIklVAFSV41LWtX/EIADWfNc+dAJA73ppMk9wHuxfVHBAerHdJAVsHQnCr30BNUcT
         gSPhyTZv0MaH6gyT857R0bCz0/kFmca+6WP5vcuxbxTCLZGZrZokHL/U8qKY8LSBk4Ly
         gyHCSC86sq5RuEvEJzyYg62jNjnv75DBnfJCDMB8IwQ03o3CSs+cftV9AgKTewri8keA
         tb7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c4gMj6DLk69LRUfrPQck9bSlMaISXZGCTkv4ZK5wjaA=;
        b=Bi8aLdH9MX9+cp3STeRPjQg8MElIgxyErCPTzB5oM4dC4wAza7XQkyVmjWpteBGQaB
         4Gl+wZC6OaBjqVWhpedOg1UJQw14X+GvkE0CVOLFXOusqTVrQewentEMR9hIhah6X45p
         h7NQIYmuiv+Gp+QC5ETrHtEEHSau52nd+Qpq0g+bhgGxIhuosmYBrCcrB9SoHzrvW1gx
         uAEV/vUypfJ9G8DMYFX9X+fx0s5a/z5r4w51vd6FPxvBmqTTS8Tdk2kWGjhxdqKjfyes
         YGI+gb4itIPMxjhUA+QO3kPE9KbUPAiOVnQKXhu/CxeMPxFZqpjxw4xf6C+2GYF1Geym
         Akqw==
X-Gm-Message-State: AO0yUKXcokTCvFnTz/ARLzYGtMH1K7Q97UbYfu9vKuv3mFsx2b1yw5LA
        VNJ6o9WSTm3Z/c+IGf68KLmeKg==
X-Google-Smtp-Source: AK7set+dmnC8fFHSMMpTa9TbZ82Axtabej6jsHRu8DYMsSuwhXURadcSWX18R3jADIv3rFMAblj0Sw==
X-Received: by 2002:a05:600c:1688:b0:3dc:573c:6601 with SMTP id k8-20020a05600c168800b003dc573c6601mr20411857wmn.36.1676285662715;
        Mon, 13 Feb 2023 02:54:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j23-20020a05600c1c1700b003daf681d05dsm14507052wms.26.2023.02.13.02.54.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:54:22 -0800 (PST)
Message-ID: <28f16bc4-a1a7-9345-10e8-e292b94420a7@linaro.org>
Date:   Mon, 13 Feb 2023 11:54:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/6] dt-bindings: soc: amlogic: convert clk-measure.txt to
 dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-2-c4fe9049def9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/02/2023 14:41, Neil Armstrong wrote:
> Convert the Amlogic Internal Clock Measurer bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

