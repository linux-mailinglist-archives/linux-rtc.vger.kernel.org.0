Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23F6F676833
	for <lists+linux-rtc@lfdr.de>; Sat, 21 Jan 2023 20:00:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjAUTA4 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sat, 21 Jan 2023 14:00:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjAUTAz (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sat, 21 Jan 2023 14:00:55 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B2932387D
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jan 2023 11:00:54 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so7985681wmb.2
        for <linux-rtc@vger.kernel.org>; Sat, 21 Jan 2023 11:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHePGEFjy1UfUCetXTj9MaBdDtJ+Ek+cvWCV2WMJtLM=;
        b=RFwGK8+pq0UIJ/VIMMEkQat0+CyIaQU82bmKcpY2yzemsJpf2nwCI2Lbe8QIQfXw3Y
         SHV6CE4c4iZeidJ2OFnPqSdjjhf0l9yV+NwW8NLmAIxi3XdvuSsKJGrkWfGn0PnuwjN7
         lW4BNVcq/C36cw79gBPJ2jH7llgMbpiCEVQMugIru+b7R0saAnae7ANK3y2L4jT1ClqI
         A95u/6tIKzU89M9fVai4Hv0W8u8oOQZt5GDLx0G9mcq8xbeQU1pBYeVKKAFP+vrwPl0K
         EanaIDWIjzTQrKgKaK9V6Fyh+nIEzFOBWQH+2g/DepIbFkQfwT4H90lDbk+UCboMcNv0
         y+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHePGEFjy1UfUCetXTj9MaBdDtJ+Ek+cvWCV2WMJtLM=;
        b=bC3+NlPriydalAuEecdS6kh6pvpsZnPPeqYlq9LpOPbcb7D2Ihz2LuZVljCBo7aVDC
         pPRovarphJpOkDWLUt/eLp+8K7jf2xc+ocxZgIddcxyY8wgXZZrcYx2WXEPHsQL/vt7H
         Pnesh2hoqrReWEsT+UCKEY5kK4Zg5hoKbxxeZ0xvYnKvfl4IxGjEfK0eModqs0sFD9IN
         qhzk9Jw0kOToTLZm/RYCqa0o1Ki5Byedr18gjllUf/OpA8/A2Z9kHWPcIRnDph/YJ428
         LjkBWDy13Mek8Yy8+iWeD9+QVRMaKN4oZ1bNQ5UjopRcdkLF8XEC22DBRdJzDmgV3c8K
         0uUg==
X-Gm-Message-State: AFqh2kpo5Gu7Gtvx/fJGMUPirVXRgGDK7efu7DKPSHl31a+0OLQl/+UC
        BTc6hF77l2c5XeBuBcL67qTGQQ==
X-Google-Smtp-Source: AMrXdXuBuPiNklurQJ5XfLPcWcjvC6JBjCdqXO7Nk+xxhWNbskje7BXiUTucBxE+iU5FlggHBYH8og==
X-Received: by 2002:a1c:ed0a:0:b0:3d3:4a47:52e9 with SMTP id l10-20020a1ced0a000000b003d34a4752e9mr18254396wmh.15.1674327652728;
        Sat, 21 Jan 2023 11:00:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c359500b003c70191f267sm6745646wmq.39.2023.01.21.11.00.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jan 2023 11:00:52 -0800 (PST)
Message-ID: <de2ac5ce-2e54-09fc-71f5-91a2faf15d38@linaro.org>
Date:   Sat, 21 Jan 2023 20:00:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 5/6] dt-bindings: rtc: brcm,brcmstb-waketimer: add alarm
 interrupt
Content-Language: en-US
To:     Doug Berger <opendmb@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Brian Norris <computersforpeace@gmail.com>,
        Markus Mayer <mmayer@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20230120190147.718976-1-opendmb@gmail.com>
 <20230120190147.718976-6-opendmb@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120190147.718976-6-opendmb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 20/01/2023 20:01, Doug Berger wrote:
> A second interrupt can optionally be specified for this device
> to be used for generating RTC alarm interrupts.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> ---
>  .../bindings/rtc/brcm,brcmstb-waketimer.yaml  | 22 ++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml b/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml
> index 9fe079917a98..a9199f299a68 100644
> --- a/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml
> +++ b/Documentation/devicetree/bindings/rtc/brcm,brcmstb-waketimer.yaml
> @@ -11,7 +11,8 @@ maintainers:
>  
>  description:
>    The Broadcom STB wake-up timer provides a 27Mhz resolution timer, with the
> -  ability to wake up the system from low-power suspend/standby modes.
> +  ability to wake up the system from low-power suspend/standby modes and
> +  optionally generate RTC alarm interrupts.
>  
>  allOf:
>    - $ref: "rtc.yaml#"
> @@ -24,8 +25,14 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    description: the TIMER interrupt
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: the TIMER interrupt
> +      - description: the ALARM interrupt
> +    description:
> +      The TIMER interrupt wakes the system from low-power suspend/standby modes.
> +      An ALARM interrupt may be specified to interrupt the CPU when an RTC alarm
> +      is enabled.
>  
>    clocks:
>      description: clock reference in the 27MHz domain
> @@ -42,3 +49,12 @@ examples:
>          interrupt-parent = <&aon_pm_l2_intc>;
>          clocks = <&upg_fixed>;
>      };
> +
> +  - |
> +    rtc@f041a080 {
> +        compatible = "brcm,brcmstb-waketimer";
> +        reg = <0xf041a080 0x14>;
> +        interrupts-extended = <&aon_pm_l2_intc 0x04>,
> +                              <&upg_aux_aon_intr2_intc 0x08>;
> +        clocks = <&upg_fixed>;

Change of number of interrupts does not really justify new example. You
can squash it with previous example or just skip it.

Best regards,
Krzysztof

