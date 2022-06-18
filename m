Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E78D55016C
	for <lists+linux-rtc@lfdr.de>; Sat, 18 Jun 2022 02:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378993AbiFRAin (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 17 Jun 2022 20:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383737AbiFRAiY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 17 Jun 2022 20:38:24 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76B085EBCE
        for <linux-rtc@vger.kernel.org>; Fri, 17 Jun 2022 17:38:23 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id w19-20020a17090a8a1300b001ec79064d8dso2593364pjn.2
        for <linux-rtc@vger.kernel.org>; Fri, 17 Jun 2022 17:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=1E2D0eIZUTntcwUwaqRwv3cDA3yOsU3BAA73sXGXA8s=;
        b=MLfHIHojRTDjOwB+I+zGXS1o1NsIM9WO5iTB1M1GPY0xU3GNIq9R+wHRLHbC9a95G4
         zkokn+kU02Mabtm+KjtW7rHo1ThIFk4yphlnlf8NqjdDRi0hieUy8bqaPpBi+oqtuKut
         KYDMiTLQnK7utfmVxxUu9Ehl8qZr888LX6EGIgos7NeaFaRtk2ynkUXN7w1hhBdwRkNd
         T3TzfVeT0nutX6Gk6A5+KGQMXMuxnfDCab2isoT10b6mXSnXG+hli+XYUENjZ8di/ews
         aIVj/iJPZfemRjRpCn2kICpzjLJbcditeP+ZYeZ1L6jRZ8LsSdKbgGgd9XFw9/NKxRDW
         +XBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1E2D0eIZUTntcwUwaqRwv3cDA3yOsU3BAA73sXGXA8s=;
        b=M0fUQzIJxH4mhHmnoAH2ZsSMW1VakaWKfJUMtC2C6Uvbn+ICDIrNTu/5J6iZcPPjJw
         QhPgZn2m28EKcuUV/wL57EFn3JH1lsv9QNbF/K5apvyJnoZpKTTARIXXcByxYD1/HhOt
         pnH7dyzr0iQszv3oWp87vBy/uFTphDxIpqJzirk2X3lI2ddGUl87ocU/hIrkzQiYvGdl
         Wg6Vw9brcMJEDwiIA4rA24ADk4yH9n3YhVgJEEWoRXAqJRPXjfPPBebAE402JjdXye0e
         3/4aSnfsJ4Gq5rjRu+ZC3KjbAwlJVR4+VeYkimx1YRE2SbxEtKuS7Q6lyctsOjXaAb5C
         hrKQ==
X-Gm-Message-State: AJIora+OHt0fCgy9cT1AhWAY7gDHDtSSmC9MY4C6sdgRnfnlaFLQIW/W
        Alz2kvnQzybutEhnyEM86+vLbA==
X-Google-Smtp-Source: AGRyM1uj3Z9kxkG3CKqxNE/w7cg7parSnynzFxPvFizpC7YlhEXBA9nzGsXp6ADld7B8CujuxAUTGQ==
X-Received: by 2002:a17:90b:3143:b0:1e8:64bc:f5e9 with SMTP id ip3-20020a17090b314300b001e864bcf5e9mr13484456pjb.228.1655512702811;
        Fri, 17 Jun 2022 17:38:22 -0700 (PDT)
Received: from [172.31.235.92] ([216.9.110.6])
        by smtp.gmail.com with ESMTPSA id v5-20020a63b945000000b003fadd680908sm4332528pgo.83.2022.06.17.17.38.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jun 2022 17:38:22 -0700 (PDT)
Message-ID: <f048cb9b-2f26-a278-7d26-a4ac955259d6@linaro.org>
Date:   Fri, 17 Jun 2022 17:38:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V8 1/3] dt-bindings: rtc: zynqmp: Add clock information
Content-Language: en-US
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, michal.simek@xilinx.com,
        sgoud@xilinx.com, shubhraj@xilinx.com, srinivas.neeli@amd.com,
        neelisrinivas18@gmail.com
Cc:     devicetree@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        git@xilinx.com
References: <20220613125836.523449-1-srinivas.neeli@xilinx.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220613125836.523449-1-srinivas.neeli@xilinx.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/06/2022 05:58, Srinivas Neeli wrote:
> Added clock information and deprecated calibration support.
> 
> Signed-off-by: Srinivas Neeli <srinivas.neeli@xilinx.com>
> ---
> Changes in V8:
> -None
> Changes in V7:
> -None
> Changes in V6:
> -Removed dtc warnings.
> Changes in V5:
> -Removed quotes and _clk suffix from clocknames.
> Changes in V4:
> - Deprecated calibrtion support
> Changes in V3:
> - New patch
> ---
>  .../devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml     | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> index bdb72d3ddf2a..638dd1d8bb26 100644
> --- a/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> +++ b/Documentation/devicetree/bindings/rtc/xlnx,zynqmp-rtc.yaml
> @@ -23,8 +23,15 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clocks:
> +    items:
> +      - description: rtc_clk is the operating frequency of crystal.
> +
> +  clock-names:
> +    maxItems: 1

You need to specify the name instead of maxItems.

> +
>    interrupts:
> -    minItems: 2
> +    maxItems: 2
>  
>    interrupt-names:
>      items:
> @@ -39,6 +46,7 @@ properties:
>      minimum: 0x1
>      maximum: 0x1FFFFF
>      default: 0x198233
> +    deprecated: true
>  
>  required:
>    - compatible
> @@ -61,5 +69,7 @@ examples:
>          interrupts = <0 26 4>, <0 27 4>;
>          interrupt-names = "alarm", "sec";
>          calibration = <0x198233>;
> +        clock-names = "rtc_clk";
> +        clocks = <&rtc_clk>;
>        };
>      };


Best regards,
Krzysztof
