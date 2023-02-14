Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9DC7696328
	for <lists+linux-rtc@lfdr.de>; Tue, 14 Feb 2023 13:11:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232179AbjBNMLM (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 14 Feb 2023 07:11:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231998AbjBNMLK (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 14 Feb 2023 07:11:10 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3440E252BD
        for <linux-rtc@vger.kernel.org>; Tue, 14 Feb 2023 04:11:08 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id az4-20020a05600c600400b003dff767a1f1so11407576wmb.2
        for <linux-rtc@vger.kernel.org>; Tue, 14 Feb 2023 04:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Qsynl3c9/exYqhLPLTij4MAPZSOa6fQ7e/dqK8dTCZ0=;
        b=W9sTwdj2pV5LIk3e6/BPE2u1/eTeScATB64+gHn9slsGT0anYgRR0ZwF4l54ITSpcV
         T8jCVPAkmeRBahfFuidj19A+i8cUn/fTA4wm6hqcPK64zXZRSfMJu0HmVXt/vTjxIN2d
         poV+H6L/ldgxKbp3q3rrZaPaLSNIBByuzY7iwwzJwsPBcYKio/30MPBrLDCIJ3PjvHES
         xWAMVG2g2ZxQqgfHDolxRKgramMuWbNK513EgSwH9hmJbsfLaeX6+9NXFFYAFPAWeQnn
         x8MzRHgwGF8JN5N375ARONwA41K7vDnqwPMs+h0iViMPVDk6JAaAJgvixF9bfbHf5wiV
         VlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qsynl3c9/exYqhLPLTij4MAPZSOa6fQ7e/dqK8dTCZ0=;
        b=0iLQ1bggy9e63fG1eh+WzRH+EKLfNorzRUQ1BbBlIeQJ9UwKK+2IWToeuPXcAQL9m+
         c4R/apH70PFigO7vnzOsCZbE878fSzF9awAkYIyuWMbCnPpoW2Tkc6CzA6P8DajAj0rB
         iLHioyxGyad/5kpEdoUPnCNnGE0IQS4d7wiMkhOF1npZ399jqUJPea0ET+8z+2MWySzw
         VxO340ggQ38EjGuk4MFW54cS1j8tU3MxMT+LDxTr8gocq8Q+L5+f+lul/KoBs45VBg/S
         /9wasHnJlpqDlGFZY37rc6CNOppXziWNHnmWx77syr/j1Vu27Yk8PzavUxtBkgnhZXHz
         01cQ==
X-Gm-Message-State: AO0yUKWDe7+myGBn0s+NQWdV8L1pwXLSH1TK9geXeIW/oP/Bpl7HvwUa
        cxLQc3g+PxNEMFMltdG8Xg3dxQ==
X-Google-Smtp-Source: AK7set+n8mvzI5yKXSAOBEDOY7oMYc1PI9SZkjH+Yzxzcfc5Efqqh4ncsKDNKD3w8M//fRznmqDo+w==
X-Received: by 2002:a7b:cc8d:0:b0:3e0:98c:dd93 with SMTP id p13-20020a7bcc8d000000b003e0098cdd93mr1766040wma.29.1676376666808;
        Tue, 14 Feb 2023 04:11:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003dc433355aasm18391819wmo.18.2023.02.14.04.11.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Feb 2023 04:11:06 -0800 (PST)
Message-ID: <3e3a6d8c-cb00-39bd-f14d-65990972e0b4@linaro.org>
Date:   Tue, 14 Feb 2023 13:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/2] dt-bindings: rtc: nxp,pcf8563: add
 quartz-load-femtofarads for pcf85263 and pcf85363
Content-Language: en-US
To:     Javier Carrasco Cruz <javier.carrasco@wolfvision.net>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Alessandro Zummo <a.zummo@towertech.it>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Riesch <michael.riesch@wolfvision.net>
References: <20230213095018.2255225-1-javier.carrasco@wolfvision.net>
 <12dc51e4-622e-4a26-8bde-2795d77ce36e.e0c24246-04d4-485f-8d5f-1cc8fbefd095.f8cc75cd-465e-4339-8415-7d994963b841@emailsignatures365.codetwo.com>
 <20230213095018.2255225-3-javier.carrasco@wolfvision.net>
 <Y+pur70KB7wWRCCi@mail.local>
 <1145ccf7-ffe0-533e-45ef-5576a54e4531@wolfvision.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1145ccf7-ffe0-533e-45ef-5576a54e4531@wolfvision.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 14/02/2023 12:41, Javier Carrasco Cruz wrote:
> Hello,
> 
> Sorry for the previous mail in html format with annoying signatures.
> 
>> Hello,
>>
>> Krzysztof's confusion is because you are changing the binding for
>> nxp,pcf8563 while adding support for the nxp,pcf85263/nxp,pcf85363
> 
> If that is ok I would propose a new bindings file nxp,pcf85363 for 
> pcf85263 and pcf85363 in the next version.

Could be or still could be fixed in this binding. Indeed my comment in
the driver came from confusion that there are two drivers but one
binding. Having two bindings might be simpler and more readable in such
case.

Best regards,
Krzysztof

