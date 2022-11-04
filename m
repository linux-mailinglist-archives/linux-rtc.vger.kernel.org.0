Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B78CC6196BC
	for <lists+linux-rtc@lfdr.de>; Fri,  4 Nov 2022 14:00:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbiKDNAU (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 4 Nov 2022 09:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230111AbiKDNAS (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 4 Nov 2022 09:00:18 -0400
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF2C02AE08
        for <linux-rtc@vger.kernel.org>; Fri,  4 Nov 2022 06:00:16 -0700 (PDT)
Received: by mail-qt1-x82a.google.com with SMTP id cg5so2916927qtb.12
        for <linux-rtc@vger.kernel.org>; Fri, 04 Nov 2022 06:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bFpQCadTyIsWPC8ZvakL35Sz4lN0dUg6OCrbiBJiJMY=;
        b=M3qHUaYjtRED3PJfzDZTsLy6vTK34OO6CuLE4i6mq8Nu3EJKoiKU1SZY9nrRUMsxj3
         ItO1LuieW0RRu8veYCbJyiN5aZJ7HXWRTk0hq9r+R/bMSWc/7mqGGJD464BKAvbwO4EF
         hIwVpL8dNxvXxgfJ9Rkm+MU+jqLF9FTIX9cIYd/0JRmYb6JAznnRpa0L8Vci2XmszgwL
         aO7pFj88c7xv/ueq2F/e75rBg+9TrYn3ynbNAAPXhivV72Q8QTyJGjFzSdNVJrCxaN9g
         n3lksbYmSYrIP3R1udDp6DkpLnWEz0vUQBZg8gI5du668CNZT/vhX+PsUkjmb35CE/xT
         BOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bFpQCadTyIsWPC8ZvakL35Sz4lN0dUg6OCrbiBJiJMY=;
        b=5oBu60antH3+Pe2YETts541moy5TxYj5TCs7bLCoJSckB156fE3Rw6bmGghDxLsYiE
         MlSRD0CVuOs0nfloxcs9ruNi6+JZL2Cfi1AaKmWhsgiCwhwWu5pHpKaq3CiZsuH6ETiV
         Dngf6TdlT1oqvG7wFPJVAhlgmFasYIC3Qasc25N3oLRVVcf/66kmshlhW1x0OeFMDnRM
         EAT6Dibnw+iYO7YNdQq1qD5MSypcBI+xLQ9xlGudaIqh9j6rPGzeGaMMcHs5VqcqTFhD
         nLiHvNe9nEuw8A1F9kY7ca3WMolqRmSkuSYxsmcIoE91VEXlz6rLfD19T7BAcvxTsfDV
         pWlg==
X-Gm-Message-State: ACrzQf1E2qHwoPXq+kTiyBLY4fL2klyXYUMg6I97LbqcA4H5055xKBYP
        7zhrmbFmYgq2eLqpquUJquwMLA==
X-Google-Smtp-Source: AMsMyM5ld/AlGBhlvD0bck0A+ufPXGrJxD21JxV2jVmusXYqv8hqnASTMf9OMJ0PsLX1okEpE6XOPw==
X-Received: by 2002:ac8:709a:0:b0:3a5:732b:db90 with SMTP id y26-20020ac8709a000000b003a5732bdb90mr572266qto.517.1667566815387;
        Fri, 04 Nov 2022 06:00:15 -0700 (PDT)
Received: from ?IPV6:2601:586:5000:570:aad6:acd8:4ed9:299b? ([2601:586:5000:570:aad6:acd8:4ed9:299b])
        by smtp.gmail.com with ESMTPSA id s8-20020a05620a16a800b006ed30a8fb21sm2794654qkj.76.2022.11.04.06.00.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Nov 2022 06:00:14 -0700 (PDT)
Message-ID: <aba2e9ff-413c-82ff-cb17-6b8d6eb75823@linaro.org>
Date:   Fri, 4 Nov 2022 09:00:14 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: rtc: ds1307: Add support for Epson
 RX8111
Content-Language: en-US
To:     Mike Looijmans <mike.looijmans@topic.nl>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        glazveze@delta.nl
Cc:     linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221101083123.11695-1-glazveze@delta.nl>
 <Y2REHDAHFNJIUbL4@mail.local>
 <7e7e966f-8d5e-8d86-60d5-b65ef0b2514a@linaro.org>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.37681389-32fe-4735-beea-f7f137eb7fff@emailsignatures365.codetwo.com>
 <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.0d2bd5fa-15cc-4b27-b94e-83614f9e5b38.e3306698-ebb5-4500-8c99-409c9fe9831a@emailsignatures365.codetwo.com>
 <c313e8ba-e44a-66aa-3577-31b5df728e90@topic.nl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c313e8ba-e44a-66aa-3577-31b5df728e90@topic.nl>
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

On 04/11/2022 02:20, Mike Looijmans wrote:
>>>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>>>
>>> The SoB has to match the sender address, it took some time to me to
>>> understand this was for the same person...
>>
>> Ugh, so who sent it?
>>
> 
> I did, but our company mail server is incapable of sending patches (it will 
> have mangled this mail as well), so I sent it from a different provider.
> 

OK, can you configure then other provider to use your full name (so it
will match full name in From and SoB).
Best regards,
Krzysztof

