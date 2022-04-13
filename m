Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0C84FF00A
	for <lists+linux-rtc@lfdr.de>; Wed, 13 Apr 2022 08:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232879AbiDMGpI (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 13 Apr 2022 02:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233086AbiDMGpH (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 13 Apr 2022 02:45:07 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E4A52C655
        for <linux-rtc@vger.kernel.org>; Tue, 12 Apr 2022 23:42:44 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bh17so1900091ejb.8
        for <linux-rtc@vger.kernel.org>; Tue, 12 Apr 2022 23:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=/UwqJ7jFAx2xAN59etXpM6qS154Frurdphc5YUeklY8=;
        b=t4iUnK/nwCZ7S7uR6c2lEC9PlLD2fg1dNtm3pnfhfZUi6jt6ikb/LMI0TUsfYz0oYA
         ++1stMVU1QxrOcf9aSqeZo3hmxQ7+sgMYda6Ir0kzYN1OZ0ZM93aF37k5s6RB/BuwbRh
         42TbyJdZowP18rZMjuPqrKdc4u2IPWXC0BZG0W7tTussRqp7LCj/ehu6K493QHOrLeiX
         n52MhVH/h1JI8CGN9tyjZOGsjboAtJd0zAvB2Xm6xGx82Y+x+Qpl70Nq/mbIe59goi9+
         T7Hil8MYHzC+8KTGbl5tp0HdavKqkdMTLUVc7WPExKZocL3acuWdbWZI0ivSNawn06z+
         dU7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/UwqJ7jFAx2xAN59etXpM6qS154Frurdphc5YUeklY8=;
        b=qbpMaCppVRcjIKJzA2yMhAZ02GtpTU8Y5oVdvTraRXSyXC5dWJr1TH2qp1EyYswypN
         pB3vYWuC/UklMFr52xfhu2dtK5FKtY4DxPQABe/IiLTeknPPlDvPY+wDuzjgpmPzwCUe
         2csieJ8eNL32TwNpEfn80iNrDvZTUeAx7CYLj1C889wJNAxEZ4oKpqE3OWdOVEk7TE2C
         A38kPR1dqP6+ZoPT9Uiohks5agYjyNGVPoJnjkf/LEXif+IysMlkhUykaus5uQv3EfUB
         BsED1VZZ3uSj9mAjsnvf4f8TYeG4fvAuykYHnUGOkH+8YA5wP4WSNrQrCwpiTusTs8MP
         YCbg==
X-Gm-Message-State: AOAM531nTITVrRz90wfMZNe/1wYhou0V9itycMarRhEiZ2MgY+D1tVSz
        14UV3xAlLRfNdAUEVcM4Rao7GA==
X-Google-Smtp-Source: ABdhPJxxHLFQOL8h8JHlJ/w+9pXq3bUQbvkcGLhlMloBwXx7nSIfSSFHXmBL+ApPYEUK9YOx4Ty8Qg==
X-Received: by 2002:a17:906:18b2:b0:6d0:ee54:1add with SMTP id c18-20020a17090618b200b006d0ee541addmr36625058ejf.499.1649832162725;
        Tue, 12 Apr 2022 23:42:42 -0700 (PDT)
Received: from [192.168.0.201] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id wc6-20020a170907124600b006e8816ae3a3sm3952139ejb.125.2022.04.12.23.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 23:42:42 -0700 (PDT)
Message-ID: <2609cb4e-df0e-f4b5-b89f-37287bbc569d@linaro.org>
Date:   Wed, 13 Apr 2022 08:42:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] dt-bindings: rtc: Add TI K3 RTC devicetree bindings
 documentation
Content-Language: en-US
To:     Nishanth Menon <nm@ti.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20220412073138.25027-1-nm@ti.com>
 <20220412073138.25027-2-nm@ti.com>
 <dee496ce-5e74-4a53-c783-6420b2391387@linaro.org>
 <20220412221743.vbectb4bcghau2b7@confider>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220412221743.vbectb4bcghau2b7@confider>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/04/2022 00:17, Nishanth Menon wrote:
>>> +  assigned-clocks:
>>> +    description: |
>>> +      override default osc32k parent clock reference to the osc32k clock entry
>>> +    maxItems: 1
>>> +
>>> +  assigned-clock-parents:
>>> +    description: |
>>> +      override default osc32k parent clock phandle of the new parent clock of osc32k
>>> +    maxItems: 1
>>
>> Usually assigned-clockXXX are not needed in the bindings. Is here
>> something different? They are put only to indicate something special.
> 
> I wonder if I should rather use unevaluatedproperties instead? If I use
> additionalProperties: False, then the second example below fails.
> 

Are you sure it fails? I just checked and it worked in my case. This
AFAIR was working since some time (or fixed some time ago), so maybe
update your dtschema?

Best regards,
Krzysztof
