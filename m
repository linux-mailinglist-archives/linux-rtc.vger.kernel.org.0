Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF43F60F78D
	for <lists+linux-rtc@lfdr.de>; Thu, 27 Oct 2022 14:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234870AbiJ0Mjg (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 27 Oct 2022 08:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234309AbiJ0Mjf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 27 Oct 2022 08:39:35 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDA2655A9
        for <linux-rtc@vger.kernel.org>; Thu, 27 Oct 2022 05:39:33 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id bk15so1912363wrb.13
        for <linux-rtc@vger.kernel.org>; Thu, 27 Oct 2022 05:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IQYjFvDXhbXoMSg3iLP8iixElFcJJq871depMmLi0sA=;
        b=tKuqhGzVH3uIi4Y08h0Jp1YREHQrrdGZlRj5vLVcqSofvi4XhmxK5HpuH+JnkInma0
         +tZqlwThXus4uDQjzvKwQH9rW9oCNxv0rpHbJAtSn1DFpFbazbC4vJzlOr19+BBE5ZWa
         JcWaG4V8BFk7my9mGY9A/Za9TPyKi2p2oinZhE06G2O10HGfNfAY/XYqI3LMOoyZKkfi
         v3NGPvCpkbQ8npQc9u8TwKgWO+udOYk3Ll2i5JBZsSucRIW597ne9dfStIwkgtto17FJ
         UcPmbQTcEP02z03tkw/vxc1zyt+ZyahXEZnOY/yxQbGqVGHzbpl205bqfgJWf1Aqdepa
         mLqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:reply-to:organization:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQYjFvDXhbXoMSg3iLP8iixElFcJJq871depMmLi0sA=;
        b=l3+WBv3XO6C9hZ1SEG6Pgn4PcCT2IQTHiq0hAeiGl4eLxN24j764zNJRzGOOqBYisF
         TOaw5jqrZoAGORHtxWftkiaQ0RCQ+PBviG11n52T/d1aL3MmgnNm8VChJ9Wmma6j61Du
         HWKHkCrQuboQ17ZoeFEuGqHeBzAEunVbzX5V5NFaZpfdBQLtctTyiR4/CkE/IwWtXyqL
         Lpt0eamAHVqDFg7lTTm4ekyiPNi/SSKYWi8qAvEvQDx0Ei/vbkO7DyH5X8/1GM2HZ6mZ
         BJIlSOtyLKsvEQgrVxGo87eu+fq/kdJpRL+JpNGF2yewM9EUpLeCzmFEF90VHOYDo2+E
         fLrQ==
X-Gm-Message-State: ACrzQf3jYcRog2FNXuUMKm4F4bwrXTj7E3OD2I/xxFowKZYKZ1cDY3F3
        JSdD511/bo8w1kRCVTo1k6szsqrU8YXs/g==
X-Google-Smtp-Source: AMsMyM5Cg9WCqUALY8m5StEnnOM0cPmGUujCLKConaYI90HOnBQn0GgQVa6cWEOdGz5Lmyqng1Q7Pw==
X-Received: by 2002:a5d:4302:0:b0:232:ce6b:40c0 with SMTP id h2-20020a5d4302000000b00232ce6b40c0mr31388788wrq.415.1666874372397;
        Thu, 27 Oct 2022 05:39:32 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:898:f380:1cb7:f7ba:a36e:de10? ([2a01:e0a:898:f380:1cb7:f7ba:a36e:de10])
        by smtp.gmail.com with ESMTPSA id m1-20020a1c2601000000b003cf47556f21sm4665594wmm.2.2022.10.27.05.39.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Oct 2022 05:39:32 -0700 (PDT)
Message-ID: <e8f53c8a-2842-9e6e-75bd-e099db3fe6f3@linaro.org>
Date:   Thu, 27 Oct 2022 14:39:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v4 06/11] dt-bindings: input: qcom,pm8921-pwrkey: convert
 to dt-schema
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Satya Priya <quic_c_skakit@quicinc.com>,
        Lee Jones <lee@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        linux-input@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
        linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-6-dac2dfaac703@linaro.org>
 <Y1o5hYAnBuf1akJ9@google.com>
Content-Language: en-US
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
Reply-To: neil.armstrong@linaro.org
In-Reply-To: <Y1o5hYAnBuf1akJ9@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 27/10/2022 09:55, Dmitry Torokhov wrote:
> On Fri, Oct 21, 2022 at 11:06:42AM +0200, Neil Armstrong wrote:
>> Convert input/qcom,pm8xxx-pwrkey.txt to YAML, and take in account that
>> the PM8921 pwrkey compatible is used as fallback for the PM8018 pwrkey.
>>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Should I merge this through my tree or you want all these changes to go
> together through some particular tree?

I have no preference,
Krzysztof will you take it and prepare a branch to Bjorn ?

> 
> Thanks.
> 

Neil
