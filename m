Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C721E5F3ED2
	for <lists+linux-rtc@lfdr.de>; Tue,  4 Oct 2022 10:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbiJDIv6 (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 4 Oct 2022 04:51:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230229AbiJDIv4 (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 4 Oct 2022 04:51:56 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7EED26498
        for <linux-rtc@vger.kernel.org>; Tue,  4 Oct 2022 01:51:54 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id y22so575995ljc.8
        for <linux-rtc@vger.kernel.org>; Tue, 04 Oct 2022 01:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=uGiILmiYg1M9WfKx8PdZUl0MXEfqaaVj3qebogNp8XA=;
        b=b/gA1aORj0ap1sPS8T2QhjWkj71yWvR+b7fqpTWEi4onljQTnGollVyUcvgkbSIQwW
         ciLFDdjAy6gmkhn71aGLIdgIL9SBLwGvRHJCvN7Azrkcq/IsY/XuHKA1KEKqmNnfsGtM
         1ohaBimDuavYVm8rO2p4+J3SWxkPGsCb1oeMVtD4JxinoanjJ/tBwqkGal95DyPVjc9e
         cC47IeU30xB0fUZTLXxOPSMflBAtWh/V44geHaPyXl7FgoEFT9AKVzFQsQTlkutdCl8J
         zQntgMuqByHCiJ9E2UazG0zNG/OlxQkezqpJz/tWTbCb9H28DLtmbqSE3vTdio96VZRf
         f25g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=uGiILmiYg1M9WfKx8PdZUl0MXEfqaaVj3qebogNp8XA=;
        b=JGH19C6I9uujWyyzcMBbNI4pjJPVS2+JWbJCqdejdSzA2odSvO4PFBjB6q8zepaWkV
         VGIvQZ14vGkaW4B3HNxcTO6KZrolXNDg28bd+zeJF2pbFR7sZaMiNw8AvRG7QSkVYyE6
         xTHwiCEUeP9Mw3COu9W/G6yg+grxug+/QaX38W0ZRhCwcWERT+kCZXOFUvpQPf2H95rZ
         +u9YWGNRfJ1acVYFLMqQEaA2ddRNgWsd5vnskKwFyR0JYnQbHffpHsZxKim03kD//XXp
         W2gvFZWO4pYaYJfD4daJRl6Py4f26R5q7Iq1U0+RI6PVc+9qSZH8uO+rvy18Mw+XbZ/1
         IQ3g==
X-Gm-Message-State: ACrzQf1WY0bmCZ0P0yTkwSiu8dZ3MyGrNn7dGWV9dHplmA30dgqb8WND
        kURIvupXR3g4Op8TXVltLGSEFQ==
X-Google-Smtp-Source: AMsMyM6IvtviVn4B4cxv4nxVOEucOOgOhoX9ZE2+BAl0dkpkbfSbBNMoihrnoGxH/DH0H1F1UvMjWQ==
X-Received: by 2002:a2e:2e14:0:b0:26d:d636:4972 with SMTP id u20-20020a2e2e14000000b0026dd6364972mr2958189lju.221.1664873513308;
        Tue, 04 Oct 2022 01:51:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k15-20020a05651239cf00b0049735cec78dsm1828872lfu.67.2022.10.04.01.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 01:51:52 -0700 (PDT)
Message-ID: <0145501a-f478-9479-f5ab-fe903d208cd6@linaro.org>
Date:   Tue, 4 Oct 2022 10:51:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v2 01/11] dt-bindings: arm: qcom: move
 swir,mangoh-green-wp8548 board documentation to qcom.yaml
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
 <20220928-mdm9615-dt-schema-fixes-v2-1-87fbeb4ae053@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928-mdm9615-dt-schema-fixes-v2-1-87fbeb4ae053@linaro.org>
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
> Document into the main qcom.yaml as conversion from swir.txt to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

