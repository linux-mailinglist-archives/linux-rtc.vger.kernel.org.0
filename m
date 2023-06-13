Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD8B72EB95
	for <lists+linux-rtc@lfdr.de>; Tue, 13 Jun 2023 21:06:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235289AbjFMTGt (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Tue, 13 Jun 2023 15:06:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjFMTGs (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Tue, 13 Jun 2023 15:06:48 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37163199A
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 12:06:47 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9823de726c3so167673366b.0
        for <linux-rtc@vger.kernel.org>; Tue, 13 Jun 2023 12:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686683205; x=1689275205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SSQ2Ofm/5XwGv6mSESlDU0Nj2cG4DNgNPbhJQeoIQpY=;
        b=QSiA3oWxQopV30s9esmyHII8qfyptsy4AJ77FmiljXjuMB+0bljKoCZOckLJ5XFNq5
         2H8GC2BdnKMUUU6vddQuN5mLZnpgeDwQ7vDBRu2hEEwvmTwFVL3qHucJ2YRJ7BI/qXku
         A9t/uMT8TPCRFrnGAUqA1a94Nxz9hwBspi3yqDAUAb9TBk0m6D/gyKGN7hJcld8gVqkR
         /E1dAJGQAGczRh7++GsflHxD6eHgZNnVmywiBKaqV22yAMD7Twy13+JdUTzyeMOBS0WN
         HbOu4DgKNf4oA2YaCcmJvX5FWYt6HTrswBfo8/ykrCK533CHFxjBP1lT83O5HjamNoFJ
         qvBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686683205; x=1689275205;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SSQ2Ofm/5XwGv6mSESlDU0Nj2cG4DNgNPbhJQeoIQpY=;
        b=CTVSZ2EsvZNmkd9+FooR+rDY++1nqGq5cxND1d6BvfwnOROkHT4xjk/aIPNjaqVsf6
         HOUxeRNNHUjtc6zq6io7fvLCJoiuHs2H738otf3vZw9JzCRWG/a4WJTXthifLxSkoc8O
         CK4K8QpnIRDiWMr3IsGYclH82LP3WdNCIO8lSn0A5XHEDDG5sMCndAPVNOF3ncE91qHx
         aKcfD2Zc8IpJ7hBlyuZfUJMvn7MCxZOs0n8BEcCa/uc/2IKG9Mcwa2jbLV1BEAjCuMmW
         FeElVAr/x9JYvtc350YtUO1OmyKLD+vRlKA1r+ijfwz5164CCVDv8DRfnl1/ExIMQR8P
         Nd3Q==
X-Gm-Message-State: AC+VfDyE8u6SDxHEqkbvHjrJc1Troud3wtojK0i5bGCOIZ7204+hrVRG
        gVdvPR9Dp2o2lhWfdN6UnifzBQ==
X-Google-Smtp-Source: ACHHUZ4cw2V0nsGESs9QYxJaXsXNVZS7vmLLuxbygQj5JAHQqeGBOQrgl1IoPhdeGZBViBjevxGozQ==
X-Received: by 2002:a17:907:86a4:b0:970:1a68:bacc with SMTP id qa36-20020a17090786a400b009701a68baccmr15992858ejc.67.1686683205725;
        Tue, 13 Jun 2023 12:06:45 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id rs15-20020a170907036f00b009823e62ca91sm1130002ejb.189.2023.06.13.12.06.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 12:06:45 -0700 (PDT)
Message-ID: <89fb41d1-9cf8-cdab-e4ae-d5eef480242e@linaro.org>
Date:   Tue, 13 Jun 2023 21:06:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/8] dt-bindings: rtc: Move isil,isl12022 from
 trivial-rtc.yaml into own schema file
Content-Language: en-US
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-rtc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230612113059.247275-1-linux@rasmusvillemoes.dk>
 <20230613130011.305589-1-linux@rasmusvillemoes.dk>
 <20230613130011.305589-3-linux@rasmusvillemoes.dk>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613130011.305589-3-linux@rasmusvillemoes.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 13/06/2023 15:00, Rasmus Villemoes wrote:
> Move the isil,isl12022 RTC bindings from trivial-rtc.yaml into its own
> intersil,isl12022.yaml file, in preparation for adding more bindings.
> 
> Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> ---
>  .../bindings/rtc/intersil,isl12022.yaml       | 45 +++++++++++++++++++
>  .../devicetree/bindings/rtc/trivial-rtc.yaml  |  2 -
>  2 files changed, 45 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/rtc/intersil,isl12022.yaml
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

