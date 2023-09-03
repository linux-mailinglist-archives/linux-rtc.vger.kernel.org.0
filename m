Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94A20790D41
	for <lists+linux-rtc@lfdr.de>; Sun,  3 Sep 2023 19:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345751AbjICR3e (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Sun, 3 Sep 2023 13:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236491AbjICR3e (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Sun, 3 Sep 2023 13:29:34 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 278DEE5
        for <linux-rtc@vger.kernel.org>; Sun,  3 Sep 2023 10:29:31 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-9a2a4a5472dso345945466b.1
        for <linux-rtc@vger.kernel.org>; Sun, 03 Sep 2023 10:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693762169; x=1694366969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NPHJUBMqgjrbaCmQyeTzEyQhvq2Pyskk2J6fzgNfO/w=;
        b=k/lDe646vu57BtR2Gj24rrOcGylnCcsht2WC6i5VfN33za/Kr6++Q2OwISG/cxKbch
         88dQ7wEfhRCKrPbq2hdp01b1o5pCmzBRGbmDP/Yv4aO88ctAt6MzR2lTZlV9VF+1q46/
         LLBbQUgGoL8kPquLTFSZZvmB9MntIJGML0yT5Lq9dsI1YJMkbYI5b6/O6eRhXXMbS6/c
         CfeXyPyO/MCv87v/QIFXaKd9pjQpSqdv+yKZiZ4lvx3XNbobTcU13+EV+cbiV5RKSlRf
         9a4bgtNy1hvMI6K4DOFOgN+Pd8bnD+o+eP1yilavUUA0P0rsWqoXjYSCUYQwk279Q7U4
         JuDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693762169; x=1694366969;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NPHJUBMqgjrbaCmQyeTzEyQhvq2Pyskk2J6fzgNfO/w=;
        b=W7pUCRa+Yv2xwLI/BbyEjen9tPp2ka/66Fg+j34Lkjkgu3vG/nzqEDcLPwCV5T3UDR
         uefJWD9mkSiJCc9qCAbGPkT4+wLe7JANW4Vakb764OPcrGosbAGUb47xOD62Suas8s1w
         uTMLftViZT3J5AP0tmd/93XYBGn5VlSHmVR2Va8nZIGstEHwRlGQ2Xhjaqst2ReGU6A3
         Kc88l2tBaZm6l+CWNwUa5RaYzV9QPwqYMRISrwMyghKh5KXxf0crzn00uH/GuauYzgQQ
         1Ooypdfklp2G9OdmMSZBlMnWm/Z0wvA6Iu+56Z96RtbQBDS7aUQaNDOHlpdPgcd5ns6u
         50+A==
X-Gm-Message-State: AOJu0Yz9TOXSVsvadIaxPSfvR8xyelp7SXJ1KjAJKMZfAc0xYs66b4MJ
        dm4PBgFwNsxZZyhmW+fr1UzVdg==
X-Google-Smtp-Source: AGHT+IEhCNWtl7YQ5p/jh+vxHI1d+ZEaGgMP7BekHl3orE2v19RJpwz8akAmdj1GoO5WSQhhqN5H0g==
X-Received: by 2002:a17:907:1def:b0:9a5:d2f5:c76 with SMTP id og47-20020a1709071def00b009a5d2f50c76mr8833461ejc.5.1693762169524;
        Sun, 03 Sep 2023 10:29:29 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id c25-20020a170906529900b0099b42c90830sm5001164ejm.36.2023.09.03.10.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Sep 2023 10:29:29 -0700 (PDT)
Message-ID: <96620b14-6bc6-ed55-1cff-4eb1eef2a9fc@linaro.org>
Date:   Sun, 3 Sep 2023 19:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] dt-bindings: rtc: ds3231: Remove text binding
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>, alexandre.belloni@bootlin.com
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, Fabio Estevam <festevam@denx.de>
References: <20230902134407.2589099-1-festevam@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230902134407.2589099-1-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 02/09/2023 15:44, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The "maxim,ds3231" compatible is described in the rtc-ds1307.yaml, so
> there is no need to keep the text bindings version.
> 
> Remove the maxim,ds3231.txt file in favor of the rtc-ds1307.yaml binding.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

