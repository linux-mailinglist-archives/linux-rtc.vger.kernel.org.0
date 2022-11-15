Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB7766292C5
	for <lists+linux-rtc@lfdr.de>; Tue, 15 Nov 2022 08:56:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232466AbiKOH4q (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 15 Nov 2022 02:56:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231822AbiKOH4p (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 15 Nov 2022 02:56:45 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C529183A9
        for <linux-rtc@vger.kernel.org>; Mon, 14 Nov 2022 23:56:43 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id c25so16466690ljr.8
        for <linux-rtc@vger.kernel.org>; Mon, 14 Nov 2022 23:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iGzuwjjstlcwuMUa36bDWReUFFk+zmR6YNeVeZ7AQTg=;
        b=tMC9nv+8Etx4jSCXg1bs+XUP8414/Y5UzW0+KXcleaCm4/BsnPlOQF+fJPKQkL5Ri8
         rmBRJ4F30dJlrtTRVz07WFmZM2C5SeMhTYqI9X+299I4R34N+zBwrA5wRXzWlxV99WeZ
         AK2CE+0bdvVq7pg+UYSTiwn64fsVagrpG4Nxr8hzMpPx4QAueu3zDs7SfAyb1snLcPTQ
         99qAelIcyY4mGFrdlRiaQIMG60RggSqqtZxx8wuxUBodLG4wTd5MZPSbfTov+ghJ5sKU
         k1BsScRkU9ecejRnm7mAygXNVafa7rIguPqtr+LI0u56viP06e9R6L+6MfDDWgCTx0DM
         bKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iGzuwjjstlcwuMUa36bDWReUFFk+zmR6YNeVeZ7AQTg=;
        b=04peZwvpN0NKENaIpiGRbf7DoB/l86Zhiz1OXBQY6Vl9UAqHw/Gsb6ospkO+L5dODF
         yhiqXKOvjhbWt/l+6uIYmIHDBYsPADbUpqt3YoUndawlmUwaKQXH9qa/tol/Kfw0+5V3
         eq+d6Zx3ysYOTpiKNtTuap6lmCqdwcXmfXbROGZ6PEC3PuQ53L5f72yW8dEJpvkhMlbR
         E3u3gX0cmC1qrxQ71kAsB065hdavbPMPTu1UW2fpCKldi76jsrufP0KT83gGrMjhf8/V
         lEt9+lMQTmaX9FK2MbB2CHbfzO4T+tE1HU9RL23PoHXcQxEembRTR7iLLbmISQ0VsyLo
         t7tg==
X-Gm-Message-State: ANoB5pmB4HHnuTfw5XO1kxoUwdLCHz8uCe7GkMkKOCP+jnfnlmdB+Trk
        GEZPxSpNClS25QmDixNNs15Kh5YvU/9NlIwx
X-Google-Smtp-Source: AA0mqf5+gjlHpOyr+vO/XgUJl4vyreJytarqzOI+bFglrS81lTEX5gXTw+x20Hc65HxE/f6KgWnIEQ==
X-Received: by 2002:a2e:b53c:0:b0:277:890a:f1cc with SMTP id z28-20020a2eb53c000000b00277890af1ccmr5377138ljm.395.1668499001885;
        Mon, 14 Nov 2022 23:56:41 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id l10-20020a056512110a00b00499b19f23e8sm2095497lfg.279.2022.11.14.23.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 23:56:41 -0800 (PST)
Message-ID: <37dc4e39-8033-a40f-edd7-4bd30f841e23@linaro.org>
Date:   Tue, 15 Nov 2022 08:56:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v4 2/9] dt-bindings: rtc: mediatek: convert MT6397 rtc
 documentation
Content-Language: en-US
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Rob Herring <robh@kernel.org>,
        Alexandre Mergnat <amergnat@baylibre.com>,
        Fabien Parent <fabien.parent@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Chen Zhong <chen.zhong@mediatek.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Pavel Machek <pavel@ucw.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Fabien Parent <fparent@baylibre.com>,
        linux-rtc@vger.kernel.org, linux-mediatek@lists.infradead.org,
        devicetree@vger.kernel.org,
        Mattijs Korpershoek <mkorpershoek@baylibre.com>
References: <20221005-mt6357-support-v4-0-5d2bb58e6087@baylibre.com>
 <20221005-mt6357-support-v4-2-5d2bb58e6087@baylibre.com>
 <20221109222916.GA2985917-robh@kernel.org> <Y2wwUOJ0KZdt1tZ6@mail.local>
 <adf8bc44-4cbc-af2a-4ec8-1859a98146d7@linaro.org>
 <Y3LHxDIzfZWhnQJN@mail.local>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y3LHxDIzfZWhnQJN@mail.local>
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

On 14/11/2022 23:57, Alexandre Belloni wrote:

>>>> As this is only a compatible string, just fold this into the MFD schema 
>>>> doc.
>>>
>>> Actually, it probably also supports the start-year property
>>
> 
> I checked and it doesn't support it but this needs to be fixed.
> 
>> What about rest of rtc.yaml schema?
>>
> 
> wakeup-source would make sense but the driver doesn't support it yet.

The question is about hardware - does hardware support waking up the
system via interrupt? This is usually a domain of PMICs which still are
powered on when system sleeps.

Best regards,
Krzysztof

