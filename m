Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 525A2775EED
	for <lists+linux-rtc@lfdr.de>; Wed,  9 Aug 2023 14:28:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbjHIM2n (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 9 Aug 2023 08:28:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjHIM2m (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 9 Aug 2023 08:28:42 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDE821FDF
        for <linux-rtc@vger.kernel.org>; Wed,  9 Aug 2023 05:28:41 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe58faa5cfso8533228e87.3
        for <linux-rtc@vger.kernel.org>; Wed, 09 Aug 2023 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rasmusvillemoes.dk; s=google; t=1691584120; x=1692188920;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QsLyX7zpGoNmiJX8dl6thb9GIjDmEzzddzjEZFA1Qso=;
        b=Cjd0U2oFb1GobPQLzDCPQXG5BeoEuRTwVIb8fkOBoRfnBfDYBRmUf79JhV9RMk4Lw4
         kI/9xJckpRWCIMurcyuGLalgMRfbiy42XN/JU7SocIKLNQT5+9MkbhWMJJdoE2MPNIXd
         CSuCkskSqlTf4iNfEDSApK7h/6+A0w06xcqjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691584120; x=1692188920;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QsLyX7zpGoNmiJX8dl6thb9GIjDmEzzddzjEZFA1Qso=;
        b=a98+Sq9IB0j/Xz54LMkf/9jG1MwzPdgE3UY1AiP/YRtgJjLG1opablaZIeFbZjW1HN
         lNCS9/gX7fAye49aJeKdE9cveKMyQqwG0dS2Z/tWnpoqwjNcuxn6dWKWt98rJkKjVZc5
         dcn+ZmVw2R+JfL+XwPkpKuQ3Q3tttcJ6dqjPL//+q8usLBf+FLKYpr2q+e2jI5Tgx0kD
         kOS09hUzyVTB+EAN1MPxEmW/DPEuUO+UKetWT7wiw/4v1938xQ1uot+dRkbtabwV5yTN
         0HBlFi6CpwDXWtnNN/1f49Kf1213wXgSvF+S5K+2PkflzSzQcqNCKO2dYvrR4BXXugKv
         OBDg==
X-Gm-Message-State: AOJu0YwFC/wTHcAhLfGqDUKoHSKk4uYb+L4XHTU6xelYcwahsUWYUVN5
        bP0LQ8EVMsuyOWmdYNP8W75nhw==
X-Google-Smtp-Source: AGHT+IFIoENCbS7ckSJPRqpa05I5EQB2dMmW/aNQcjOSGEfuuUz3J0Pp1IcZpn8XpabyAJjiWrtUfQ==
X-Received: by 2002:a2e:b2d0:0:b0:2b6:e7c7:b039 with SMTP id 16-20020a2eb2d0000000b002b6e7c7b039mr1575109ljz.28.1691584119953;
        Wed, 09 Aug 2023 05:28:39 -0700 (PDT)
Received: from [172.21.2.62] ([87.54.42.112])
        by smtp.gmail.com with ESMTPSA id q24-20020a2e8758000000b002b6fe751b6esm2719978ljj.124.2023.08.09.05.28.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Aug 2023 05:28:39 -0700 (PDT)
Message-ID: <79572bac-dfdc-ce32-2148-6fa3bf698267@rasmusvillemoes.dk>
Date:   Wed, 9 Aug 2023 14:28:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 0/8] rtc: isl12022: battery backup voltage and clock
 support
Content-Language: en-US, da
From:   Rasmus Villemoes <linux@rasmusvillemoes.dk>
To:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230615105826.411953-1-linux@rasmusvillemoes.dk>
 <55c19de0-2465-cc4a-6ec7-fd524816fd2b@prevas.dk>
 <739f81db-4ec2-fe07-a6df-5c1f42588653@rasmusvillemoes.dk>
In-Reply-To: <739f81db-4ec2-fe07-a6df-5c1f42588653@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 03/08/2023 08.45, Rasmus Villemoes wrote:
> On 28/07/2023 16.31, Rasmus Villemoes wrote:
>> On 15/06/2023 12.58, Rasmus Villemoes wrote:
>>> The current handling of the low-battery bits in the status register is
>>> wrong. The first six patches fix that and implement proper support for
>>> RTC_VL_READ.
>>>
>>> The last two patches allow describing the isl12022 as a clock
>>> provider, for now just as a fixed 32kHz clock. They are also
>>> tangentially related to the backup battery, in that when the isl12022
>>> is not used as a clock source, one can save some power consumption in
>>> battery mode by setting the FOx bits to 0.
>>
>> Ping. Any chance these could be picked up so they make it for v6.6?
> 
> Ping^2.

Ping^3.

Rasmus

