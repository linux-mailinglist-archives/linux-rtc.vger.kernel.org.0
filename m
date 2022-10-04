Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 856FF5F3FFE
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Oct 2022 11:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231376AbiJDJlr (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Oct 2022 05:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbiJDJl0 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Oct 2022 05:41:26 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5BD85A3D7
        for <linux-rtc@vger.kernel.org>; Tue,  4 Oct 2022 02:38:07 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id bq9so20430757wrb.4
        for <linux-rtc@vger.kernel.org>; Tue, 04 Oct 2022 02:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=w/jnvOzh6Nm6auASOsenLdYqfQP4eJIKrsHZXL+ia8g=;
        b=S6emkqURkc/CNrKv84/nWjP68IeGyMkcV7Se8543+Fte+ZAcYubSZCZkDrUWaDiOu3
         lFXqoZt15o3SbSlo5Ef+9A+zM9xr6nsd+Jfwh3bFJD+8JbxQ/9ReIGHRFoAtmgb7DQ2j
         qAjnL7vlZJK81G3DSe0oBVo+fOkaRRZV7URlGhEsxXyyxOkUr0+m07kojl8sIWO262ma
         EXCheUOmyh5TptAsgKWfho1/xjElcQoXOUqE9a7e797XmmqnqyZsz0/57xgVsE4GL7MH
         dqt+bV6P1FccWWq2UpwITH5n4r6QuTmxjIoVHbcMY1wb3KdVG9gUUbDik1lkTOM3YWyS
         ECVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=w/jnvOzh6Nm6auASOsenLdYqfQP4eJIKrsHZXL+ia8g=;
        b=CeoWIuw196Ju/Nyu+/p0uSl4X14NZITmkLGduycbSeqWHtvCcdwwJlk6LRduTqye6Q
         vF09aTwpTlG1vXcHh010vPReAocuP3fBKB0ZtvEhj1VBemKxCa8y3n0L5dhLEHayzgRP
         ReK2NAr/Z2AHPMUbcxBR71aMt9s/dnuwUz/v1s53+thdaa2mvGsEmqG5qF7iTialdRSO
         5lJ5Gwiap0wJdXxv+lzvb+wdTHKdHsjbREkZUn7SuQSHbXDS7zwIG17oxM0eae9E4nlL
         twNwLrE1LqbN1amyXpau3JCrp7ry0pOlGUzNwTqXk/dL4zIHaLiOySulzBi7thRLGv2T
         Bv9A==
X-Gm-Message-State: ACrzQf2cnPxYa8GcYprVQ5Npq3wPzUHlbKmcGp2vXqNYn6anWoYsHpjF
        aseqXCK7plaGCnKO3LHomZZtfw==
X-Google-Smtp-Source: AMsMyM7tCWkt9va9vIziyAHCYuNBZhfPVE9Wbo7e5DX7PX9AQbLIXFEu4qFKjcu5KE+6uQRLXJYyJw==
X-Received: by 2002:a05:6000:1786:b0:22e:3955:13a1 with SMTP id e6-20020a056000178600b0022e395513a1mr6356512wrg.624.1664876286047;
        Tue, 04 Oct 2022 02:38:06 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:58f1:548b:1390:4070? ([2a01:e0a:982:cbb0:58f1:548b:1390:4070])
        by smtp.gmail.com with ESMTPSA id a14-20020adfed0e000000b002258235bda3sm11871248wro.61.2022.10.04.02.38.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 02:38:05 -0700 (PDT)
Message-ID: <9937c13b-f10c-32a5-49d9-1c9c16fa58e1@linaro.org>
Date:   Tue, 4 Oct 2022 11:38:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 05/11] dt-bindings: mfd: qcom-pm8xxx: document
 qcom,pm8921 as fallback of qcom,pm8018
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alessandro Zummo <a.zummo@towertech.it>
Cc:     linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v2-0-87fbeb4ae053@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v2-5-87fbeb4ae053@linaro.org>
 <ebace2d4-9fcf-f50e-fee5-18199b63d90b@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <ebace2d4-9fcf-f50e-fee5-18199b63d90b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/10/2022 10:55, Krzysztof Kozlowski wrote:
> On 04/10/2022 10:08, Neil Armstrong wrote:
>> The PM8018 is used as compatible with PM8921 on the MDM9615, document this situation,
>> and an example section to validate this change.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>

<snip>

>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +    ssbi {
>> +      #address-cells = <1>;
>> +      #size-cells = <0>;
>> +      pmic@0 {
>> +        compatible = "qcom,pm8921";
>> +        reg = <0>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <2>;
>> +
>> +        interrupt-parent = <&tlmm>;
>> +        interrupts = <32 IRQ_TYPE_EDGE_RISING>;
>> +      };
>> +
>> +      pmic@1 {
>> +        compatible = "qcom,pm8018", "qcom,pm8921";
>> +        reg = <1>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        interrupt-controller;
>> +        #interrupt-cells = <2>;
>> +
>> +        interrupt-parent = <&tlmm>;
>> +        interrupts = <33 IRQ_TYPE_EDGE_RISING>;
>> +      };
> 
> These two pmics are exactly the same (except compatible), so just keep
> one example... unless both are coming from the same, real DTS?

It was mainly to exercise the fallback, but it's useless as-is so I'll remove in v3.

> 
> Best regards,
> Krzysztof
> 

Thanks,
Neil
