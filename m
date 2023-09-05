Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 330AC792C86
	for <lists+linux-rtc@lfdr.de>; Tue,  5 Sep 2023 19:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236604AbjIERfY (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 5 Sep 2023 13:35:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236897AbjIERfH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 5 Sep 2023 13:35:07 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED07412374
        for <linux-rtc@vger.kernel.org>; Tue,  5 Sep 2023 10:02:36 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-500d13a8fafso4822327e87.1
        for <linux-rtc@vger.kernel.org>; Tue, 05 Sep 2023 10:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693933261; x=1694538061; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ITVqO5bicenhh3jxUPk7Zpl/DCHN9osVHVYICZSjhFw=;
        b=lXMwXLxKEs5vTFWBwQt3PGa/2eXF5PZpI26NsQFfm/Hj/Ox0Yh1Y/7eTRxs5QmqpDY
         nKTjjmj2R7Ei0gMOPdGLvAdxvchGlqRF2h6Sckx4VHY9xVlpJMjKVS/Vjh2IFU+VfMo/
         BXMt4tNC3Lypkio66zu9Z58lXDeRb+2U5YhohSPZYMu7zbjL2JjRdMuP6fVzbCmpE/9l
         UnbvSzDOdiDTlS/5GxofEz+gNvOmg4pRGTsYaueuNIlac91GnbXi4/r6jPfluolav6Sb
         OBHVS7uTiQQKYdiBI7IIhrJwvS8wx0NnbD+ElTEGKhLAT80UQgMKV2EGyiRpBZGZbZBq
         ycjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693933261; x=1694538061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ITVqO5bicenhh3jxUPk7Zpl/DCHN9osVHVYICZSjhFw=;
        b=UUy7YoXL3dQrHWL3jw18EoT/sqDENWXMtZToASUIhi8hoF2yzz7aJwYEvTuooFbD/N
         sJUfbstWpyVof4IfEU0dc462BYWmBs+tV16a2bim1sDoY4pvhEYMeMzsuJ2DogDlyTuP
         xLbMNduuzBZrQX0p6NNtu26P2ieWtdM05RjGCvCkn5wQPFGJEA3kKEZYg07RUCudCcqT
         UhlWYVIJjQH1aXElcNojbFq4u2M6aouksjgKIhMtDwxYPCzb3Q5VYJeZHtToJIDdpBaF
         S/WnmycbyABhQ8cePDzJBxt0vg9qPD1wgU1jUWsq7wiqMNtRmlYr8E/VmlEB1HMZO8Md
         otPw==
X-Gm-Message-State: AOJu0YzQcYR61oZAlmQlWhIEuH6Bc7n2wh8vXUzBr8g+0plvaqapxhjP
        adNGoJ/tksDDKxHBWWONFF9f118i4F431HgnA3E=
X-Google-Smtp-Source: AGHT+IFezyZ2iyzDBykWMivtiyqKBcnLI8r94bk/OvsGEvrihHti9Fz/5TMpZF4FUMogOwUT/65HTQ==
X-Received: by 2002:a17:907:a06b:b0:9a1:c00e:60cd with SMTP id ia11-20020a170907a06b00b009a1c00e60cdmr294105ejc.15.1693932355679;
        Tue, 05 Sep 2023 09:45:55 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id e6-20020a17090681c600b009828e26e519sm7740506ejx.122.2023.09.05.09.45.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 09:45:55 -0700 (PDT)
Message-ID: <39836874-e3c8-a09c-67ae-42dcb1b40644@linaro.org>
Date:   Tue, 5 Sep 2023 18:45:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: rtc: pcf8523: Convert to YAML
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>, alexandre.belloni@bootlin.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, sam@ravnborg.or, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
References: <20230905132324.3146722-1-festevam@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230905132324.3146722-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 05/09/2023 15:23, Fabio Estevam wrote:
> +allOf:
> +  - $ref: rtc.yaml#
> +
> +properties:
> +  compatible:
> +    const: nxp,pcf8523
> +
> +  reg:
> +    maxItems: 1
> +
> +  quartz-load-femtofarads:
> +    description:
> +      The capacitive load of the crystal, expressed in femto Farad (fF).
> +      Valid values are 7000 and 12500. The default value when this property
> +      is absent is 12500fF.
> +    enum: [ 7000, 12500 ]

default:
(original binding had it, wasn't it true?)

> +
> +  wakeup-source: true

If there is going to be new version:

You can drop it and switch to unevaluatedProperties: false later.


Best regards,
Krzysztof

