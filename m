Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA6A77626F
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Aug 2023 16:27:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbjHIO1x (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Aug 2023 10:27:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231747AbjHIO1x (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Aug 2023 10:27:53 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF1F2109
        for <linux-rtc@vger.kernel.org>; Wed,  9 Aug 2023 07:27:50 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe1d462762so58474375e9.0
        for <linux-rtc@vger.kernel.org>; Wed, 09 Aug 2023 07:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691591269; x=1692196069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RIeum1LY6S9oOWjrA1Hz1M/iI/HQL9yzxT92jLmRvy4=;
        b=HKuEWv2S3p0ryCE+P2Er85fOrWyumOVzBMb6xINWCp41dK3t68nBKR+B+iMKIGJ5Eo
         MEOJ+9XXbMmls/NfkWrvFnUIshwXEa4bsYJ9jWwYLUyxLz/v7JISdtz6FD1lZD8vww+i
         ZesbgngH8DiqPthHakl1RDVSv7tLru+r9Uo7VBJESjkzZhIVR40WLXuYlEDi5+n22XE5
         4TFyGe/QrdLsldg8veJ4ibTPeqBTQLaoVCrwXbVMQ0xnY7vjUbW3JJGsChLjeZ7k+AdL
         S8Pn29LRLWRPT3bEUSAyKbT1bReWDgsKYIfEsSXUAFsaZNQLGkTkEKdNfE2qL90hEKHF
         grBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691591269; x=1692196069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RIeum1LY6S9oOWjrA1Hz1M/iI/HQL9yzxT92jLmRvy4=;
        b=BNkHWscMgiELhF5qqx4E7k6CjtUEgH6e4ADq/XigTraGemrHFThdQ8ZKZe9k7dKbIG
         PajVZb0phCQwmjSW8iKfP70m3BPRs1G9v1iIIFXL9OVT63Bes4KffqQWUh7Ro/mqef1X
         4YVUKispoNvJ7WiYPZriScGd3lXJMtmyLSXq4XF+CqyXk2BxhryXz+bilmVoCPBOKD4w
         hKCtnyB2O0ubmRxtZ308qqnoKJVT45fik++ZUl/0szOKca9jbYBOBtDxrIhWH71rYq97
         dTV7KgeAwR2kpHtVem6dNP1tOqkmaVAtOC49UP++eXpOF71iGzVNTKM/AEoBtbbkK2Xj
         5dJA==
X-Gm-Message-State: AOJu0YyUt3He3sfe2jFCdNm+EpzEoA7CCVK14xR3S96+wu9k0R9JleJu
        XPn/vLVHlPyMHNPV5dxRNRQ1xg==
X-Google-Smtp-Source: AGHT+IFcvrF/0+48M5rEwvbGq8wkuT4jgAfdSLYdgNQCBWGh9/ZxwvF01V2txrU3jt8NvdClblnr4w==
X-Received: by 2002:a05:600c:219:b0:3fe:1deb:82 with SMTP id 25-20020a05600c021900b003fe1deb0082mr2306960wmi.7.1691591269368;
        Wed, 09 Aug 2023 07:27:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id 24-20020a05600c029800b003fe2397c17fsm2124090wmk.17.2023.08.09.07.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 07:27:48 -0700 (PDT)
Message-ID: <893c3f40-3094-1939-833b-2edcd935c83c@linaro.org>
Date:   Wed, 9 Aug 2023 16:27:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: nuvoton: Add DT compatible
Content-Language: en-US
To:     Mia Lin <mimi05633@gmail.com>, avifishman70@gmail.com,
        tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
        yuenn@google.com, benjaminfair@google.com, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        KWLIU@nuvoton.com, JJLIU0@nuvoton.com, KFLIN@nuvoton.com,
        mylin1@nuvoton.com
Cc:     openbmc@lists.ozlabs.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230809095112.2836-1-mimi05633@gmail.com>
 <20230809095112.2836-2-mimi05633@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230809095112.2836-2-mimi05633@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 09/08/2023 11:51, Mia Lin wrote:
> Add DT compatible "nuvoton,nct3015y" to select
> 
> Signed-off-by: Mia Lin <mimi05633@gmail.com>
> ---
>  Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> index 4f9b5604acd9..67fc60fd395c 100644
> --- a/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> +++ b/Documentation/devicetree/bindings/rtc/nuvoton,nct3018y.yaml
> @@ -15,7 +15,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: nuvoton,nct3018y
> +    enum:
> +      - nuvoton,nct3018y
> +      - nuvoton,nct3015y

Responding here, but based on your changelog and driver:
Why? Why do you need compatibles to verify the reported ID? Verifying ID
does not make sense. At all.

These are compatible devices, so you could have one more compatible
using old one as fallback. And no new entry in the driver.

Best regards,
Krzysztof

