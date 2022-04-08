Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C30F4F9980
	for <lists+linux-rtc@lfdr.de>; Fri,  8 Apr 2022 17:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237618AbiDHPbj (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Fri, 8 Apr 2022 11:31:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237597AbiDHPbf (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Fri, 8 Apr 2022 11:31:35 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E652E11DD10
        for <linux-rtc@vger.kernel.org>; Fri,  8 Apr 2022 08:29:31 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id b19so13423611wrh.11
        for <linux-rtc@vger.kernel.org>; Fri, 08 Apr 2022 08:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ifY6DMbLg1SCliDlEYY8vn7YQNz7rwzE6gWMsXWpwWQ=;
        b=f+pyN4QcTJS1ikUlp6zjJcPGoEm4rBGxHM19/nqQZbVxnOqEcOk2tnU1AWTctJfUBJ
         fv/a+ioFkF8LckXVZPc4njJ05ACyEe7V2pw8eBC9HuIGeKsEUjJtdKrcOq5XKn/Nedgy
         MHpAJG7Ww/lDRZHMBeJj3zDtNFQrJjDPZv2aki1LdrTy1FIF3azC8RVqVNXxL/yCBmMX
         AUV/MQTx+o96TemNGq3MEXkq+vSI2R841mjlTLWdta3s3sw1pNv/75mudQVfVyEGZyBa
         0F+N0emulepgjY3lCG0t36N9cFBgVe/dxYBjr8T5HozlaUYA0BJKml00E+I5AQk+aWOM
         RGVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ifY6DMbLg1SCliDlEYY8vn7YQNz7rwzE6gWMsXWpwWQ=;
        b=k1M5OS2QaSv3S0cUiQViVghn5m17kC4RcHl/DndYucBfO048lTZKnKTG69yDsK2daQ
         hnr4GJnGTKXE8ss0hbtFGS3bY+W0BEWXuSF8LF0vgBd928HLl1pTKRHobV3WE49oZprk
         qOxsRYSaw6g6IYEZC9l/Co1FWfG1fBWMFJ4Htiov62lAM7qRMXMbLvbdfEO+iEWlM1RP
         fC1itCPQwE+6G8i4mUpjNAGD5HXeRy7dfBWLRp9jvBHpRrVen5vZBa4td3QfI+9GDxIB
         fvFyeoq5k20Zta/LJ/HqLuT4ixBfA6MtBifaOYxipsCzKhE4jBPkfu8+/YtYrpWp0vlW
         ACkA==
X-Gm-Message-State: AOAM533sIY+15T5akLS1H42UWBKZ1ndZYahVTyIOkL4dUseWsuxiuW8F
        SAl55/aXtvycui5yuHC5idzaLg==
X-Google-Smtp-Source: ABdhPJze7wG69pOLr7bONpv65bzq93TZexBOiF5c8eNlAqorPQ/UAQk7C54nPkcIOHDXC/mmjbKaaw==
X-Received: by 2002:a05:6000:1848:b0:204:e92:5af6 with SMTP id c8-20020a056000184800b002040e925af6mr14917867wri.180.1649431770416;
        Fri, 08 Apr 2022 08:29:30 -0700 (PDT)
Received: from [192.168.2.222] ([51.37.209.28])
        by smtp.gmail.com with ESMTPSA id p14-20020a05600c1d8e00b0038dbb5ecc8asm10965530wms.2.2022.04.08.08.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Apr 2022 08:29:29 -0700 (PDT)
Message-ID: <cc11d576-3670-ff0a-e0a1-e92780a04c2a@conchuod.ie>
Date:   Fri, 8 Apr 2022 16:29:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 0/7] Add rtc refclk support for PolarFire SoC
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        mturquette@baylibre.com, sboyd@kernel.org, aou@eecs.berkeley.edu,
        paul.walmsley@sifive.com, palmer@rivosinc.com,
        a.zummo@towertech.it, alexandre.belloni@bootlin.com,
        robh+dt@kernel.org, krzk+dt@kernel.org
Cc:     daire.mcnamara@microchip.com, linux-rtc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
References: <20220408143646.3693104-1-conor.dooley@microchip.com>
 <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <1fa15b36-7a84-e0ac-2c56-d6a2bec566ff@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org



On 08/04/2022 15:57, Krzysztof Kozlowski wrote:
> On 08/04/2022 16:36, Conor Dooley wrote:
>> Hey,
>> As I mentioned in my fixes for 5.18 [0], found out that the reference
>> clock for the rtc is actually missing from the clock driver (and the
>> dt binding).
>>
>> Currently the mpfs clock driver uses a reference clock called the
>> "msspll", set in the device tree, as the parent for the cpu/axi/ahb
>> (config) clocks. The frequency of the msspll is determined by the FPGA
>> bitstream & the bootloader configures the clock to match the bitstream.
>> The real reference is provided by a 100 or 125 MHz off chip oscillator.
>>
>> However, the msspll clock is not actually the parent of all clocks on
>> the system - the reference clock for the rtc/mtimer actually has the
>> off chip oscillator as its parent.
>>
>> This series enables reading the rate of the msspll clock, converts
>> the refclock in the device tree to the external reference & adds
>> the missing rtc reference clock.
>>
>> I assume it is okay not to add fixes tags for the rtc dt binding?
>> Since the clock was previously missing, the binding is wrong, but
>> idk if that qualifies as a fix?
> 
> Usually ABI breakage, even if accepted, should be be tagged as fix
> because it is clearly then a break of other peoples' trees...
> 

That means either a) do something messy in the clock driver or b) mark
the whole series as fixes (and roll it into [0]).

The second option seems far more sensible to me, do you agree?
