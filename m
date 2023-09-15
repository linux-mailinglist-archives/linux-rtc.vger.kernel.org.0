Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 927C67A1C91
	for <lists+linux-rtc@lfdr.de>; Fri, 15 Sep 2023 12:43:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjIOKni (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 15 Sep 2023 06:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231841AbjIOKnh (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 15 Sep 2023 06:43:37 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7685DFB
        for <linux-rtc@vger.kernel.org>; Fri, 15 Sep 2023 03:43:31 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9adb9fa7200so362857766b.0
        for <linux-rtc@vger.kernel.org>; Fri, 15 Sep 2023 03:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694774610; x=1695379410; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zs7SCGNmTvKC0KYE227sV1lKMejl7A2RG6oKRsvvi0Y=;
        b=qtTWs0c1WdmsKS0M0miJ7mB7smV1CpvsCBH91MylI3QWJZI3b72nGhfuQeuh+G47wC
         h/AmXtNsE/YgrtFFRWf1Awr1aGAUfPsW7KytfUk6AR/jG+GCmWx0yUxadsY725ybQWIy
         xRAHAxXc//9m2DkwU+Xxbt97rN88Ecx4SULdWUF+BjGqR9Wgh/e/aZ0X8nY1MCaIodnT
         bEKOXIINlaRBEgkkyAkgfdvzb8xE3vPVjNdypjPY1VyiQwGEjbjYuoTikJCNHpigGwvY
         9lOxViSlGLwvsupKDQnNuMQ8pbeJSClSuOgWnnIZ7lvVdVOin/nPUM5MVIiJrKUEQudx
         3BsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694774610; x=1695379410;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zs7SCGNmTvKC0KYE227sV1lKMejl7A2RG6oKRsvvi0Y=;
        b=cpt+Z/7BTrDP2+o1BXUGDs/dtT/d2smlhlTAKWlPv8xQkeFW7ark/6yfvdsLXEDSoD
         poI5v+3PvhZyuZBFaPNL+I8yW0aJgh/OcUfc6KxvHCgsTqbVlD9XDo/8qCR8OVQd2Z61
         OL1WMRQdGdmMKNpxrMcTgmBGlkoydSZunsPcto2aRvIDOAZglYAOlD/et2H7mIj3FFip
         eAVa4up1bA3+UBwI/+F8Ii1Pw+Q9tsY+d3BDpYwPALb05ZoCUM5Ye6fWeSmCnejYJQ7W
         1X0T50p6ZboL1WqrIM8dSvqRa0CXFzGaL+6AyNtomVdTC9/J3ScNlowfrDqkXCUnvgpW
         gOdA==
X-Gm-Message-State: AOJu0YwS0xvnuL+J8qFbtKpAe9qGswM/jVVp0NGkOWY0oSZ4ylB3JmRU
        xm8xbzEO6mfRod22YT98r5v/Lg==
X-Google-Smtp-Source: AGHT+IHpnNBzlJ2LOuDnbdpSUsDYpTLkTr9y4sJY9oDs6w29u/LntMeSJBldqYBgfKwOBJOvxytpCg==
X-Received: by 2002:a17:907:80a:b0:9a9:405b:26d1 with SMTP id wv10-20020a170907080a00b009a9405b26d1mr5767523ejb.5.1694774609954;
        Fri, 15 Sep 2023 03:43:29 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ld3-20020a1709079c0300b009adc81bb544sm1088343ejc.106.2023.09.15.03.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Sep 2023 03:43:29 -0700 (PDT)
Message-ID: <a95f93f3-0acb-35d8-fad2-ad81043e5f26@linaro.org>
Date:   Fri, 15 Sep 2023 12:43:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v4 13/42] dt-bindings: rtc: Add Cirrus EP93xx
Content-Language: en-US
To:     nikita.shubin@maquefel.me, Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
References: <20230915-ep93xx-v4-0-a1d779dcec10@maquefel.me>
 <20230915-ep93xx-v4-13-a1d779dcec10@maquefel.me>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230915-ep93xx-v4-13-a1d779dcec10@maquefel.me>
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

On 15/09/2023 10:10, Nikita Shubin via B4 Relay wrote:
> From: Nikita Shubin <nikita.shubin@maquefel.me>
> 
> Add device tree bindings for the Cirrus Logic EP93xx RTC block
> used in these SoCs.
> 
> Signed-off-by: Nikita Shubin <nikita.shubin@maquefel.me>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

