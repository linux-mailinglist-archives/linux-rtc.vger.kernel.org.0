Return-Path: <linux-rtc-owner@vger.kernel.org>
X-Original-To: lists+linux-rtc@lfdr.de
Delivered-To: lists+linux-rtc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF2B618540
	for <lists+linux-rtc@lfdr.de>; Thu,  3 Nov 2022 17:50:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbiKCQuC (ORCPT <rfc822;lists+linux-rtc@lfdr.de>);
        Thu, 3 Nov 2022 12:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231849AbiKCQtp (ORCPT
        <rfc822;linux-rtc@vger.kernel.org>); Thu, 3 Nov 2022 12:49:45 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8628CFF4;
        Thu,  3 Nov 2022 09:48:56 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id C354885183;
        Thu,  3 Nov 2022 17:48:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1667494135;
        bh=6XxFcLsxBc6TFkvSDCM7pp2KEdFZoXPI+8fuOfymsZY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=nrpW3XGurEIJtr+7EGhdATNW2m6f6hPUfCNJoI9zXdAhvC8hOsJatOxpXCg954FfN
         Fg/vyDoto096JEDzl3IlrFdNfdK1I01+xJIYUm9wCmfLD2PrSIVceuq/klyYBgU8aH
         bFEx4CvD1eC4V48W2bIe8HJsMKsxoSYR2X0K29sB1/IpWFnYSqlZcSemknICzy34Di
         mlrn9/Dt2bIetywT/x9o0VJcUPp0i1SKhDpUYfH8rSlAIMm4fXbXLx+Oq9Vffv229z
         FeshZtd4Q2yJM/mCNrcMPzQ1Bw3OisAhGnZuenp8IYyhyNWbCuXdTKoA+caanSLSHW
         NfKWJKaRS65+g==
Message-ID: <b0f752a3-84ac-f6ef-a251-7dd265015d8e@denx.de>
Date:   Thu, 3 Nov 2022 17:48:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 1/2] dt-bindings: rtc: m41t80: Convert text schema to YAML
 one
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-rtc@vger.kernel.org
References: <20221102225943.157344-1-marex@denx.de>
 <abbccd73-7e49-b70b-d552-c1ff9426ea8c@linaro.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <abbccd73-7e49-b70b-d552-c1ff9426ea8c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-rtc.vger.kernel.org>
X-Mailing-List: linux-rtc@vger.kernel.org

On 11/3/22 14:40, Krzysztof Kozlowski wrote:

[...]

>> diff --git a/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
>> new file mode 100644
>> index 0000000000000..7f31a22caec9b
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/rtc/rtc-m41t80.yaml
> 
> Filename based on compatibles (more or less), so could be:
> st,m41t80.yaml
> or:
> st,m41txx.yaml
> 
> The "rtc" name can be skipped as it is implied from subsystem folder,
> unless st,m41txx is a name of some SoC?

It's dedicated I2C RTC, a discrete soic8 chip with optional coin cell 
battery.

We cannot really call it m41txx because there are other m41txx chips 
with different register layouts and thus different RTC drivers:

next$ ls -1 drivers/rtc/*m41t*
drivers/rtc/rtc-m41t80.c
drivers/rtc/rtc-m41t93.c
drivers/rtc/rtc-m41t94.c

The m41t80 is a sane choice, the m41t80 was the first supported, the 
other chips are just compatible to it.

Whether I should drop the rtc- prefix or not, I will defer that 
preference to Alexandre .

[...]
