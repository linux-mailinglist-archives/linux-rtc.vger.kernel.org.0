Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 148F65F3EE7
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Oct 2022 10:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230398AbiJDIz1 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Oct 2022 04:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbiJDIzY (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Oct 2022 04:55:24 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB47F1ADB5
        for <linux-rtc@vger.kernel.org>; Tue,  4 Oct 2022 01:55:21 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a12so4550776ljr.7
        for <linux-rtc@vger.kernel.org>; Tue, 04 Oct 2022 01:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=qgfEsS672LrTseyT5QbF4DwYJHWOIb63rkhuEqwbjJM=;
        b=E8bWQMQT79SGtgHMxCL9c+8KbUuB/XACTRzEyE1Ux9ePZ+5nsdXejeNuAaAmq4aRl4
         NyRUgtPNnBv/r5byYrhTxfIBAE81sJNpTDr26fBU7Ni4fm0lwBjUo9ckAYaulRMxHcgH
         dqio3I9I2wHo3QmIK9Y+a4ZourAChNmNjLCh8aw9YAgW2gWg664OkuUKCJNSFtjBm8j/
         ID/P2h91gNI1C7uUUj/SjPH4B8thi1LlpzrwNa8XiZuvwjAx/t7N6tGo7uPOf3uJeabF
         XJ1/s2CPoauimJYM+jd35jSeDwLT/CbkE2BWaRmNR9k7ahKCTlNvLP0QTQHs43tCEEA+
         yeEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qgfEsS672LrTseyT5QbF4DwYJHWOIb63rkhuEqwbjJM=;
        b=LzGGVOoKW/0gmJP4IIzr3TxyzhWz9mjCNBCW0VOmwc6TBd/8JtrfzFBP5plZrfBCst
         IpZih9b7N/tfojgcXS9lBEdu5ZDVzS6WbRjHOCfMu6pHJKzdWxoaT3LiyFkBdN0iCOH9
         s13OzDnkVblG3Y6uMFEWhz2G+2/KklWIks8hoF4ftNpOyIMi0ZFURDbcAlpSw15dPzt9
         bcVZjuAsyCers5Os48QYrynxqWoovj/ET33jAUINwtUirmeFs03YLrGV3edb8Og6awNY
         6OsULWMZcTWQr9eBGkqF2S8t3Yjx1/QiDEKaKURLCVhEvqRMeZdcZip9PP19z5UzmVjZ
         hzng==
X-Gm-Message-State: ACrzQf3g6Y3XR8GJOtK1QiS7J5HMoSCD+owi8e3QWXGEToyrHlW4Tsxx
        hf+/VZwNvMb8IANZpekzdv7lkQ==
X-Google-Smtp-Source: AMsMyM7dY1q8NLmh5vfQzABOZZLANjj+1U9eLHWkGp3cg6nlBf7WgHHYrTrntPcDNffRplrUO0Oyag==
X-Received: by 2002:a2e:b4ad:0:b0:26c:24f:b260 with SMTP id q13-20020a2eb4ad000000b0026c024fb260mr7296151ljm.173.1664873720292;
        Tue, 04 Oct 2022 01:55:20 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id a37-20020a05651c212500b0026dc7b59d8esm1012399ljq.22.2022.10.04.01.55.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:55:19 -0700 (PDT)
Message-ID: <ebace2d4-9fcf-f50e-fee5-18199b63d90b@linaro.org>
Date:   Tue, 4 Oct 2022 10:55:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 05/11] dt-bindings: mfd: qcom-pm8xxx: document
 qcom,pm8921 as fallback of qcom,pm8018
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-5-87fbeb4ae053@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 04/10/2022 10:08, Neil Armstrong wrote:
> The PM8018 is used as compatible with PM8921 on the MDM9615, document this situation,
> and an example section to validate this change.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> index 61bd0b3ce02f..24d71918ff8a 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom-pm8xxx.yaml
> @@ -15,11 +15,15 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,pm8018
> -      - qcom,pm8058
> -      - qcom,pm8821
> -      - qcom,pm8921
> +    oneOf:
> +      - enum:
> +          - qcom,pm8058
> +          - qcom,pm8821
> +          - qcom,pm8921
> +      - items:
> +          - enum:
> +              - qcom,pm8018
> +          - const: qcom,pm8921
>  
>    reg:
>      maxItems: 1
> @@ -52,4 +56,35 @@ required:
>    - interrupt-controller
>  
>  additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    ssbi {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      pmic@0 {
> +        compatible = "qcom,pm8921";
> +        reg = <0>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <32 IRQ_TYPE_EDGE_RISING>;
> +      };
> +
> +      pmic@1 {
> +        compatible = "qcom,pm8018", "qcom,pm8921";
> +        reg = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        interrupt-controller;
> +        #interrupt-cells = <2>;
> +
> +        interrupt-parent = <&tlmm>;
> +        interrupts = <33 IRQ_TYPE_EDGE_RISING>;
> +      };

These two pmics are exactly the same (except compatible), so just keep
one example... unless both are coming from the same, real DTS?

Best regards,
Krzysztof

