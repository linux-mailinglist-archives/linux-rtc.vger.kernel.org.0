Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0838679A368
	for <lists+linux-rtc@lfdr.de>; Mon, 11 Sep 2023 08:17:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjIKGRj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Mon, 11 Sep 2023 02:17:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjIKGRj (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Mon, 11 Sep 2023 02:17:39 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EFF2109
        for <linux-rtc@vger.kernel.org>; Sun, 10 Sep 2023 23:17:34 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-401bbfc05fcso45012555e9.3
        for <linux-rtc@vger.kernel.org>; Sun, 10 Sep 2023 23:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694413053; x=1695017853; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IiC0IE6m0wPl8pl5dOrurkz/p4cSmknmvfdSlln6DIk=;
        b=uVtQz3GOlfJieNng8T9BmINazQXdAAIGZYglgc5PKQ4n+AlbGHXBa/KOw/ej41/6PK
         szWngTh94o4FdSWl9QHaT3YFj0rl3yEyc92x+G6EGN6mZJZNjjjrkIb88mHSsLQwmyel
         Dq/C+XiXROiOnIXAtivxVLKetXMD1WLs7/oLAIExF4eRt3CjdfTZnhwOisblgTv1chCL
         A02abrbXEM5KesaHmsRu0hLBOOA+UGVDxVaZGwlNWvVDlFSmgKoRGjrAJHqhBZ7Yy6u+
         s1i14srMUB04Y0h4iavfK9x11ylorF+dpI/fJnfiHLNQtrL9Fax9o/Xtzp9Gl3MbqlzQ
         Bz6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694413053; x=1695017853;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IiC0IE6m0wPl8pl5dOrurkz/p4cSmknmvfdSlln6DIk=;
        b=LC8m0mld2i0WvqrEQpSLmAr5xrYexSUakvYz7YGAHmsEINcaGSXilFY6tLShACGsJY
         HQb4rJpGwY1oCBBvMpL4Ic65wr50sg7p2tW3eDaITCn2RMAxNdSL9e6aAfR519gA+Jq7
         SvjnXtK0KEhX4fm3jEojc6ZZIyFJN2iKKBrMPKTIZERaqo86YcjOqPfJ6QrL3PYyu8aj
         bbm7xOdYvxf8+aZ5ufXrn7nTG1PRhNFrvaIbD1/d1iYtvazX8iWfPDzv0coBeYlHSlT5
         j4QR7vG866GSfjwfjSuqxZgb/nIFTV8OOxRZZ68DZW/WRP8r3jrNQHC4hjRaYgYLd0N+
         ZTvA==
X-Gm-Message-State: AOJu0Yzaxi30VKegw1x/NOl2mXDTKlYSkjE8nLLph/Qz4pGP522aieJG
        po74vLM6GgyH1Ed4OA6dlItZNw==
X-Google-Smtp-Source: AGHT+IHlyNmlmSt6D4JVp//iLOeraMdK0dpTiYSmwNu+q4Xj+pcPd078PdyE1qDbDo08dGfDkJVTBA==
X-Received: by 2002:a7b:cb90:0:b0:3fe:dc99:56ea with SMTP id m16-20020a7bcb90000000b003fedc9956eamr7246164wmi.19.1694413052986;
        Sun, 10 Sep 2023 23:17:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c210300b003fe601a7d46sm12143847wml.45.2023.09.10.23.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Sep 2023 23:17:32 -0700 (PDT)
Message-ID: <f0224983-d276-8d9c-f6ce-bd77f350bc3c@linaro.org>
Date:   Mon, 11 Sep 2023 08:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: rtc: pcf2123: convert to YAML
Content-Language: en-US
To:     Javier Carrasco <javier.carrasco.cruz@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chris Verges <chrisv@cyberswitching.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230907-topic-pcf2123_yaml-v1-1-40e82bed2066@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230907-topic-pcf2123_yaml-v1-1-40e82bed2066@gmail.com>
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

On 10/09/2023 13:00, Javier Carrasco wrote:
> Convert the existing txt binding to the preferred YAML format.
> 

> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        rtc@3 {
> +            compatible = "nxp,pcf2123";
> +            reg = <3>;
> +            spi-cs-high;

Example should be complete, so preferably also with interrupts.

Anyway:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

