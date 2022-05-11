Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2536F523A4E
	for <lists+linux-rtc@lfdr.de>; Wed, 11 May 2022 18:29:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344736AbiEKQ26 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 11 May 2022 12:28:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344733AbiEKQ24 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 11 May 2022 12:28:56 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97EF62380C9
        for <linux-rtc@vger.kernel.org>; Wed, 11 May 2022 09:28:54 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id j6so5098407ejc.13
        for <linux-rtc@vger.kernel.org>; Wed, 11 May 2022 09:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=QqzHC4zviczliZl2lLCxrl5rJkRbECBgInAGwGkD9yg=;
        b=aGEFad1EDE0DpwKvGqYp9ytIwe1hZZbJM5cXMCKj0eWfdc1tZurMgVXSuUztlCVnft
         vUlxjPa2RxbThLg9fJVZiOZA/be0z/jCvUuheZsVEvMi6dCVYoK4y2fz7W7VSlPrgDQa
         Y9BI/mX6xu5cafzHd52vqZIo33+AW1NaZ4uUmvHetgRFBp9dv0MnQLQKqcZOiPaGsz8R
         yZFi3rW/+ogXRT2DpEvPAq0cy5qT5mkHg1pBIezbuMWX1en1nsGLS41cLFt6aTA+mDjh
         /J+PiIGFzDFcuqIoh/I0DZltweiP2qNS5DhhCSZlDc7ySAWJ1vLGQYiYSaqyOuPJYEgZ
         fXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=QqzHC4zviczliZl2lLCxrl5rJkRbECBgInAGwGkD9yg=;
        b=EqwHCkbbLGx8kIY8TKfGwNCgDnLX70IiKOsg3QQUJhdeFgksab8/RtSTyR3GH4BcTo
         xCA272iWWs5Gk7V9d9gT3Z40Chl6uLHirkm/9WKVhO5FwAxj7ULBxVrAqqpMaWY5P8K1
         7noM/innL2GDeRdolqSSUPBqSc1Ykja1wMHaTbpAf7PD7L+NI+YynumKxWayQ0h6Os+s
         gw9OYYty8fTzmGLfyaL5+sJ+VLxaqYN8K/MiWaJ2PdVqT0hJ8nt8Pi/H5qMosPUWB4ll
         0Y7NPzmOocKI4yKSAJr+VfxWWuuieYUf4cA52EhG9LaTpUNfIVcTbpo2th7bQkLoMth7
         tbvw==
X-Gm-Message-State: AOAM533XCPNUTCGzm+z7V2vE0t4qKBqnaf3t3pA47pX1acoXT2XuFA4j
        ivzy3eTvp8BjdOYJ/7LQJYxQIQ==
X-Google-Smtp-Source: ABdhPJza79RRbAKYTDu5tTXN4HO0mglLsTFqQ57AwDP/1BmnOVX2fWPwZq7D4wi4X8xf/GlOEW8CHg==
X-Received: by 2002:a17:907:94c4:b0:6f9:f69f:2fd5 with SMTP id dn4-20020a17090794c400b006f9f69f2fd5mr16811024ejc.347.1652286533120;
        Wed, 11 May 2022 09:28:53 -0700 (PDT)
Received: from [192.168.0.155] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o9-20020aa7c7c9000000b00427afbbf5e8sm1398908eds.11.2022.05.11.09.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 May 2022 09:28:52 -0700 (PDT)
Message-ID: <d7f124a7-a338-8ada-8d68-9434059db9fc@linaro.org>
Date:   Wed, 11 May 2022 18:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH V2 1/2] dt-bindings: rtc: Add TI K3 RTC description
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Andrew Davis <afd@ti.com>
References: <20220511002600.27964-1-nm@ti.com>
 <20220511002600.27964-2-nm@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220511002600.27964-2-nm@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/05/2022 02:25, Nishanth Menon wrote:
> This adds the documentation for the devicetree bindings of the Texas
> Instruments RTC modules on K3 family of SoCs such as AM62x SoCs or
> newer.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> Changes since V1:
> Krzysztof's comments addressed:
> * $subject updated
> * assigned-clocks* dropped
> * Dropped the un-necessary quotes
> * Dropped the extra example, which serves no purpose now.
> * compatible is just an enum now.
> 
> V1: https://lore.kernel.org/all/20220412073138.25027-2-nm@ti.com/
> 
>  .../devicetree/bindings/rtc/ti,k3-rtc.yaml    | 61 +++++++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml b/Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml
> new file mode 100644
> index 000000000000..444e18df6231
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/ti,k3-rtc.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/rtc/ti,k3-rtc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 Real Time Clock
> +
> +maintainers:
> +  - Nishanth Menon <nm@ti.com>
> +
> +description: |
> +  This RTC appears in the AM62x family of SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - ti,am62-rtc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: VBUS Interface clock
> +      - description: 32k Clock source (external or internal).
> +
> +  clock-names:
> +    items:
> +      - const: vbus
> +      - const: osc32k
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  wakeup-source: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false

I didn't brought it earlier (I assumed you used existing RTC examples
for your schema): why this is not including generic rtc.yaml schema?
Isn't this a RTC?


Best regards,
Krzysztof
