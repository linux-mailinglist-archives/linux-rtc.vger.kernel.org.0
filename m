Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37E3E783FFF
	for <lists+linux-rtc@lfdr.de>; Tue, 22 Aug 2023 13:49:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235389AbjHVLtM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 22 Aug 2023 07:49:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235379AbjHVLtL (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 22 Aug 2023 07:49:11 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3AC910D2
        for <linux-rtc@vger.kernel.org>; Tue, 22 Aug 2023 04:48:51 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso578959666b.1
        for <linux-rtc@vger.kernel.org>; Tue, 22 Aug 2023 04:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692704923; x=1693309723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oH11Oc+qbxmWTzYqIGrVP17FnC0Zqpu68k1rvfbbDX0=;
        b=P4Qf1myvTmUWlrB6GossTUcUgcbmdwvSKgQz+8PFMPd+AXQDqxt18/VpcxkKXkMHe+
         1OSrBCNuUKxSzIh9WXDWeaD5tXNmcbaRk0ID4AiMJYwNOPC9ztzNQ4TeAvhD0lbpCERe
         V5eIzmMuhp8SrDC9kScNsToK16LLNFtc0ss/2yXH/PKiE60jPrrm8OcOoKPCjESuU8g2
         dMj9DQenXX6r9NkRsSXTFjvkqiDaksGcslAFoE2msJ3atai1dinKn+aDSHnDaOoA3Vmb
         mCGLo8dozgQMZfgRUyNy9j4vJIalBdlmPWUoxYQrxwxBbLO4cMW254X2d8Z6+lSbkV3b
         56Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692704923; x=1693309723;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oH11Oc+qbxmWTzYqIGrVP17FnC0Zqpu68k1rvfbbDX0=;
        b=L4AhYwDezvv09m5VzP9QfMHaGWA07biTe15UoffGFbw9GB2uX+gHpTyLZN2L/KWVZO
         yiE/8Wf8V1chlXerpQz27xjZW8jpjD7sqfWEOQCt4SfWoHY3Ho64S83i6bVcYFQ8vncp
         Dwxp0Epjw2vFnJsP10Id/18oAH/X3vCRZjvBjIc55IRXaIMV8Sc9EeomYw0XGJ4B+Xig
         i5nPSuwBWdYkpkMpF+jYPJcLvHXxnu5UvqQqffNmDYuXtmOuHcEAOCiIcPESU85iK3mf
         dobduVulW3W3WqzyKqSQjk+QgtQ8VbhWvGa2rQzyHbyxCYVqtixxvrrBbmoFy65WfmnO
         K99w==
X-Gm-Message-State: AOJu0YyE3Fc7nJed42aq98Btyjk4ZZ7iONgbyAt3amKLcwxBMwYtu4Ob
        RhylsaFn4OADPiHj9r6uIPXttQ==
X-Google-Smtp-Source: AGHT+IE7A1CYr6kVDOW4fVuqD06IgAC6NbsrvQnOKHnd0u7YxGHAAHU+Uj53ZLTs4MMK2cnh00OO7w==
X-Received: by 2002:a17:907:2c6a:b0:991:d05c:f065 with SMTP id ib10-20020a1709072c6a00b00991d05cf065mr7417198ejc.52.1692704923543;
        Tue, 22 Aug 2023 04:48:43 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id f20-20020a170906561400b0099bd1a78ef5sm8026861ejq.74.2023.08.22.04.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 04:48:43 -0700 (PDT)
Message-ID: <8ff579bc-423c-3edf-dc78-28370b2a0f19@linaro.org>
Date:   Tue, 22 Aug 2023 13:48:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: Add Epson RX8111
Content-Language: en-US
To:     Waqar Hameed <waqar.hameed@axis.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     kernel@axis.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1692699931.git.waqar.hameed@axis.com>
 <903c1e05804535f212fa128425326b7554c0794a.1692699931.git.waqar.hameed@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <903c1e05804535f212fa128425326b7554c0794a.1692699931.git.waqar.hameed@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 22/08/2023 12:25, Waqar Hameed wrote:
> Epson RX8111 is an RTC with timestamp functionality. Add devicetree
> bindings requiring the compatible string and I2C slave address (reg)
> through `trivial-rtc.yaml`.
> 
> Signed-off-by: Waqar Hameed <waqar.hameed@axis.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

