Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7B8618DCD
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Nov 2022 02:50:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230131AbiKDBuf (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Nov 2022 21:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbiKDBue (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Nov 2022 21:50:34 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F075923EBD
        for <linux-rtc@vger.kernel.org>; Thu,  3 Nov 2022 18:50:33 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id l9so2306804qkk.11
        for <linux-rtc@vger.kernel.org>; Thu, 03 Nov 2022 18:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25rCOFvi2xxOKeipqExuiHQTPJ5P+8zuFS9aAe9IGEI=;
        b=zz7isIePorBFG9VXaGu/7sh/JdlVIjd+9F3gle48ECtbCk1gEgKBKYzrw6efs+gQF6
         YkZ03VVKeKYltqLMHynsJ/t4RcSwGS2Xqb1yUaMZpNK/ddbH4s8qWItF//IDbJan4QHK
         RzvQV3P2G9uqzM3MxAL5DcozLpYOqxVaYElM8bVRXbIb+rhYc7yMngtBUxxVEcmKak67
         rkcMQK0dTcGDS4RVdOVLz1jpeR718l61tMmH/1BiWPILTmQ9N/p5kh6j9xqbUzgastJS
         o8EBhFVoUSkFsUp48sekcw6E998llZgpB/rpc5wfRnvpTkbMho5YRMxAQ5nqC+gCIneF
         aulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25rCOFvi2xxOKeipqExuiHQTPJ5P+8zuFS9aAe9IGEI=;
        b=5Mlc3xGiCnRe5cc33r+G/+yzKRMxW/4lpKUITxaLGLg0Oxt7TzvD8QEz1lLo4m/CqW
         AxBitpPxmarx8IDJmVGYqUlDsiGBEH02aC5RSyRq78O/rlqWxeyqn+MzTTFwjrUwGHuM
         9NUhfEab2nfOIyKIGMnVf6m6gNDTHWV/60vjTglsQEbcGrIKAs8+pgbMn7J5b9StuBJF
         PgmV6suyL5/dpmnAyxC50MD4shm/2nN9Wb9/dPkoOAw5yN4jHUv3T1w1C9irpeMrFnA7
         wWJfo8P+349AuK4BK4QodIBXxvODYduC+Pmhb9U1+nuMLnqcqlmuWKvGn8jK8AZwTuVa
         sHvA==
X-Gm-Message-State: ACrzQf2rlu7AReknnENXXFQuKrWR//LTj6DGmgDn78LKjj9EKivUrbqg
        It6ynCroIGjL7SMUhKD9TcIzDw==
X-Google-Smtp-Source: AMsMyM4ouTC6k78k0zJ5Sr/Ut50/Or91iMtjWYSsC14RJtpDGhNaaNlcN1i/7Hqm3Wolc+Naf3Bxug==
X-Received: by 2002:a05:620a:6015:b0:6fa:3f1e:7220 with SMTP id dw21-20020a05620a601500b006fa3f1e7220mr15881541qkb.236.1667526633098;
        Thu, 03 Nov 2022 18:50:33 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:da2a:9e7e:ddb5:dfa1? ([2601:586:5000:570:da2a:9e7e:ddb5:dfa1])
        by smtp.gmail.com with ESMTPSA id f10-20020a05620a408a00b006fa63cc7affsm1939677qko.34.2022.11.03.18.50.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Nov 2022 18:50:32 -0700 (PDT)
Message-ID: <7e7e966f-8d5e-8d86-60d5-b65ef0b2514a@linaro.org>
Date:   Thu, 3 Nov 2022 21:50:31 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ds1307: Add support for Epson
 RX8111
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        glazveze@delta.nl
Cc:     linux-rtc@vger.kernel.org,
        Mike Looijmans <mike.looijmans@topic.nl>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221101083123.11695-1-glazveze@delta.nl>
 <Y2REHDAHFNJIUbL4@mail.local>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y2REHDAHFNJIUbL4@mail.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/11/2022 18:43, Alexandre Belloni wrote:
> On 01/11/2022 09:31:21+0100, glazveze@delta.nl wrote:
>> From: Mike Looijmans <mike.looijmans@topic.nl>
>>
>> The rx_8111 is quite similar to the rx_8030. This adds support for this
>> chip to the ds1307 driver.
>>
>> This adds the entry to the devicetree bindings.
>>
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> 
> The SoB has to match the sender address, it took some time to me to
> understand this was for the same person...

Ugh, so who sent it?

Best regards,
Krzysztof

