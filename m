Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 590706B029A
	for <lists+linux-rtc@lfdr.de>; Wed,  8 Mar 2023 10:15:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbjCHJPa (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Wed, 8 Mar 2023 04:15:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230385AbjCHJOu (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Wed, 8 Mar 2023 04:14:50 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C0BC97FF0
        for <linux-rtc@vger.kernel.org>; Wed,  8 Mar 2023 01:14:25 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id x3so62795837edb.10
        for <linux-rtc@vger.kernel.org>; Wed, 08 Mar 2023 01:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678266863;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WVlbKIsIKONcencGIlCVz/zMUTdvcvIEPXx7D+3nAjE=;
        b=LdA5rx163AC+HgqVyIy+sy0Gl2nZwk1NtVqeLbyS5v9JeajHfWzDBa611KYlhHeaDi
         ouXMK6QlKT4MdFQgjITg2J1sILL900Aotrlzbi01m1MOeSiDZWxCDKVWMVSTISylWC2j
         vMCOQdHCAF/3wxvSvMqdfjqZzaY6JEG05DNHC0+4ya97xSpTA42hEBVqk5alDM92V2/F
         EEVFlGMFMGn4FJ9wFPmNkvujBM6TWZxBRKW5wvDqwzg60t9TSEGjGnY+LtAbAPDrzIos
         pOLLFa0cfOUXLsOeWhVetUN10kUdFHIlhKVJ1p9sfy2dDuhaTQy6WchgcNxtXK3HP+GT
         Y/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678266863;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WVlbKIsIKONcencGIlCVz/zMUTdvcvIEPXx7D+3nAjE=;
        b=SY9m2YUSOl0zH1JFfl8v41jVlJ3cjhbNGEqlf3D0hvGdTyFzqipMzPdHcogredtQp7
         SdnzlclGc6wDjOwCCBu7/KkUIh2EmjMZnVUWJh7S6peDQqvNgF8ZCXpq6muIpQywKI9D
         ZmrQyTg3hWoEuOMbyMBSTTSDKS22lRR/h+I9s0/HT60wfkwwnm0K0fdJbO4L1IpwVoaE
         yITaOXdWlL8fyqaSR1ftP6vDv1w1VDJmr+ZiXC9xdSF4O/vHlC7zkR14h5dECEuFsbMp
         CK2ueSHxOEOFuJXOVZeyxHuUdbcdBbLJV/RKbVzrecbM2+XnyhMgJkAFSmk8eipb5xlw
         1qnQ==
X-Gm-Message-State: AO0yUKUQPC403wkHyU7dBAQQ6JEEAGwVDqpAtC9XdOBkVgMQyr6zU9XD
        XqZxx71PMJFkNL1ue80o+aJMxw==
X-Google-Smtp-Source: AK7set/5cil+g/8SOVvjrP1ln2Nvql2jHsS3WiDe7I+EHmOgynZqYeKxSssaFWa66dlwAxdmjzlPSA==
X-Received: by 2002:a05:6402:1291:b0:4ad:66b:84a5 with SMTP id w17-20020a056402129100b004ad066b84a5mr16082411edv.22.1678266863518;
        Wed, 08 Mar 2023 01:14:23 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:bba:fbfa:8aec:a133? ([2a02:810d:15c0:828:bba:fbfa:8aec:a133])
        by smtp.gmail.com with ESMTPSA id e21-20020a50d4d5000000b004d47ce55e57sm6241720edj.10.2023.03.08.01.14.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Mar 2023 01:14:23 -0800 (PST)
Message-ID: <06f8eec8-94f3-0fed-b496-831c77baf368@linaro.org>
Date:   Wed, 8 Mar 2023 10:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] max77663-rtc: pass rtc address from device tree node
 if exists
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20230308083759.11692-1-clamor95@gmail.com>
 <f1df5968-4322-3f67-3da8-c10ea50386a8@linaro.org>
 <CAPVz0n24odz4bxt8nRe08-UJFoaDSTGMAPfj2b2RBG+ZbwntfQ@mail.gmail.com>
 <190897d3-39b6-fb7c-dc18-dac580fadea6@linaro.org>
In-Reply-To: <190897d3-39b6-fb7c-dc18-dac580fadea6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 08/03/2023 10:11, Krzysztof Kozlowski wrote:
> On 08/03/2023 09:58, Svyatoslav Ryhel wrote:
>> I would love to, but max77663 uses max77686 rtc
>> https://github.com/torvalds/linux/blob/master/drivers/mfd/max77620.c#L123
>> how to handle this?
> 
> Don't top post.
> 
> Hm, so it seems max7763 is already documented via max77620. I missed
> that. Add the new property to max77620, not to max77686 RTC. It does not
> look like RTC's property, but the PMIC's.

To clarify - the I2C address selection for regmap is in max77686 RTC,
but I meant DT property.

Different thing is that we do not pass addresses as property fields.
These should be devices on the I2C bus rather... unless you are aware of
existing property like this?

Best regards,
Krzysztof

