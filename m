Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91BDC62F26D
	for <lists+linux-rtc@lfdr.de>; Fri, 18 Nov 2022 11:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241626AbiKRKXK (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 18 Nov 2022 05:23:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241547AbiKRKXJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 18 Nov 2022 05:23:09 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CEC49038B
        for <linux-rtc@vger.kernel.org>; Fri, 18 Nov 2022 02:23:08 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id l8so6179327ljh.13
        for <linux-rtc@vger.kernel.org>; Fri, 18 Nov 2022 02:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SZjogBHbu6Hox+r5R773aRSxF9DDXAIJw7tfb5nqEF0=;
        b=RzDAHrjqmmXJRJtMDHScshl90a0ew3DPG71B897qVi1fY/6m/zKUdGnjs9pXVgIgJO
         BQYvB5vWlBF4kbheGuxghWw390g3RTILI6nhfPP50cYUs1vHbJvED6gL6M53PlJ8O3mm
         0TrqKvi98qdenE7Eh38hiQT48iikpW0dIWAtJC7KtSWLJq3Q8xvArvcRspM+p/U/KlWn
         M+iyDTbty5FRR5uwKWm/SWHRd+XWrwzzxCYoljRj8U+JgF6GUWS5bDYYpL2NGfkqiZ1R
         3Jc5UcJxf9cdCwctiOYKiiNanc5hdqbMHS6f3nzMBXQYGNun1ox3r1GKBsPEceq0oTCC
         HUDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SZjogBHbu6Hox+r5R773aRSxF9DDXAIJw7tfb5nqEF0=;
        b=och+cbWMbnbslaI8w14UYEbBLqkDg4EXs2nQAakKb9EGmATfuO1SMgfMcx2fxhEN64
         1tiSEpdmN2IPmO6lvrodL3ltEYh6zTuDKN5SAG6jQ6wKW2Boh/31t9SrRGJAeERsBp7c
         Ik/+O+mf9pg3vyuAEVLhSvYIUQrRsfcjohppq1vkNKJsMDB85rYUZPLT7GoMZKHOKpLf
         mS0eJCtKDY2/j3kecSIa9eUpXY8TmCCv4/8BJLO+eE4kfVeSs6yF9yQ2VjLjJ+tSOGzV
         Rw3FeEULb8ovybNgGtt6xE1FvtTxyCCWYbkDHrtGYRO8/GNYR9xqjTySWVrWheEC+CtQ
         W8rg==
X-Gm-Message-State: ANoB5pkYgzZXH3bcBadPTsbaIUMMTg13ykAvBWUrSLdUVNnTm0EZZI3f
        tJuEgYYFy8gWwjXjsCmerF/K0w==
X-Google-Smtp-Source: AA0mqf4w/54HorPUxYTe6YSbQtht4ss6LQG0GXx1kPqIetT0khZ9z5aSaUDr2YgFGLtSnHscXHqFKQ==
X-Received: by 2002:a2e:8e63:0:b0:26e:6c5:2a6c with SMTP id t3-20020a2e8e63000000b0026e06c52a6cmr2429146ljk.36.1668766986598;
        Fri, 18 Nov 2022 02:23:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b1-20020a056512070100b004b4bb6286d8sm241786lfs.84.2022.11.18.02.23.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 02:23:06 -0800 (PST)
Message-ID: <966aa391-8a49-c64b-9985-3d50a8c35891@linaro.org>
Date:   Fri, 18 Nov 2022 11:23:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/4] MFD: TPS6594x: Add new PMIC device driver for
 TPS6594x chips
Content-Language: en-US
To:     Matt Ranostay <mranostay@ti.com>, vigneshr@ti.com, robh@kernel.org,
        a.zummo@towertech.it, linus.walleij@linaro.org, lee@kernel.org,
        brgl@bgdev.pl
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Keerthy <j-keerthy@ti.com>
References: <20221118092218.480147-1-mranostay@ti.com>
 <20221118092218.480147-3-mranostay@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221118092218.480147-3-mranostay@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 18/11/2022 10:22, Matt Ranostay wrote:
> From: Keerthy <j-keerthy@ti.com>
> 
> The TPS6594x chip is a PMIC, and contains the following components:

No improvements in the subject. The subject prefixes are lowercase.

In the binding you said device is "TPS6594", not TPS6594x.

Best regards,
Krzysztof

