Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 167CD629BCF
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Nov 2022 15:18:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbiKOOSJ (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Nov 2022 09:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiKOOSJ (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Nov 2022 09:18:09 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE3C21A0
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 06:18:07 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id g12so24681615lfh.3
        for <linux-rtc@vger.kernel.org>; Tue, 15 Nov 2022 06:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fjl1nyklvmbUWAqy2NCYV73rfZ4GVtAe9RZ6ef7L2Y0=;
        b=kktnKZbk/wYqI1XXAvaLTfAGHnue0EYLsoCc4n10GlO+qbBrqglGT0Zu/vESOvx0ew
         iMpg22+o0WdTD1coyylUUIsTezFd7/3h5mVoI8e8xhNF1bwnt9ZbB8rbltbLQet4iRvu
         DQjXbUA3jh8FTrpfbBUTnxDzOY+O3y9xV9RY2CfHKPMHjHK+kWSt1crMFNb80JVmsb1w
         WrmExEmJ7zve9/ucCN2xeRB43XI7Mi7I2QzXKUa093H2zVzvtfpBGeMRvq3hTqbkLA/F
         Hw3jPA/eD/hexsuk9a5hONbJOXi289XagRzVJN8sgTcPYovqmq9hvSz4s1kHrCdgpXGJ
         8o+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fjl1nyklvmbUWAqy2NCYV73rfZ4GVtAe9RZ6ef7L2Y0=;
        b=zuYCpy7EpJQlkISuS/0tF5wgun4i+nsQLWY5jZkjMS/GlPaMZ6u0QeruKzHb4wGsyk
         wFJbtgxbH6WYgu9/CjH/CPHDu61C3fxaWzhyz5oZAv14yYkjVlLemObS0k3LtWxNrwQW
         3pvv7jV7z99Jl4D9hRat+md5itmE0/xPLaVGgY76XMDEX5K/RQxr5HJGqBce7x3wCNqW
         o5DfuzilnGOSoBs9bzAdrlsRv2LT3YBrsM1oTnE3EQA/fyiWiRVgT5sgijwIgKDjVKah
         lxz/2vVeNcp8CbwXn3HgY7hpJ+cFy9L1Pfg+HH5yAz6pzVY5LHJdkotpqluril6b6BYG
         fvfw==
X-Gm-Message-State: ANoB5pmKZeedxKrYBOq53/OZXumTY8KqMdgCYzg39lwt8oTlB5LI+tMG
        q5op7qUJknHoAOOA1D+tOU7Aeg==
X-Google-Smtp-Source: AA0mqf5N00F5rAhEqY0apB6eFiFRPswarOnAVSPpRwwKMxwKjHmpmNxqwDSJHMbz3HdSxA2K7w+B5g==
X-Received: by 2002:ac2:4bd5:0:b0:4a2:776f:f3c6 with SMTP id o21-20020ac24bd5000000b004a2776ff3c6mr5425071lfq.302.1668521885588;
        Tue, 15 Nov 2022 06:18:05 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id x11-20020a056512130b00b004a608ec6d8csm2230929lfu.27.2022.11.15.06.18.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 06:18:05 -0800 (PST)
Message-ID: <c426918a-8d63-5c40-4340-6c918296814f@linaro.org>
Date:   Tue, 15 Nov 2022 15:18:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 5/9] dt-bindings: soc: mediatek: convert pwrap
 documentation
Content-Language: en-US
To:     Alexandre Mergnat <amergnat@baylibre.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Fabien Parent <fabien.parent@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-5-5d2bb58e6087@baylibre.com>
 <fe898d24-54fa-56bb-8067-b422a3a52ff5@collabora.com>
 <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAFGrd9r70XRd=4Ogei+U2QXQny7LhWr9bDCRNYco+Bsy+2XqrA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 15/11/2022 14:54, Alexandre Mergnat wrote:
> Hi Angelo,
> 
> Le mer. 9 nov. 2022 à 10:55, AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> a écrit :
>>
>> Il 08/11/22 19:43, Alexandre Mergnat ha scritto:
>>> +maintainers:
>>> +  - Alexandre Mergnat <amergnat@baylibre.com>
>>
>> I say that the maintainer for pwrap is Flora Fu <flora.fu@mediatek.com>....
> 
> Flora Fu is the driver maintainer. As described in
> Documentation/devicetree/bindings/writing-schema.rst:
> maintainers
>   A DT specific property. Contains a list of email address(es)
>   for maintainers of this binding.
> 
> My  understanding is this field is only for binding maintainers, but
> not related driver maintainers. Are we aligned ?

Usually driver maintainer should be also binding maintainer. You can
have more binding maintainers than drivers (and vice versa), but it's
less usual to maintain driver and do not care about its Devicetree
binding (unless driver is also for ACPI etc. but that's not the case here?).

Best regards,
Krzysztof

