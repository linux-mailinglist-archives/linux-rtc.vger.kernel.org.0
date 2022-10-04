Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E345D5F4085
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Oct 2022 12:03:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiJDKDk (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Oct 2022 06:03:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230081AbiJDKDg (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Oct 2022 06:03:36 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24BCE237F1
        for <linux-rtc@vger.kernel.org>; Tue,  4 Oct 2022 03:03:33 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id d18so7335873lfb.0
        for <linux-rtc@vger.kernel.org>; Tue, 04 Oct 2022 03:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=9SELAMyKC4dIu8Fc+EwbXLigKQFbrk8zZOdav0g9OjA=;
        b=QP5bSue6jebiSbdCiOT8Fr9V0YLZoFm3HCA98bU3fSdLjZJLKDesxS+sCI08phzRwQ
         GKzmmNnwwz0BLRyn7fiHPhXdMz1tY1Gfcw3ipZs3hBPnuQVDhdmj3mwLPtjHVapJce5H
         stVrMg7G+Le2qYNYc5jypYs3x8Ldya4b6aog0lV10ObVq7ruTOtNBu98ukIzfSXjahGi
         cxNKkYz9tCG7mpi9SmmyeB52nQB+x+lN9Tc1tZ9OC7A80RuXBprXxTMn3EZ5ICZYprMT
         61xV7BDHfkh4FIAmpx2zTokXf+S/lwQ6YroTSxl1iqW9FM/VoM7B24gvjMD8dhvfGrlQ
         HuzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=9SELAMyKC4dIu8Fc+EwbXLigKQFbrk8zZOdav0g9OjA=;
        b=YvQW0PRCWXdbQh/RtuKMMCpXJR2YecxNP+0muYYIZLJwTXGLQoSh9U0kIKXPArVaCT
         /b7FCBmk0ixVgWid9U8MVpj6zq9+YAQSeE7XQlg+cPoDjzERwvBq5Lfb0UqwajahUBnN
         sWYiQ4gHGW8FKN3/I3Ou9ELZZ7yt3L8JAZ98zpDTtYA6gr/Wqdht9jcTp3b0MpcWtifa
         j/vhbnCroycYTCFY0Cc2vP5UJ/HvmK7OD2WG/ss3y2S/9w5VUIiSmL8E9zNu6f8aRBwe
         rJPB36H8E8/VWV/CucOAxG9cbdE98E6HeW8xD0wdjzCtIOViM0W0I2bpl6lDFXnBkDIh
         GVOw==
X-Gm-Message-State: ACrzQf33OcWw591mEVDcmHrRy1ZRko7oIqI+fkgsa9iT56V5AQ42bKr1
        rhC0j2LZSQLjeIivlzbuTxQAwA==
X-Google-Smtp-Source: AMsMyM7/Y5FRX1kaf7XUsdyciEKQROP+grXcIwj7bLFhn5Sl5Jqs5Xvatl2ZOFKnSxgZ3qMkLCXtXg==
X-Received: by 2002:a05:6512:4011:b0:4a2:5148:9e48 with SMTP id br17-20020a056512401100b004a251489e48mr1014180lfb.337.1664877811320;
        Tue, 04 Oct 2022 03:03:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z13-20020a056512308d00b00499b57032c1sm1845798lfd.144.2022.10.04.03.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 03:03:30 -0700 (PDT)
Message-ID: <cf1d4963-a8bc-76bc-ee4e-532c6430b643@linaro.org>
Date:   Tue, 4 Oct 2022 12:03:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 05/11] dt-bindings: mfd: qcom-pm8xxx: document
 qcom,pm8921 as fallback of qcom,pm8018
Content-Language: en-US
To:     neil.armstrong@linaro.org,
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
 <9937c13b-f10c-32a5-49d9-1c9c16fa58e1@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9937c13b-f10c-32a5-49d9-1c9c16fa58e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
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

On 04/10/2022 11:38, Neil Armstrong wrote:
>>> +        compatible = "qcom,pm8018", "qcom,pm8921";
>>> +        reg = <1>;
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>> +        interrupt-controller;
>>> +        #interrupt-cells = <2>;
>>> +
>>> +        interrupt-parent = <&tlmm>;
>>> +        interrupts = <33 IRQ_TYPE_EDGE_RISING>;
>>> +      };
>>
>> These two pmics are exactly the same (except compatible), so just keep
>> one example... unless both are coming from the same, real DTS?
> 
> It was mainly to exercise the fallback, but it's useless as-is so I'll remove in v3.

No need to test different compatibles.

Best regards,
Krzysztof

