Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E1B52515621
	for <lists+linux-rtc@lfdr.de>; Fri, 29 Apr 2022 22:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381085AbiD2U5X (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 29 Apr 2022 16:57:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381068AbiD2U5W (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 29 Apr 2022 16:57:22 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00F37CC518
        for <linux-rtc@vger.kernel.org>; Fri, 29 Apr 2022 13:54:03 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id n10so153855ejk.5
        for <linux-rtc@vger.kernel.org>; Fri, 29 Apr 2022 13:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8ijMUHM6BZmaa7c0hm3mqC8JYHeyH09dTjrvSxZy1BY=;
        b=jDZcRUA3YzPLHYV5bc8rvjIuyIhPN6BMCalJK0LvbKoFfLp8PIrNIwur1Crf2WZqx/
         lEcirE4D5zqId9wjGmYP+xL+MSyb/DO7h3ILtI0cO2wiFNhb5Uv0jNIXYpKoP6VpyyJI
         Hf7qNN32GMy6FdJvONI4uSRYmi4G50C/xuQS4uo1uiZsBpMYNqk2RPbzIG+oUfV0iOke
         GfF0i7cGnflrgrn++seNwA+YI2Hn/RkkZS57sn/7q1e3AgpxcrMSnt/oSSY8GiVjo1c4
         Bs0up1vL/19NSFtazp9B2WY0//RTnNc8V9LYU24i8mPVrFBqGg2lOG/3tclkKOYyg96S
         VDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8ijMUHM6BZmaa7c0hm3mqC8JYHeyH09dTjrvSxZy1BY=;
        b=BYenjV/rHpTjkXP4OPGukk7FjHsXyiKg1gWbfhCVEIaZ+A3Hd8HDm7k6L+XnjY/LDQ
         U5ghv1CrPKDrajqeydHvoalyuKXnjJo9WHR1dhl3NOCkVVsfbafODxJBIkha8fC1EKgI
         eyQpp6C1ydOP6rlowIEq6VPCG6q8siLWOkpjcF+5a7nldOjRkbEQPXfXgfYxi+XII0iB
         EhnS4zvBDPzFLwEw3EVXJSkPGulzt4lcf+6CEfDCRz5fFT/zRIILC9ePvnoK8QaYlsmI
         ZaCj9b9dx7luqeEELW7gILkZGLwVUwvUUUHB9xLnvErIWJ/JT5P87fNwo3zs+kGMMD6E
         mztA==
X-Gm-Message-State: AOAM531hu0ggQpvvn6Zqsk5WQX12cN1kFVR2DrbNHNX16F7xf6kv5UCi
        Xf9mTn82ZSKDfPRyqCUe5aEW9Q==
X-Google-Smtp-Source: ABdhPJyEiU/AYnt4FO/n9XbiqqNZdHoU6dwECTZ1TVLYSRRs21KAKVHRfb4kQfHEM4Oa1Qws3c12bw==
X-Received: by 2002:a17:907:eab:b0:6da:8ec5:d386 with SMTP id ho43-20020a1709070eab00b006da8ec5d386mr1070959ejc.668.1651265641594;
        Fri, 29 Apr 2022 13:54:01 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id gv19-20020a1709072bd300b006f3ef214df4sm991090ejc.90.2022.04.29.13.54.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 13:54:01 -0700 (PDT)
Message-ID: <069b274d-1460-cd70-89f9-6abda4e3b4fa@linaro.org>
Date:   Fri, 29 Apr 2022 22:54:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 1/1] dt-bindings: rtc: mediatek: add mt6358 and mt6366
 compatible
Content-Language: en-US
To:     Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuchen Huang <yuchen.huang@mediatek.com>
References: <20220428092726.25814-1-allen-kh.cheng@mediatek.com>
 <20220428092726.25814-2-allen-kh.cheng@mediatek.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220428092726.25814-2-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 28/04/2022 11:27, Allen-KH Cheng wrote:
> Add mt6358 and mt6366 compatible in devicetree-binding document for
> MediaTek PMIC based RTC. mt6358 and mt6366 use same compatible data
> to store RTC_WRTGR address offset.
> 
> mt6358-rts should be used as fallback for mt6366-rtc.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
