Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 548BF67AB07
	for <lists+linux-rtc@lfdr.de>; Wed, 25 Jan 2023 08:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235097AbjAYHiC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 25 Jan 2023 02:38:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235138AbjAYHhq (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 25 Jan 2023 02:37:46 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 389EE4ED2F
        for <linux-rtc@vger.kernel.org>; Tue, 24 Jan 2023 23:37:39 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id l8so13059632wms.3
        for <linux-rtc@vger.kernel.org>; Tue, 24 Jan 2023 23:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=drKWvcFPfRgHx21lbl5Y2B9mBAq+0PGW3rfHR1F347I=;
        b=MZWkjFHwOQS9krY6zLweOjl4cRTtL0ah9Ph2j+mPxLtHQIoMYy8DrqjyOkVQzys1iA
         v9h82rn7YWreKbtMUAKK02e4sNOup01htJqtKuz6HhuJ1BMN19qAyAjb7gxI7rxMDq47
         rZDOrKHZKXvGWNjOF3z43QlZq2WiD3mUdHrC+jKqrYS5MxInj08e5jxZue3N2vI7sOby
         dajT4X1cQZkYf8JXkwSffztRfm1c9u3njnDvKCar1XBUZQjb4/74Hg+IRhgJANTD6ssx
         /Sdgt68cL++s0rkh05sRYJsTM35NKB6OuJpENrHnutL+bgRiYshUfN/NlHLj77CkLXnE
         xI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drKWvcFPfRgHx21lbl5Y2B9mBAq+0PGW3rfHR1F347I=;
        b=4LjPS7zhnIyiDzdmPBmRkC5jG0LvMfaBQRJKD88MoTb8dKxKgHf4p3PjgEmr4o7rMU
         knymCyXw7biKT6zuQkRpin6Mk9kvqT5Gkg/OyhVLFGWZE6X8uNEpA+k+DqxtlP2MiHV7
         iNl45NK7k9wWfETs1Dq4z1cwHgBnAjcGCvN+VHScBsVvyDTULfDh1maOAyy8plyxPYUK
         5Ez+l4AzmghRPrW+jsEERyDroT6Dp0BtaClRxzN0P64QJpaPmiG5mIvXK3OxJvVi6Rwh
         WLbEj03dxz4E6FsmQPlZpQdQy3w/rsoQgR/bwEJwdmkXgfy0xONaU2/OH40z3tLh8XF1
         pJlg==
X-Gm-Message-State: AFqh2krdjI0bH1IG8s6ZVvp6Kp3JSa+7XRDgu8uutGABk4gF5vnGzn2d
        GmW0dGLPgx32Uk5Uy4L+Uao8cw==
X-Google-Smtp-Source: AMrXdXv8EF9JSvvOjKP9MtQxtcEYMk8+sgJay7W/122yQIytbMamYm3x69f0PrZiBzUqrY60z0DmLw==
X-Received: by 2002:a05:600c:35cf:b0:3d3:49db:d95 with SMTP id r15-20020a05600c35cf00b003d349db0d95mr30287567wmq.37.1674632257765;
        Tue, 24 Jan 2023 23:37:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o40-20020a05600c512800b003dc0b0e1e47sm978237wms.48.2023.01.24.23.37.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 23:37:37 -0800 (PST)
Message-ID: <9ede2d28-3f8e-2990-b6fd-a6fcef43a027@linaro.org>
Date:   Wed, 25 Jan 2023 08:37:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: brcm,brcmstb-waketimer: add
 alarm interrupt
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
References: <20230124201430.2502371-1-opendmb@gmail.com>
 <20230124201430.2502371-2-opendmb@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124201430.2502371-2-opendmb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 24/01/2023 21:14, Doug Berger wrote:
> A second interrupt can optionally be specified for this device
> to be used for generating RTC alarm interrupts.
> 
> Signed-off-by: Doug Berger <opendmb@gmail.com>
> ---
>  .../bindings/rtc/brcm,brcmstb-waketimer.yaml  | 21 ++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

